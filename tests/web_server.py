# Test server for tests/web_test.idk: HTTPS (TLS 1.3 only) with routes and a WebSocket echo at /ws
import socket, ssl, hashlib, base64, struct, threading
GUID = b"258EAFA5-E914-47DA-95CA-5AD5B9DC11B5"
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.minimum_version = ssl.TLSVersion.TLSv1_3
ctx.load_cert_chain("tests/tls13_data/ec.crt", "tests/tls13_data/ec.key")
def recv_line(f):
    return f.readline()
def frame(op, payload, fin=1, ):
    h = bytes([(fin << 7) | op])
    n = len(payload)
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
def handle(conn):
    f = conn.makefile("rwb", buffering=0)
    try:
        while True:
            line = f.readline()
            if not line: return
            method, path, _ = line.decode().split(" ", 2)
            hdrs = {}
            while True:
                h = f.readline().decode().strip()
                if not h: break
                k, v = h.split(":", 1); hdrs[k.lower()] = v.strip()
            body = f.read(int(hdrs.get("content-length", 0))) if "content-length" in hdrs else b""
            if path == "/ws":
                acc = base64.b64encode(hashlib.sha1(hdrs["sec-websocket-key"].encode() + GUID).digest())
                f.write(b"HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " + acc + b"\r\n\r\n")
                while True:
                    fr = read_frame(f)
                    if fr is None: return
                    op, data = fr
                    if op == 8: f.write(frame(8, data)); return
                    if op in (1, 2):
                        if data == b"big": f.write(frame(1, b"B" * 66000))
                        elif data == b"ping": f.write(frame(9, b"x") + frame(1, b"pong"))
                        elif data == b"frag":
                            f.write(frame(1, b"ab-", fin=0) + frame(9, b"mid") + frame(0, b"cd-", fin=0) + frame(0, b"efg", fin=1))
                        else: f.write(frame(op, data))
                continue
            if path == "/hello": r = b"hello world\n"; f.write(b"HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n" % len(r) + r)
            elif path == "/chunked":
                f.write(b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n6\r\nchunk1\r\n7\r\n-chunk2\r\n4\r\n-end\r\n0\r\n\r\n")
            elif path == "/echo": f.write(b"HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n" % len(body) + body)
            elif path == "/big": r = b"A" * 60000; f.write(b"HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n" % len(r) + r)
            else: f.write(b"HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n")
    except Exception as e:
        print("server error", e)
    finally:
        conn.close()
s = socket.socket(); s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1); s.bind(("127.0.0.1", 4443)); s.listen(5)
print("listening 4443", flush=True)
while True:
    c, _ = s.accept()
    try: c = ctx.wrap_socket(c, server_side=True)
    except Exception as e: print("tls error", e); continue
    threading.Thread(target=handle, args=(c,), daemon=True).start()
