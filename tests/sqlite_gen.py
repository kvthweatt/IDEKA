# Generates SQLite fixtures (tests/sqlite_fx_N.db) and the expected dump (tests/sqlite_fx.exp) for tests/sqlite_test.idk.
import os, random, sqlite3
random.seed(4242)
here = os.path.dirname(os.path.abspath(__file__))

INTS = [0, 1, -1, 127, 128, -128, -129, 255, 256, 32767, 32768, -32768, 8388607, 8388608, -8388608,
        2147483647, 2147483648, -2147483648, -2147483649, 2**40, -2**40, 2**47, 2**47 + 1, -2**47, 2**48,
        2**62, -2**62, 2**63 - 1, -2**63 + 1]

def build(path, page_size, nbig):
    if os.path.exists(path):
        os.remove(path)
    c = sqlite3.connect(path)
    c.execute("pragma page_size=%d" % page_size)
    c.execute("create table t_small(id integer primary key, a integer, b text, c, d blob)")
    for i, v in enumerate(INTS):
        c.execute("insert into t_small values(?,?,?,?,?)", (i + 1, v, "v%d" % i, v / 1000.0 if abs(v) < 10**9 else 0.5, bytes([i, 255 - i, 0, 7])))
    c.execute("insert into t_small values(100, null, null, null, null)")
    c.execute("insert into t_small values(101, 5, 'héllo 世界', -2.25, x'')")
    c.execute("create table t_big(a integer, b text, c integer)")
    for i in range(nbig):
        c.execute("insert into t_big values(?,?,?)", (i, "row %d %s" % (i, "x" * random.randrange(0, 40)), random.randrange(-10**6, 10**6)))
    c.execute("delete from t_big where a % 3 = 1")
    c.execute("create index t_big_a on t_big(a)")
    c.execute("create table t_ovf(k integer, t text, b blob)")
    for n in [0, 100, 1000, 4000, 4070, 4100, 5000, 12000, 50000, 200000]:
        c.execute("insert into t_ovf values(?,?,?)", (n, "".join(chr(97 + (j * 7 + n) % 26) for j in range(n)), bytes((j * 13 + n) % 256 for j in range(n))))
    c.execute("create table t_empty(a, b)")
    c.execute("create table t_mixed(a, b, c)")
    for i in range(50):
        c.execute("insert into t_mixed values(?,?,?)", (i if i % 2 else "s%d" % i, i * 1.5 if i % 3 == 0 else None, bytes(range(i % 20))))
    c.commit()
    c.close()

def val(v, ipk):
    if ipk or v is None:
        return b"N"
    if isinstance(v, int):
        return b"i%d" % v
    if isinstance(v, float):
        return b"r%d" % int(v * 1000 + (0.5 if v >= 0 else -0.5))
    if isinstance(v, str):
        v = v.encode()
        if len(v) <= 64:
            return b"t%d:" % len(v) + v
        return b"t%d:" % len(v) + v[:32] + b"..." + v[-32:]
    h = v[:8].hex().encode()
    return b"b%d:" % len(v) + h

def dump(path, n):
    c = sqlite3.connect(path)
    out = [b"DB %d\n" % n]
    for name, root in c.execute("select name, rootpage from sqlite_master where type='table' order by rowid").fetchall():
        out.append(b"T %s %d\n" % (name.encode(), root))
        cols = c.execute("pragma table_info(%s)" % name).fetchall()
        ipk = len(cols) > 0 and cols[0][5] == 1 and cols[0][2].upper() == "INTEGER"
        for row in c.execute("select rowid, * from %s order by rowid" % name):
            line = b"%d" % row[0]
            for j, v in enumerate(row[1:]):
                line += b"|" + val(v, ipk and j == 0)
            out.append(line + b"\n")
    c.close()
    return b"".join(out)

exp = b""
for n, (ps, nb) in enumerate([(4096, 3000), (1024, 20000), (512, 6000)]):
    p = os.path.join(here, "sqlite_fx_%d.db" % n)
    build(p, ps, nb)
    exp += dump(p, n)
open(os.path.join(here, "sqlite_fx.exp"), "wb").write(exp)
print("ok", len(exp))
