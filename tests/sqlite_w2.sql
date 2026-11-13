create table t1(a integer primary key autoincrement, b text not null default 'd', c integer unique, d real check (d is null or d < 1000))
create table t2(x integer, y text, z blob, primary key(x, y))
create index i1 on t1(b)
create index i2 on t2(y desc, x)
create table t3(k text unique, v integer default 7)
insert or abort into t1(b,c,d) values(12,1,97.4)
update t3 set v = v * 2 where k = 'a'
update t1 set c = c + 1 where d < null
insert or rollback into t1(b,c,d) values('yaz','zb','b')
insert into t1(b,c,d) values(null,8,null)
update or fail t1 set c = 'aybxx' where b > 9
insert into t2 values(3,'c',1)
insert or fail into t1(b,c,d) values(4,null,5)
commit
update or abort t1 set c = 305.2 where d != 'axbz'
update or fail t1 set c = 636.0 where c = 'yabyx'
update t1 set c = c + 1 where a <= null
commit
delete from t2 where x = 4
insert into t3(k) select b from t1
insert into t1(b,c,d) values('a',3,'c')
insert or ignore into t1(b,c,d) values('c',523.91,774.02)
delete from t2
update or rollback t1 set c = 'a' where d = 'cyybyx'
insert or ignore into t3(k,v) values('c',null)
delete from t1 where c is null
insert or abort into t1(b,c,d) values('a',8,4)
insert or rollback into t1(b,c,d) values(1,null,0)
update t1 set c = c + 1
update t3 set v = v * 2
insert or replace into t3(k,v) values('a',5)
insert or abort into t2 values(1,'c',760.25)
insert or ignore into t2 values(5,'b','aac')
update or replace t1 set a = 3 where c is null
insert or abort into t1(b,c,d) values('abaxba',2,'yzxyb')
insert into t3(k) select b from t1
update t3 set v = v * 2 where k = 'a'
insert or abort into t1(b,c,d) values(0,'yczzx',null)
rollback
insert into t1(b,c,d) values(null,38.41,null)
insert or replace into t2 values(5,'a','cbay')
insert or abort into t1(b,c,d) values(3,'c','b')
insert or replace into t1(b,c,d) values(null,22,'a')
insert into t3(k) select b from t1
update or replace t1 set a = null where c != 6
insert into t1(b,c,d) values(15,9,2)
insert or ignore into t3(k,v) values('b',793.07)
update or abort t1 set d = 10 where d is null
insert into t1(b,c,d) values(5,29,12)
update t3 set v = v * 2 where k = 'a'
delete from t2 where x = 4
insert or replace into t3(k,v) values('c',null)
insert into t2 values(6,'c',11)
update t1 set c = c + 1
update t1 set a = 12 where b is null
update t3 set v = v * 2 where k = 'a'
insert or abort into t1(b,c,d) values('a',406.11,655.56)
insert or ignore into t1(b,c,d) values(84.66,null,4)
insert or abort into t1(b,c,d) values(0,null,'')
update t3 set v = v * 2
insert into t1(b,c,d) values(9,'a','z')
insert into t1(b,c,d) values(1,'ycy',839.51)
insert into t3(k,v) values('b',5)
insert into t1(b,c,d) values(null,4,9)
insert or ignore into t3(k,v) values('d',448.19)
insert or replace into t1(b,c,d) values('a',218.99,'c')
begin
insert into t3(k) select b from t1
insert or replace into t3(k,v) values('b','a')
insert or replace into t1(b,c,d) values(null,4,null)
update t3 set v = v * 2 where k = 'a'
insert or fail into t1(b,c,d) values('a','ac',15)
update t3 set v = v * 2 where k = 'a'
insert or replace into t1(b,c,d) values(null,'c',null)
insert into t1(b,c,d) values(null,3,'')
insert or abort into t2 values(6,'a',1)
insert or fail into t1(b,c,d) values(null,888.41,566.58)
insert into t1(b,c,d) values('b',null,'a')
insert or rollback into t1(b,c,d) values(4,5,83.6)
delete from t1 where c is null
begin
update t3 set v = v * 2 where k = 'a'
delete from t2
insert or replace into t1(b,c,d) values('bazz',11,1)
insert into t3(k) select b from t1
update t1 set c = c + 1 where d is null
update t1 set c = c + 1
insert or ignore into t2 values(0,'c','aazc')
delete from t2
insert or replace into t1(b,c,d) values(4,'xbya',26)
insert into t1(b,c,d) values('c','zzbbc','xbzxc')
delete from t1
update t3 set v = v * 2 where k = 'a'
insert or abort into t1(b,c,d) values(12,14,815.7)
delete from t1 where c is null
update t1 set c = c + 1 where a = 'c'
insert into t1(b,c,d) values(483.44,'a','xzzcx')
delete from t1 where b is null
insert or rollback into t1(b,c,d) values(735.56,871.13,null)
insert or rollback into t1(b,c,d) values('c',11,null)
update t1 set c = c + 1 where b <= 6
insert or replace into t1(b,c,d) values('y','a','yxaz')
insert or replace into t2 values(1,'b',8)
insert into t1(b,c,d) values('a',null,9)
insert or rollback into t1(b,c,d) values(208.26,135.51,12)
insert or abort into t2 values(6,'b',10)
update t1 set c = c + 1
update t3 set v = v * 2
delete from t2
insert or rollback into t2 values(0,'a',null)
delete from t2
delete from t1 where c is null
insert or abort into t3(k,v) values('c','zcyc')
insert into t1(b,c,d) values('xccyx',928.86,9)
update t1 set c = c + 1
insert or fail into t2 values(4,'c',11)
delete from t1 where b is null
rollback
commit
update t1 set c = c + 1 where b is null
update or ignore t1 set d = 9 where a is null
insert into t3(k) select b from t1
insert or fail into t2 values(0,'b',10)
insert or fail into t1(b,c,d) values(6,4,2)
update t3 set v = v * 2
update t3 set v = v * 2
insert or replace into t3(k,v) values('f','zycbxc')
update t1 set c = c + 1
commit
update t1 set d = null where d is null
insert or fail into t1(b,c,d) values(null,'zcycb','b')
insert into t2 values(0,'c',8)
insert into t3(k) select b from t1
insert or ignore into t3(k,v) values('e','a')
insert or fail into t2 values(5,'c',8)
insert or replace into t2 values(4,'c',20)
delete from t1 where d is null
commit
insert into t3(k) select b from t1
insert or rollback into t1(b,c,d) values(9,'xb',4)
insert into t1(b,c,d) values(11,23,'c')
insert or abort into t1(b,c,d) values(524.24,3,2)
begin
insert or replace into t3(k,v) values('d',2)
commit
rollback
insert into t1(b,c,d) values(20,565.45,null)
insert into t1(b,c,d) values(null,9,null)
update t3 set v = v * 2
insert into t3(k) select b from t1
insert or ignore into t1(b,c,d) values(8,11,'c')
insert into t2 values(4,'c',1)
insert or ignore into t1(b,c,d) values(26,'bbb',4)
update t1 set c = c + 1
insert into t1(b,c,d) values(null,0,7)
insert or ignore into t3(k,v) values('e',1098.55)
update t1 set c = 0
delete from t2 where x = 3
insert into t1(b,c,d) values('caaya','a',925.99)
update t1 set c = null where d is null
insert or fail into t1(b,c,d) values('czc',752.0,10)
insert or abort into t1(b,c,d) values(9,17,'zyzy')
insert or replace into t1(b,c,d) values('a',8,'azczy')
begin
insert into t2 values(0,'a',null)
insert or rollback into t1(b,c,d) values('aazayx','b',null)
insert or abort into t1(b,c,d) values(null,'bxzxa',8)
insert into t2 values(2,'b',null)
insert into t2 values(6,'b',null)
rollback
insert or fail into t3(k,v) values('b',943.22)
update t3 set v = v * 2
insert into t3(k) select b from t1
insert into t2 values(3,'a','b')
insert or abort into t3(k,v) values('d','a')
insert into t3(k) select b from t1
update t1 set c = c + 1
insert or ignore into t3(k,v) values('e',71.73)
insert into t3(k,v) values('e',null)
insert or replace into t1(b,c,d) values(12,8,471.99)
insert or replace into t3(k,v) values('c',885.92)
delete from t1
insert or fail into t3(k,v) values('c',5)
delete from t2 where x = 0
insert or ignore into t2 values(3,'b',6)
insert or abort into t1(b,c,d) values(0,-2,'b')
update t3 set v = v * 2
commit
rollback
insert or rollback into t3(k,v) values('f',453.22)
update t1 set c = c + 1 where c != 'a'
insert into t3(k) select b from t1
insert or abort into t1(b,c,d) values(2,21,9)
insert or rollback into t1(b,c,d) values(null,'c',null)
insert or replace into t1(b,c,d) values(null,9,'a')
update t3 set v = v * 2
insert into t3(k) select b from t1
insert or abort into t1(b,c,d) values(6,null,'b')
rollback
insert into t1(b,c,d) values('a','zcy',25)
begin
insert or ignore into t2 values(1,'a',8)
update t3 set v = v * 2 where k = 'a'
delete from t1
insert or rollback into t3(k,v) values('d',null)
insert or replace into t1(b,c,d) values(11,0,'b')
delete from t1 where c is null
insert or abort into t2 values(3,'c',8)
update or abort t1 set d = 'by'
insert or fail into t2 values(0,'b',10)
delete from t2 where x = 0
update or ignore t1 set d = 12
update or replace t1 set a = 944.88 where c <= 5
update t1 set c = c + 1
insert into t1(b,c,d) values(4,1022.36,'b')
insert or abort into t2 values(2,'c','cxcxb')
begin
update or fail t1 set a = null
begin
insert or replace into t1(b,c,d) values(25,1,'zbaax')
delete from t2
delete from t1 where d is null
insert or fail into t1(b,c,d) values('c',1,805.69)
insert or ignore into t1(b,c,d) values(12,0,3)
insert into t3(k) select b from t1
insert into t3(k) select b from t1
insert or rollback into t1(b,c,d) values('',7,802.45)
update t1 set c = c + 1
update or abort t1 set c = 28 where c <= 8
update t1 set c = c + 1
insert or rollback into t1(b,c,d) values(10,1107.27,4)
insert or abort into t1(b,c,d) values(7,899.82,1)
insert or abort into t1(b,c,d) values(287.92,21,3)
insert into t2 values(3,'c',9)
insert or abort into t1(b,c,d) values(9,'b',299.74)
rollback
insert or ignore into t2 values(1,'b',698.76)
insert or replace into t1(b,c,d) values(6,9,7)
delete from t1
insert into t3(k) select b from t1
update t3 set v = v * 2
insert or abort into t3(k,v) values('d','ab')
insert or fail into t1(b,c,d) values(231.28,8,11)
insert or abort into t1(b,c,d) values(2,7,'b')
update or replace t1 set b = 0 where c is null
insert or replace into t1(b,c,d) values(10,5,701.42)
delete from t1 where d = null
insert into t3(k,v) values('a',1073.26)
insert or fail into t1(b,c,d) values('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq',null,1)
insert or replace into t2 values(1,'b','qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq')
insert into t1(b,c,d) values('zz',3,null)
insert into t3(k) select b from t1
insert or replace into t3(k,v) values('a','a')
insert or rollback into t3(k,v) values('f',2)
delete from t2 where x = 6
update t1 set a = 'b' where c is null
insert into t1(b,c,d) values('a',8,'ya')
insert or abort into t2 values(2,'c',541.54)
update or fail t1 set b = 5 where a is null
delete from t1
insert into t1(b,c,d) values('a','cccbbx',7)
update t1 set c = 319.12 where a is null
insert or ignore into t1(b,c,d) values(8,null,'')
update t3 set v = v * 2 where k = 'a'
delete from t2 where x = 5
insert or replace into t2 values(3,'b','a')
update t1 set c = c + 1
delete from t2 where x = 1
delete from t1 where c != 5
commit
update t3 set v = v * 2
insert or abort into t1(b,c,d) values(1040.0,null,0)
rollback
update or fail t1 set d = 771.94 where a != 'xcc'
update t1 set c = c + 1 where b is null
insert or abort into t1(b,c,d) values(29,10,'za')
delete from t2 where x = 0
insert or ignore into t1(b,c,d) values(2,'babcc',3)
update t3 set v = v * 2 where k = 'a'
begin
insert or ignore into t3(k,v) values('f',10)
commit
update or ignore t1 set a = 'b' where c < -5
update t1 set b = 1 where b is null
delete from t1
insert into t2 values(3,'b',10)
commit
delete from t1
insert into t3(k) select b from t1
insert or replace into t1(b,c,d) values(3,null,8)
delete from t1
update t3 set v = v * 2
delete from t1 where b is null
delete from t1
delete from t1 where a is null
insert or rollback into t1(b,c,d) values(null,null,4)
update t1 set c = c + 1 where c is null
rollback
update t3 set v = v * 2 where k = 'a'
delete from t1 where d is null
update or rollback t1 set c = 'ccbcyc' where b is null
insert or replace into t3(k,v) values('b',268.76)
insert or ignore into t3(k,v) values('c','a')
insert or replace into t1(b,c,d) values(7,null,9)
delete from t1 where b != 'bybyx'
select type, name, tbl_name, sql from sqlite_master order by name
select * from sqlite_sequence
select * from t1 order by a
select * from t2 order by x, y
select * from t3 order by k
select * from t1 where b = 'a' order by a
select count(*), sum(c) from t1
