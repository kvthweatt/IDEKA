"""Open valid IDEKA over stdio and check that the LSP emits no diagnostics."""

import json
import os
from pathlib import Path
import queue
import subprocess
import sys
import threading
import time


ROOT = Path(__file__).resolve().parents[2]


def read_messages(stream, messages):
    try:
        while True:
            headers = {}
            while line := stream.readline():
                if not line.strip():
                    break
                name, value = line.decode("ascii").split(":", 1)
                headers[name.lower()] = value.strip()
            if not headers:
                return
            messages.put(json.loads(stream.read(int(headers["content-length"]))))
    finally:
        messages.put(None)


def main():
    with subprocess.Popen(
        [sys.executable, str(ROOT / "scripts/flsp.py")],
        cwd=ROOT,
        env={**os.environ, "IDEKA_SRCDIR": str(ROOT)},
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    ) as server:
        messages = queue.Queue()
        threading.Thread(target=read_messages, args=(server.stdout, messages), daemon=True).start()

        def send(method, params, **extra):
            body = json.dumps(dict(jsonrpc="2.0", method=method, params=params, **extra)).encode()
            server.stdin.write(f"Content-Length: {len(body)}\r\n\r\n".encode() + body)
            server.stdin.flush()

        def receive(match):
            deadline = time.monotonic() + 10
            while time.monotonic() < deadline:
                try:
                    message = messages.get(timeout=max(0, deadline - time.monotonic()))
                except queue.Empty:
                    break
                if message is None:
                    raise RuntimeError("server closed stdout before the expected response")
                if match(message):
                    return message
            raise TimeoutError("server did not send the expected response")

        try:
            send("initialize", {"processId": None, "rootUri": ROOT.as_uri(), "capabilities": {}}, id=1)
            initialized = receive(lambda message: message.get("id") == 1)
            if "result" not in initialized:
                raise RuntimeError(initialized)
            print("LSP initialize succeeded", flush=True)
            send("initialized", {})
            source = ROOT / "examples/helloworld.idk"
            uri = source.as_uri()
            send("textDocument/didOpen", {"textDocument": {
                "uri": uri, "languageId": "ideka", "version": 1,
                "text": source.read_text(encoding="utf-8"),
            }})
            reply = receive(lambda message: message.get("method") == "textDocument/publishDiagnostics"
                            and message.get("params", {}).get("uri") == uri)
            diagnostics = reply["params"]["diagnostics"]
            for diagnostic in diagnostics:
                print(diagnostic["message"])
            return bool(diagnostics)
        finally:
            if server.poll() is None:
                server.terminate()
                try:
                    server.wait(timeout=3)
                except subprocess.TimeoutExpired:
                    server.kill()


if __name__ == "__main__":
    sys.exit(main())
