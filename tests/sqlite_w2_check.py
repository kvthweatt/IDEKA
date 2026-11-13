# Differential DML test: random statements run by Python sqlite3 and by build/sqlite_w2_test; compares per-statement
# outcomes, final table contents, and PRAGMA integrity_check on the file the IDEKA engine wrote.
import sqlite3, subprocess, sys, random, os
seed = int(sys.argv[1]) if len(sys.argv) > 1 else 1
N = int(sys.argv[2]) if len(sys.argv) > 2 else 300
R = random.Random(seed)
setup = [
 "create table t1(a integer primary key autoincrement, b text not null default 'd', c integer unique, d real check (d is null or d < 1000))",
 "create table t2(x integer, y text, z blob, primary key(x, y))",
 "create index i1 on t1(b)",
 "create index i2 on t2(y desc, x)",
 "create table t3(k text unique, v integer default 7)",
]
def lit():
    k = R.randint(0, 6)
    if k == 0: return 'null'
    if k == 1: return str(R.randint(-5, 30))
    if k == 2: return repr(round(R.uniform(-50, 1200), 2))
    if k == 3: return "'" + ''.join(R.choice('abcxyz') for _ in range(R.randint(0, 6))) + "'"
    if k == 4: return "'" + 'q' * R.randint(0, 3000) + "'" if R.random() < .05 else "'%s'" % R.choice(['a', 'b', 'c'])
    return str(R.randint(0, 12))
def conf(): return R.choice(['', '', 'or replace ', 'or ignore ', 'or abort ', 'or fail ', 'or rollback '])
def where():
    c = R.choice(['a', 'b', 'c', 'd'])
    return R.choice(['', ' where %s %s %s' % (c, R.choice(['=', '<', '>', '<=', '!=']), lit()), ' where %s is null' % c])
def stmt():
    k = R.randint(0, 12)
    if k <= 3:
        return "insert %sinto t1(%s) values(%s)" % (conf(), 'b,c,d', ','.join(lit() for _ in range(3)))
    if k == 4:
        return "insert %sinto t2 values(%s,%s,%s)" % (conf(), R.randint(0, 6), "'%s'" % R.choice('abc'), lit())
    if k == 5:
        return "insert %sinto t3(k,v) values(%s,%s)" % (conf(), "'%s'" % R.choice('abcdef'), lit())
    if k == 6:
        return "update %st1 set %s = %s%s" % (conf(), R.choice(['b', 'c', 'd', 'a']), lit(), where())
    if k == 7:
        return "update t1 set c = c + 1%s" % where()
    if k == 8: return "delete from t1" + where()
    if k == 9: return "delete from t2" + R.choice(['', ' where x = %d' % R.randint(0, 6)])
    if k == 10: return "insert into t3(k) select b from t1"
    if k == 11: return R.choice(['begin', 'commit', 'rollback', 'begin', 'commit'])
    return "update t3 set v = v * 2" + R.choice(['', " where k = 'a'"])
MODE = sys.argv[3] if len(sys.argv) > 3 else 'dml'
def ddl():
    k = R.randint(0, 11)
    n = R.randint(1, 3)
    if k == 0: return 'create index if not exists j%d on t1(c, b)' % n
    if k == 1: return 'create unique index if not exists u%d on t3(v, k)' % n
    if k == 2: return 'drop index if exists j%d' % n
    if k == 3: return 'drop index if exists u%d' % n
    if k == 4: return 'alter table t3 add column e%d integer default %d' % (R.randint(1, 4), R.randint(0, 9))
    if k == 5: return 'create view if not exists v%d as select a, b from t1 where c > %d' % (n, R.randint(0, 9))
    if k == 6: return 'drop view if exists v%d' % n
    if k == 7: return 'create table if not exists w%d(p integer primary key, q text)' % n
    if k == 8: return 'insert into w%d(q) select b from t1' % n
    if k == 9: return 'drop table if exists w%d' % n
    if k == 10: return 'alter table w%d rename to w%d' % (n, R.randint(1, 3))
    return 'insert into t1(b,c,d) select b || b, c * 3 + a, d from t1'
