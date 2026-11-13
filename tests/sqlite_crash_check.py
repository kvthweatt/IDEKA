# Crash recovery: runs sqlite_crash_a (leaves a hot journal), then lets real SQLite and IDEKA each recover a copy.
import os, shutil, sqlite3, subprocess, sys
here = os.path.dirname(os.path.abspath(__file__))
root = os.path.dirname(here)
exe_a, exe_b = sys.argv[1], sys.argv[2]
for f in ["sqlite_c.db", "sqlite_c.db-journal", "sqlite_c1.db", "sqlite_c1.db-journal", "sqlite_c2.db", "sqlite_c2.db-journal"]:
    p = os.path.join(here, f)
    if os.path.exists(p): os.remove(p)
subprocess.run([exe_a], cwd=root, check=True)
j = os.path.join(here, "sqlite_c.db-journal")
print("hot journal present:", os.path.exists(j), os.path.getsize(j) if os.path.exists(j) else 0)
ok = os.path.exists(j)
for n in ("1", "2"):
    shutil.copy(os.path.join(here, "sqlite_c.db"), os.path.join(here, "sqlite_c%s.db" % n))
    shutil.copy(j, os.path.join(here, "sqlite_c%s.db-journal" % n))
# real SQLite recovers copy 1
c = sqlite3.connect(os.path.join(here, "sqlite_c1.db"))
rows = c.execute("select count(*) from t").fetchone()[0]
changed = c.execute("select count(*) from t where s like 'changed%'").fetchone()[0]
tabs = [r[0] for r in c.execute("select name from sqlite_master")]
print("SQLite recovered copy: rows", rows, "changed", changed, "tables", tabs, c.execute("pragma integrity_check").fetchall())
ok = ok and rows == 300 and changed == 0 and tabs == ["t"]
c.close()
# IDEKA recovers copy 2
out = subprocess.run([exe_b], cwd=root, capture_output=True, text=True).stdout
print("IDEKA recovered copy:", out.replace("\n", " | "))
ok = ok and "rows 300" in out and "tables 1" in out
c = sqlite3.connect(os.path.join(here, "sqlite_c2.db"))
print("integrity after IDEKA recovery:", c.execute("pragma integrity_check").fetchall(), "journal gone:", not os.path.exists(os.path.join(here, "sqlite_c2.db-journal")))
ok = ok and c.execute("pragma integrity_check").fetchall() == [("ok",)] and not os.path.exists(os.path.join(here, "sqlite_c2.db-journal"))
print("PASS" if ok else "FAIL")
sys.exit(0 if ok else 1)