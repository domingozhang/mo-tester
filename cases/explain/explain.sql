explain select date_add("1997-12-31 23:59:59",INTERVAL 1 YEAR);

drop table if exists t1;
create table t1 (spID int,userID int,score smallint);
insert into t1 values (1,1,1);
insert into t1 values (2,2,2);
insert into t1 values (2,1,4);
insert into t1 values (3,3,3);
insert into t1 values (1,1,5);
insert into t1 values (4,6,10);
insert into t1 values (5,11,99);
explain select spID,userID from t1;
explain select * from t1;
explain select distinct spID,userID from t1;
explain select distinct * from t1;
explain select userID, SUM(score) from t1 group by userID order by userID desc;
explain select userID as a, MIN(score) as b from t1 group by userID order by userID;
explain select userID as user, MAX(score) as max from t1 group by userID order by max asc;
explain select userID,count(score) from t1 where userID>2 group by userID having count(score)>1 order by userID;
explain select spID,userID from t1 where score>2;
explain select distinct spID,userID from t1 where score>2;
explain select spID,userID from t1 where score>2 order by spID asc;
explain select userID, SUM(score) from t1 where score>2 group by userID order by userID desc;
explain select userID, SUM(score) from t1 where score>2 group by userID having count(score)>1 order by userID desc;
explain select userID from t1 where userID between 2 and 3 group by userID order by userID;
explain select spID,userID,score from t1 limit 2,1;
explain select spID,userID,score from t1 limit 2 offset 1;
explain select userID, SUM(score) from t1 where score>2 group by userID having count(score)>1 order by userID desc limit 2,1;
explain select score AND spID from t1 where spID=6 group by score order by sum desc;
explain select userID, userID DIV 2 as user_dir, userID%2 as user_percent, userID MOD 2 as user_mod from t1;
explain select userID,MAX(score) max_score from t1 where userID <2 || userID > 3 group by userID order by max_score;
explain select userID, userID DIV 2 as user_dir, userID%2 as user_percent, userID MOD 2 as user_mod from t1 where userID > 3 ;
explain select CAST(userID AS CHAR) userid_cast, userID from t1 where CAST(spID AS CHAR)='1';
explain select CAST(userID AS DOUBLE) cast_double, CAST(userID AS FLOAT(3)) cast_float , CAST(userID AS REAL) cast_real, CAST(userID AS SIGNED) cast_signed, CAST(userID AS UNSIGNED) cast_unsigned from t1 limit 2;
create table t5(a int,b varchar(10),c varchar(10));
insert into t5 values(1,'ab','cd'),(2,'ba','dc'),(3,'bc','de'),(4,'cb','ed'),(5,'cd','ef'),(6,'dc','fe'),(2,'de','fg'),(1,'ed','gf');
explain select * from t5 where (b='ba' or b='cb') and (c='dc' or c='ed');

drop table if exists t1;
drop table if exists t2;
drop table if exists t3;
create table t1 (libname1 varchar(21) not null primary key, city varchar(20));
create table t2 (isbn2 varchar(21) not null primary key, author varchar(20), title varchar(60));
create table t3 (isbn3 varchar(21) not null, libname3 varchar(21) not null, quantity int);
insert into t2 values ('001','Daffy','Aducklife');
insert into t2 values ('002','Bugs','Arabbitlife');
insert into t2 values ('003','Cowboy','Lifeontherange');
insert into t2 values ('000','Anonymous','Wannabuythisbook?');
insert into t2 values ('004','BestSeller','OneHeckuvabook');
insert into t2 values ('005','EveryoneBuys','Thisverybook');
insert into t2 values ('006','SanFran','Itisasanfranlifestyle');
insert into t2 values ('007','BerkAuthor','Cool.Berkley.the.book');
insert into t3 values('000','NewYorkPublicLibra',1);
insert into t3 values('001','NewYorkPublicLibra',2);
insert into t3 values('002','NewYorkPublicLibra',3);
insert into t3 values('003','NewYorkPublicLibra',4);
insert into t3 values('004','NewYorkPublicLibra',5);
insert into t3 values('005','NewYorkPublicLibra',6);
insert into t3 values('006','SanFransiscoPublic',5);
insert into t3 values('007','BerkeleyPublic1',3);
insert into t3 values('007','BerkeleyPublic2',3);
insert into t3 values('001','NYC Lib',8);
insert into t1 values ('NewYorkPublicLibra','NewYork');
insert into t1 values ('SanFransiscoPublic','SanFran');
insert into t1 values ('BerkeleyPublic1','Berkeley');
insert into t1 values ('BerkeleyPublic2','Berkeley');
insert into t1 values ('NYCLib','NewYork');
explain select * from t1,t2,t3;
explain select city,libname1,count(libname1) as a from t3 join t1 on libname1=libname3 join t2 on isbn3=isbn2 group by city,libname1;
explain select city,libname1,count(libname1) as a from t3 join t2 on isbn3=isbn2 join t1 on libname1=libname3 group by city,libname1;
explain select city,libname1,count(libname1) as a from t1 join t3 on libname1=libname3 join t2 on isbn3=isbn2 group by city,libname1;