def big():
    k = R.randint(0, 9)
    if k <= 2: return "insert into t1(b,c,d) values('%s', %d, %d)" % ('z' * R.choice([1, 50, 900, 3000, 9000]) + str(R.randint(0, 99)), R.randint(0, 100000), R.randint(0, 999))
    if k == 3: return "insert or ignore into t1(b,c,d) select b || 'y', c + %d, d from t1 order by a" % R.randint(100000, 900000)
    if k == 4: return "delete from t1 where c %% %d = %d" % (R.randint(2, 7), R.randint(0, 1))
    if k == 5: return "update t1 set b = b || b where a %% %d = 0" % R.randint(3, 9)
    if k == 6: return "insert or replace into t3(k, v) select b, c from t1 where a %% %d = 0 order by a" % R.randint(2, 5)
    if k == 7: return "delete from t3 where v %% 3 = %d" % R.randint(0, 2)
    if k == 8: return R.choice(["create index if not exists j9 on t1(c)", "drop index if exists j9", "create index if not exists j8 on t1(b, c)", "drop index if exists j8"])
    return "update t1 set c = c + 1000000 where a %% %d = 1" % R.randint(2, 6)
def ovf():
    k = R.randint(0, 8)
    if k <= 2: return "insert into t1(b,c,d) values('%s', %d, %d)" % (R.choice('xyz') * R.choice([1, 300, 2100, 4200, 9000]) + str(R.randint(0, 99)), R.randint(0, 3000), R.randint(0, 999))
    if k == 3: return "insert or ignore into t1(b,c,d) select b || 'y', c + %d, d from t1 order by a" % R.randint(100, 3000)
    if k == 4: return "delete from t1 where c %% %d = %d" % (R.randint(2, 7), R.randint(0, 1))
    if k == 5: return "update t1 set b = b || 'k' where a %% %d = 0" % R.randint(2, 5)
    if k == 6: return "update t1 set c = c + 7 where a %% %d = 1" % R.randint(2, 4)
    if k == 7: return R.choice(["create index if not exists j9 on t1(c)", "drop index if exists j9", "create index if not exists j8 on t1(b, c)", "drop index if exists j8"])
    return "delete from t1 where a %% %d = %d" % (R.randint(2, 5), R.randint(0, 2))
stmts = setup + ([ovf() for _ in range(N)] if MODE == 'ovf' else [big() for _ in range(N)] if MODE == 'big' else [(ddl() if (MODE == 'ddl' and R.random() < 0.4) else stmt()) for _ in range(N)])
sels = ["select type, name, tbl_name, sql from sqlite_master order by name", "select * from sqlite_sequence", "select * from t1 order by a", "select * from t2 order by x, y", "select * from t3 order by k",
        "select * from t1 where b = 'a' order by a", "select count(*), sum(c) from t1"]
allq = stmts + sels
open('tests/sqlite_w2.sql', 'w').write('\n'.join(allq) + '\n')
for f in ('tests/sqlite_w2.db', 'tests/sqlite_w2.db-journal'):
    if os.path.exists(f): os.remove(f)
exp_path = 'tests/sqlite_w2_exp.db'
if os.path.exists(exp_path): os.remove(exp_path)
c = sqlite3.connect(exp_path, isolation_level=None)
def fmt(v):
    if v is None: return 'NULL'
    if isinstance(v, float): return 'r:' + c.execute('select cast(? as text)', (v,)).fetchone()[0]
    if isinstance(v, bytes): return "X'" + v.hex().upper() + "'"
    return str(v)
exp = []
for n, q in enumerate(allq, 1):
    exp.append('## %d' % n)
    try:
        cur = c.execute(q)
        if q.startswith('select'):
            exp.append('|'.join(d[0] for d in cur.description))
            for r in cur.fetchall(): exp.append('|'.join(fmt(v) for v in r))
        else: exp.append('OK')
    except sqlite3.Error:
        exp.append('ERROR')
        try: c.execute('rollback') if c.in_transaction is False and False else None
        except Exception: pass
out = subprocess.run(['build/sqlite_w2_test/sqlite_w2_test'], capture_output=True).stdout.decode('utf-8', 'replace').split('\n')
msgs = [l for l in out if l.startswith('#msg ')]
out = [l for l in out if not l.startswith('#msg ')]
while out and out[-1] == '': out.pop()
bad = 0
for i in range(max(len(exp), len(out))):
    a = exp[i] if i < len(exp) else '<none>'; b = out[i] if i < len(out) else '<none>'
    if a != b:
        n = max([int(x[3:]) for x in exp[:i + 1] if x.startswith('## ')] or [0])
        k = 0
        while k < min(len(a), len(b)) and a[k] == b[k]: k += 1
        print('seed %d stmt %d: %s\n  first diff at char %d (len exp %d, got %d)\n  expected: %s\n  got     : %s' % (seed, n, allq[n - 1][:200], k, len(a), len(b), a[max(0,k-40):k+40], b[max(0,k-40):k+40])); bad += 1; break
d = sqlite3.connect('tests/sqlite_w2.db')
print('integrity:', d.execute('pragma integrity_check').fetchall())
print('seed %d: %s' % (seed, 'MATCH' if bad == 0 else 'DIFF'))
