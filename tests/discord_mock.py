# Local mock of the Discord gateway and REST API for tests/discord_test.idk (port 4444, TLS 1.3)
import socket, ssl, hashlib, base64, struct, threading, json, time
GUID = b"258EAFA5-E914-47DA-95CA-5AD5B9DC11B5"
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.minimum_version = ssl.TLSVersion.TLSv1_3
ctx.load_cert_chain("tests/tls13_data/ec.crt", "tests/tls13_data/ec.key")
def frame(op, payload, fin=1):
    h = bytes([(fin << 7) | op]); n = len(payload)
    if n < 126: h += bytes([n])
    elif n < 65536: h += bytes([126]) + struct.pack(">H", n)
    else: h += bytes([127]) + struct.pack(">Q", n)
    return h + payload
def read_frame(f):
    b = f.read(2)
    if len(b) < 2: return None
    op = b[0] & 15; ln = b[1] & 127
    if ln == 126: ln = struct.unpack(">H", f.read(2))[0]
    elif ln == 127: ln = struct.unpack(">Q", f.read(8))[0]
    mask = f.read(4) if b[1] & 128 else b"\0\0\0\0"
    data = bytearray(f.read(ln))
    for i in range(len(data)): data[i] ^= mask[i & 3]
    return op, bytes(data)
state = {"connections": 0}
def send_json(f, obj): f.write(frame(1, json.dumps(obj).encode()))
def gateway(f, hdrs):
    acc = base64.b64encode(hashlib.sha1(hdrs["sec-websocket-key"].encode() + GUID).digest())
    f.write(b"HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " + acc + b"\r\n\r\n")
    state["connections"] += 1
    first = state["connections"] == 1
    send_json(f, {"op": 10, "d": {"heartbeat_interval": 1000}})
    fr = read_frame(f)
    print("IDENT", fr[1], flush=True)
    ident = json.loads(fr[1])
    assert ident["op"] == 2 and ident["d"]["token"] == "test-token" and ident["d"]["intents"] == 33280, ident
    send_json(f, {"t": "READY", "s": 1, "op": 0, "d": {"session_id": "abc"}})
    if not first: time.sleep(0.3); return
    send_json(f, {"t": "MESSAGE_CREATE", "s": 2, "op": 0, "d": {"id": "1", "channel_id": "424242", "guild_id": "7",
        "content": "!ping \"quoted\" line\nnext", "author": {"id": "55", "username": "karac"}}})
    beats = 0
    while True:
        fr = read_frame(f)
        if fr is None: return
        op, data = fr
        if op == 8: return
        if op == 1:
            msg = json.loads(data)
            assert msg["op"] == 1
            beats += 1
            send_json(f, {"op": 11})
            if beats == 2:
                send_json(f, {"t": "MESSAGE_CREATE", "s": 3, "op": 0, "d": {"id": "2", "channel_id": "424242",
                    "content": "heartbeat seen", "author": {"id": "56", "username": "x", "bot": False}}})
                time.sleep(0.2)
                send_json(f, {"op": 9, "d": False})
                time.sleep(0.5)
                return
def handle(conn):
    f = conn.makefile("rwb", buffering=0)
    try:
        line = f.readline()
        if not line: return
        method, path, _ = line.decode().split(" ", 2)
        hdrs = {}
        while True:
            h = f.readline().decode().strip()
            if not h: break
            k, v = h.split(":", 1); hdrs[k.lower()] = v.strip()
        body = f.read(int(hdrs.get("content-length", 0))) if "content-length" in hdrs else b""
        if path.startswith("/gateway"): gateway(f, hdrs); return
        if method == "POST" and path == "/api/v10/channels/424242/messages":
            assert hdrs["authorization"] == "Bot test-token", hdrs
            assert hdrs["user-agent"].startswith("DiscordBot"), hdrs
            assert json.loads(body)["content"] == 'pong "quoted"', body
            r = b'{"id":"9"}'
            f.write(b"HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nContent-Length: %d\r\nConnection: close\r\n\r\n" % len(r) + r)
        else:
            f.write(b"HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\nConnection: close\r\n\r\n")
    except Exception as e:
        import traceback; traceback.print_exc(); print("mock error", repr(e), flush=True)
    finally:
        try: conn.close()
        except Exception: pass
s = socket.socket(); s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1); s.bind(("127.0.0.1", 4444)); s.listen(5)
print("listening 4444", flush=True)
while True:
    c, _ = s.accept()
    try: c = ctx.wrap_socket(c, server_side=True)
    except Exception as e: print("tls error", e, flush=True); continue
    threading.Thread(target=handle, args=(c,), daemon=True).start()
