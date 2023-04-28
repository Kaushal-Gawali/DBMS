/* Problem statement : 
   Creating a Cursor to copy procedure data of one table into another table;
   Name:- Kaushal Gawali
   Class:- S.Y.
   Div:- A
   Batch:- AS3
   Roll no:- 50
*/

Delimiter $$
create procedure cursor50()
begin
	declare vfinished int default 0;
	declare id1 int(3);
	declare name1 varchar(20);
	declare sal decimal(6,2);
	declare dg varchar(20);
	declare dn int(3);
	declare gr varchar(20);
	
declare emp_cursor cursor for select * from emp;
declare continue handler for not found set vfinished=1;

open emp_cursor;
getdata:loop
     fetch  emp_cursor into id1,name1,sal,dg,dn,gr;
     if vfinished=1 then
     leave getdata;
     end if;
    
    insert into emp_dump values(id1,name1,sal,dg,dn,gr);
    end loop getdata;
    close emp_cursor;
    end;
$$
Delimiter ;

/*
OUTPUT:
mysql> create database kaushal;
Query OK, 1 row affected (0.19 sec)

mysql> use kaushal;
Database changed
mysql> create table emp(id int(3), name varchar(20), salary float(6,2), desg varchar(20), dno int(3), grade varchar(2));
Query OK, 0 rows affected, 3 warnings (0.58 sec)

mysql> show tables;
+-------------------+
| Tables_in_kaushal |
+-------------------+
| emp               |
+-------------------+
1 row in set (0.00 sec)    
mysql> desc emp;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int         | YES  |     | NULL    |       |
| name   | varchar(20) | YES  |     | NULL    |       |
| salary | float(6,2)  | YES  |     | NULL    |       |
| desg   | varchar(20) | YES  |     | NULL    |       |
| dno    | int         | YES  |     | NULL    |       |
| grade  | varchar(2)  | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)
mysql> select *from emp;
+------+--------+---------+---------+------+-------+
| id   | name   | salary  | desg    | dno  | grade |
+------+--------+---------+---------+------+-------+
|    1 | abhi   | 3456.22 | clerk   |  101 | A     |
|    2 | chetan | 5647.18 | manager |  102 | A+    |
|    3 | piyush | 2345.68 | A.engi  |  103 | B     |
+------+--------+---------+---------+------+-------+
3 rows in set (0.00 sec)

mysql> create table emp_dump(id int(3), name varchar(20), salary float(6,2), desg
varchar(20), dno int(3), grade varchar(2));
Query OK, 0 rows affected, 3 warnings (1.01 sec)

mysql> show tables;
+-------------------+
| Tables_in_kaushal |
+-------------------+
| emp               |
| emp_dump          |
+-------------------+
2 rows in set (0.00 sec)
mysql> select *from emp;
+------+--------+---------+---------+------+-------+
| id   | name   | salary  | desg    | dno  | grade |
+------+--------+---------+---------+------+-------+
|    1 | abhi   | 3456.22 | clerk   |  101 | A     |
|    2 | chetan | 5647.18 | manager |  102 | A+    |
|    3 | piyush | 2345.68 | A.engi  |  103 | B     |
+------+--------+---------+---------+------+-------+
3 rows in set (0.00 sec)

mysql> create table emp_dump(id int(3), name varchar(20), salary float(6,2), desg
varchar(20), dno int(3), grade varchar(2));
Query OK, 0 rows affected, 3 warnings (1.01 sec)

mysql> show tables;
+-------------------+
| Tables_in_kaushal |
+-------------------+
| emp               |
| emp_dump          |
+-------------------+
2 rows in set (0.00 sec)
mysql> source /home/student/kaushal.sql;
Query OK, 0 rows affected, 2 warnings (0.18 sec)

mysql> call cursor50;
Query OK, 0 rows affected (0.26 sec)

mysql> select *from emp_dump;
+------+--------+---------+---------+------+-------+
| id   | name   | salary  | desg    | dno  | grade |
+------+--------+---------+---------+------+-------+
|    1 | abhi   | 3456.22 | clerk   |  101 | A     |
|    2 | chetan | 5647.18 | manager |  102 | A+    |
|    3 | piyush | 2345.68 | A.engi  |  103 | B     |
+------+--------+---------+---------+------+-------+
3 rows in set (0.01 sec)+----------+