drop table if exists t1;
create table t1 (id int,ti tinyint unsigned,si smallint,bi bigint unsigned,fl float,dl double,de decimal,ch char(20),vch varchar(20),dd date,dt datetime);
insert into t1 values(1,1,4,3,1113.32,111332,1113.32,'hello','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(2,2,5,2,2252.05,225205,2252.05,'bye','sub query','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(3,6,6,3,3663.21,366321,3663.21,'hi','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(4,7,1,5,4715.22,471522,4715.22,'good morning','my subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(5,1,2,6,51.26,5126,51.26,'byebye',' is subquery?','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(6,3,2,1,632.1,6321,632.11,'good night','maybe subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(7,4,4,3,7443.11,744311,7443.11,'yes','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(8,7,5,8,8758.00,875800,8758.11,'nice to meet','just subquery','2022-04-28','2022-04-28 22:40:11');
insert into t1 values(9,8,4,9,9849.312,9849312,9849.312,'see you','subquery','2022-04-28','2022-04-28 22:40:11');

drop table if exists t2;
create table t2 (id int,ti tinyint unsigned,si smallint,bi bigint unsigned,fl float,dl double,de decimal,ch char(20),vch varchar(20),dd date,dt datetime);
insert into t2 values(1,1,4,3,1113.32,111332,1113.32,'hello','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(2,2,5,2,2252.05,225205,2252.05,'bye','sub query','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(3,6,6,3,3663.21,366321,3663.21,'hi','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(4,7,1,5,4715.22,471522,4715.22,'good morning','my subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(5,1,2,6,51.26,5126,51.26,'byebye',' is subquery?','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(6,3,2,1,632.1,6321,632.11,'good night','maybe subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(7,4,4,3,7443.11,744311,7443.11,'yes','subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(8,7,5,8,8758.00,875800,8758.11,'nice to meet','just subquery','2022-04-28','2022-04-28 22:40:11');
insert into t2 values(9,8,4,9,9849.312,9849312,9849.312,'see you','subquery','2022-04-28','2022-04-28 22:40:11');

explain select * from (select * from t1) sub where id > 4;
explain select ti as t,fl as f from (select * from t1) sub where dl <> 4;
explain select * from (select ti as t,fl as f from t1 where dl <> 4) sub;
explain select id,min(ti) from (select * from t1) sub group by id;
explain select * from (select id,min(ti) from (select * from t1) t1 group by id) sub;
explain select id,min(ti) from (select * from t1) sub group by id order by id desc;
explain select id,sum(ti) from (select * from t1) sub group by id;
explain select distinct(ti) from (select * from t1) sub;
explain select distinct(ti) from (select * from t1) sub where id <6;
explain select count(*) from (select * from t1) sub where id > 4 ;
explain select * from (select * from t1) sub where id > 1 limit 3;
explain select max(ti),min(si),avg(fl) from (select * from t1) sub where id < 4 || id > 5;
explain select max(ti)+10,min(si)-1,avg(fl) from (select * from t1) sub where id < 4 || id > 5;
explain select ti,-si from (select * from t1) sub order by -si desc;
explain select * from (select * from t1) sub where (ti=2 or si=3) and  (ch = 'bye' or vch = 'subquery');
explain select * from (select * from (select * from (select id,ti,si,de from (select * from t1 ) sub3 where fl <> 4.5 ) sub2 where ti > 1) sub1 where id >2 ) sub where id > 4;
explain select * from (select * from t1 where id > 100) sub ;

drop table if exists t1;
drop table if exists t2;
CREATE TABLE t1 (a varchar(10), PRIMARY KEY (a));
CREATE TABLE t2 (a varchar(10), b date, PRIMARY KEY(a));
INSERT INTO t1 VALUES ('test1');
INSERT INTO t2 VALUES
('test1','2016-12-13'),('test2','2016-12-14'),('test3','2016-12-15');
explain SELECT b, b = '20161213', CASE b WHEN '20161213' then 'found' ELSE 'not found' END FROM t2;

drop table if exists t1;
create table t1 (`row` int not null, col int not null, val varchar(255) not null);
insert into t1 values (1,1,'orange'),(1,2,'large'),(2,1,'yellow'),(2,2,'medium'),(3,1,'green'),(3,2,'small');
explain select max(case col when 1 then val else null end) as color from t1 group by `row`;

drop table if exists t1;
create table t1(a float, b int default 3);
insert into t1 (a) values (2), (11), (8);
select min(a), min(case when 1=1 then a else NULL end),
  min(case when 1!=1 then NULL else a end)
from t1 where b=3 group by b;

drop table if exists  t1;
CREATE TABLE t1 (a INT, b INT);
INSERT INTO t1 VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
explain SELECT CASE WHEN AVG(a)>=0 THEN 'Positive' ELSE 'Negative' END FROM t1 GROUP BY b;

drop table if exists  t1;
drop table if exists  t2;
create table t1 (a int, b bigint unsigned);
create table t2 (c int);
insert into t1 (a, b) values (1,4572794622775114594), (2,18196094287899841997),
  (3,11120436154190595086);
insert into t2 (c) values (1), (2), (3);
explain select t1.a, (case t1.a when 0 then 0 else t1.b end) d from t1
  join t2 on t1.a=t2.c order by d;
explain select t1.a, (case t1.a when 0 then 0 else t1.b end) d from t1
  join t2 on t1.a=t2.c where b=11120436154190595086 order by d;

drop table if exists small;
drop table if exists big;
CREATE TABLE small (id int not null,PRIMARY KEY (id));
CREATE TABLE big (id int not null,PRIMARY KEY (id));
INSERT INTO small VALUES (1), (2);
INSERT INTO big VALUES (1), (2), (3), (4);
explain SELECT big.*, dt.* FROM big LEFT JOIN (SELECT id as dt_id,
                           CASE id WHEN 0 THEN 0 ELSE 1 END AS simple,
                           CASE WHEN id=0 THEN NULL ELSE 1 END AS cond
                    FROM small) AS dt
     ON big.id=dt.dt_id;

drop table if exists t1;
create table t1(a int, b int, c int);
insert into t1 values(null,null,null),(2,3,4);
explain with qn as (select 1) select 2;

drop table if exists t1;
create table t1(a int, b int, c int);
insert into t1 values(null,null,null),(2,3,4);
explain WITH qn AS (SELECT b as a FROM t1)
SELECT qn.a, qn2.a  FROM qn, qn as qn2;
explain WITH qn AS (SELECT b as a FROM t1),
qn2 AS (SELECT c FROM t1 WHERE a IS NULL or a>0)
SELECT qn.a, qn2.c  FROM qn, qn2;
explain SELECT (WITH qn AS (SELECT 10*a as a FROM t1),
        qn2 AS (SELECT 3*a AS b FROM qn)
        SELECT * from qn2 LIMIT 1)
FROM t1;
explain with qn as (select * from t1 limit 10)
select (select max(a) from qn where a=0),
       (select min(b) from qn where b=3);

drop table if exists sales_days;
create table sales_days(day_of_sale DATE, amount INT);
insert into sales_days values('2015-01-02', 100), ('2015-01-05', 200),('2015-02-02', 10),  ('2015-02-10', 100),('2015-03-02', 10),  ('2015-03-18', 1);
explain with sales_by_month(month,total) as
 (select month(day_of_sale), sum(amount) from sales_days
  where year(day_of_sale)=2015
  group by month(day_of_sale)),
 best_month(month, total, award) as
 (select month, total, "best" from sales_by_month
  where total=(select max(total) from sales_by_month)),
 worst_month(month, total, award) as
 (select month, total, "worst" from sales_by_month
  where total=(select min(total) from sales_by_month))
 select * from best_month union all select * from worst_month;

drop table if exists t1;
create table t1(a int, b int, c int);
insert into t1 values(null,null,null),(2,3,4),(4,5,6);
explain with qn as
  (with qn2 as (select "qn2" as a from t1) select "qn", a from qn2)
select * from qn;

explain SELECT (WITH qn AS (SELECT t2.a*a as a FROM t1),
        qn2 AS (SELECT 3*a AS b FROM qn)
        SELECT * from qn2 LIMIT 1)
FROM t1 as t2;
