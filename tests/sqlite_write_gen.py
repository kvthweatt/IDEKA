# Writes tests/sqlite_write.sql (one statement per line) for tests/sqlite_write_test.idk.
import os, random
random.seed(777)
here = os.path.dirname(os.path.abspath(__file__))
L = []
def add(s):
    assert "\n" not in s
    L.append(s)

def text(n):
    return "".join(random.choice("abcdefghijklmnopqrstuvwxyz ") for _ in range(n))

def hexb(n):
    return "x'" + bytes(random.randrange(256) for _ in range(n)).hex() + "'"

add("create table t1(id integer primary key, a integer, b text, c real, d blob)")
add("create table t2(x, y, z)")
add("create table if not exists t3(k integer primary key, v blob)")
add("create table [t4 x](q)")
add("create table if not exists t3(k integer primary key, v blob)")

ids = list(range(1, 3001))
random.shuffle(ids)
for i in range(0, len(ids), 25):
    rows = []
    for k in ids[i:i + 25]:
        rows.append("(%d, %d, '%s', %s, %s)" % (k, random.randrange(-10**9, 10**9), text(random.randrange(0, 120)).replace("'", "''"),
                    repr(round(random.uniform(-1000, 1000), 3)), hexb(random.randrange(0, 12))))
    add("insert into t1 values " + ", ".join(rows))

for i in range(2000):
    kind = i % 4
    v = [str(random.randrange(-10**6, 10**6)), "'" + text(random.randrange(0, 40)) + "'", "null", repr(round(random.uniform(-5, 5), 2))][kind]
    add("insert into t2 values (%d, %s, '%s')" % (i, v, text(random.randrange(0, 30))))

for n in [0, 1, 100, 3000, 4000, 4050, 4070, 4081, 4090, 4100, 5000, 8000, 20000, 60000]:
    add("insert into t3 values (%d, %s)" % (n + 1, hexb(n)))
add("insert into t3 (v) values (x'0102')")
add("insert into t3 (k, v) values (null, x'03')")
add("insert into [t4 x] values ('42'), (42), ('abc'), (null)")

add("update t1 set b = b || '-upd' where id % 7 = 0")
add("update t1 set a = a + 1 where id < 100")
add("update t1 set id = id + 10000 where id % 50 = 0")
add("update t1 set d = x'" + "ab" * 3000 + "' where id % 300 = 5")
add("update t3 set v = x'00ff' where k % 3 = 0")
add("update t2 set y = 'changed' where x between 100 and 199")

add("delete from t1 where id between 500 and 1500")
add("delete from t2 where x % 3 = 0")
add("delete from t3 where k % 2 = 0")
add("delete from t1 where a > 500000000")
for i in range(300):
    add("insert into t1 (a, b) values (%d, 'after delete %d')" % (i, i))
add("delete from t2")
for i in range(700):
    add("insert into t2 values (%d, '%s', %d)" % (i, text(random.randrange(0, 60)), i * 3))
add("delete from t1 where id > 0")
for i in range(1200):
    add("insert into t1 values (%d, %d, '%s', %d.5, null)" % (i * 2 + 1, i, text(random.randrange(0, 200)), i))
add("update t1 set a = 0, b = null where id > 1000")
add("delete from t3")
add("insert into t3 values (1, " + hexb(30000) + ")")
add("delete from [t4 x] where q is null")

open(os.path.join(here, "sqlite_write.sql"), "w").write("\n".join(L) + "\n")
print("statements", len(L))
