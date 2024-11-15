Enter password: *****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 5
Server version: 5.7.17-log MySQL Community Server (GPL)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database parliment;
Query OK, 1 row affected (0.03 sec)

mysql> use parliment;
Database changed
mysql> create table constiuency(
    -> conti_id int primary key,
    -> consti_name varchar(20),
    -> no_of_voters int );
Query OK, 0 rows affected (0.35 sec)

mysql> create table party(
    -> pid int primary key,
    -> p_name varchar(20),
    -> p_symbol varchar(20));
Query OK, 0 rows affected (0.28 sec)

mysql> create table candidate(
    -> cand_id int primary key,
    -> phone_no int  ,
    -> age int ,
    -> cand_name  varchar(20),
    -> state varchar(20),
    -> pid int references party(pid));
Query OK, 0 rows affected (0.23 sec)

mysql> create table contest(const_id  int references constiuency(conti_id), cand_id int references candidate(cand_id) primary key (const_id,cand_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key (const_id,cand_id))' at line 1
mysql> create table contest(const_id  int references constiuency(conti_id), cand_id int references candidate(cand_id) , primary key (const_id,cand_id));
Query OK, 0 rows affected (0.22 sec)

mysql> create table voter (
    -> vid int primary key , v_name  varchar(20), v_age int , v_address varchar(20)
    -> , canti_id int references constiuency (conti_id), cand_id int   references candidate(cand_id));
Query OK, 0 rows affected (0.31 sec)

mysql> insert into constiuency (conti_id, consti_name,no_of_voters) values ( 111, 'Rajajinagar' , 'karanataka', 4),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> drop table constiuency;
Query OK, 0 rows affected (0.20 sec)

mysql> create table constiuency(
    ->     -> conti_id int primary key,
    ->     -> consti_name varchar(20),
    ->     -> no_of_voters int ).
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> conti_id int primary key,
    -> consti_name varchar(20),
    -> no_of_voters' at line 2
mysql> create table constiuency(
    -> conti_id int primary key,
    -> consti_name varchar(20),
    -> consti_state varchar(20),);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 4
mysql> create table constiuency(conti_id int primary key,consti_name varchar(20),consti_state varchar(20), consti_state varchar(20),);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table constiuency(conti_id int  primary key , consti_name varchar(20) , consti_state varchar(20) , no_of_voters int );
Query OK, 0 rows affected (0.23 sec)

mysql> insert into constiuency (conti_id, consti_name, consti_state  , no_of_voters) values ( 111, 'Rajajinagar' , 'karanataka', 4),
    -> ( 222, 'ramnagara' , 'kerala', 1), (333, 'chittur' , 'andrapradesh',1), (444, 'yalahank' ,'bengaluru' , 2), (555, 'hebal', 'mysuru',2));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 2
mysql>  insert into constiuency values ( 111, 'Rajajinagar' , 'karanataka', 4);
Query OK, 1 row affected (0.11 sec)

mysql> insert into constiuency ( 222, 'ramnagara' , 'kerala', 1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '222, 'ramnagara' , 'kerala', 1)' at line 1
mysql>  insert into constiuency values ( 222, 'ramnagara' , 'kerala', 1);
Query OK, 1 row affected (0.06 sec)

mysql>  insert into constiuency values(333, 'chittur' , 'andrapradesh',1);
Query OK, 1 row affected (0.05 sec)

mysql> insert into constiuency values (444, 'yalahank' ,'bengaluru' , 2);
Query OK, 1 row affected (0.06 sec)

mysql> insert into constiuency values(555, 'hebal', 'mysuru',2);
Query OK, 1 row affected (0.06 sec)

mysql> insert into party values (876, 'bjp' , 'louts');
Query OK, 1 row affected (0.03 sec)

mysql>  insert into party values (877, 'congress' , 'hand');
Query OK, 1 row affected (0.06 sec)

mysql>  insert into party values (878, 'jds' , 'women');
Query OK, 1 row affected (0.02 sec)

mysql>  insert into party values (890, 'kvk' , 'elephant');
Query OK, 1 row affected (0.06 sec)

mysql> insert into party values (900, 'avks' , 'circle');
Query OK, 1 row affected (0.05 sec)

mysql> insert into candidate  values(121 , 635432, 25 , 'Delhi' 'riya' , 345);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into candidate  values(121 , 635432, 25 , 'Delhi' 'riya' , 222);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> candidate  values(121 , 635432, 25 , 'riya' ,'Dehli' ,  222);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'candidate  values(121 , 635432, 25 , 'riya' ,'Dehli' ,  222)' at line 1
mysql> insert into candidate values (121, 901998,25,'shiva', 'karanataka' 222);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '222)' at line 1
mysql> insert into candidate values (121 , 90199, 25 , 'shiva' 'karanatka' 876);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '876)' at line 1
mysql> insert into candidate values (121 , 90199, 25 , 'shiva' ,'karanatka', 876);
Query OK, 1 row affected (0.08 sec)

mysql> select * from constiuency;
+----------+-------------+--------------+--------------+
| conti_id | consti_name | consti_state | no_of_voters |
+----------+-------------+--------------+--------------+
|      111 | Rajajinagar | karanataka   |            4 |
|      222 | ramnagara   | kerala       |            1 |
|      333 | chittur     | andrapradesh |            1 |
|      444 | yalahank    | bengaluru    |            2 |
|      555 | hebal       | mysuru       |            2 |
+----------+-------------+--------------+--------------+
5 rows in set (0.00 sec)

mysql> select * from party ;
+-----+----------+----------+
| pid | p_name   | p_symbol |
+-----+----------+----------+
| 876 | bjp      | louts    |
| 877 | congress | hand     |
| 878 | jds      | women    |
| 890 | kvk      | elephant |
| 900 | avks     | circle   |
+-----+----------+----------+
5 rows in set (0.00 sec)

mysql>  insert into candidate values (131 , 87227, 30 , 'vikas' ,'kerala', 877);
Query OK, 1 row affected (0.05 sec)

mysql> insert into candidate values (141 , 99803, 20 , 'vishal' ,'delhi', 878);
Query OK, 1 row affected (0.03 sec)

mysql> insert into candidate values (151 , 56345, 18 , 'mallika' ,'mumbai', 890);
Query OK, 1 row affected (0.05 sec)

mysql> insert into candidate values (161 , 98786, 24 , 'chethan' ,'bombay', 900);
Query OK, 1 row affected (0.03 sec)

mysql> select * from candidate;
+---------+----------+------+-----------+-----------+------+
| cand_id | phone_no | age  | cand_name | state     | pid  |
+---------+----------+------+-----------+-----------+------+
|     121 |    90199 |   25 | shiva     | karanatka |  876 |
|     131 |    87227 |   30 | vikas     | kerala    |  877 |
|     141 |    99803 |   20 | vishal    | delhi     |  878 |
|     151 |    56345 |   18 | mallika   | mumbai    |  890 |
|     161 |    98786 |   24 | chethan   | bombay    |  900 |
+---------+----------+------+-----------+-----------+------+
5 rows in set (0.00 sec)

mysql> insert into contest values (111,121);
Query OK, 1 row affected (0.05 sec)

mysql>  insert into contest values (222,131);
Query OK, 1 row affected (0.06 sec)

mysql>  insert into contest values (333,141);
Query OK, 1 row affected (0.05 sec)

mysql>  insert into contest values (444,151);
Query OK, 1 row affected (0.05 sec)

mysql>  insert into contest values (555,161);
Query OK, 1 row affected (0.05 sec)

mysql> select * from contest;
+----------+---------+
| const_id | cand_id |
+----------+---------+
|      111 |     121 |
|      222 |     131 |
|      333 |     141 |
|      444 |     151 |
|      555 |     161 |
+----------+---------+
5 rows in set (0.01 sec)

mysql> insert into voter values ( 100, 'thomas', 33 , 'kerala' , 111, 121);
Query OK, 1 row affected (0.07 sec)

mysql> insert into voter values ( 101, 'adison', 45 , 'bomby' , 222, 131);
Query OK, 1 row affected (0.06 sec)

mysql> insert into voter values ( 102, 'marco', 50 , 'vijayanagar' , 333, 141);
Query OK, 1 row affected (0.05 sec)

mysql> insert into voter values ( 103, 'boss', 60 , 'gadaga' , 444, 151);
Query OK, 1 row affected (0.05 sec)

mysql> insert into voter values ( 104, 'rama', 25 , 'kampli' , 555, 161);
Query OK, 1 row affected (0.05 sec)

mysql> select * from values;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values' at line 1
mysql> select * from values ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values' at line 1
mysql> select * from voter;
+-----+--------+-------+-------------+----------+---------+
| vid | v_name | v_age | v_address   | canti_id | cand_id |
+-----+--------+-------+-------------+----------+---------+
| 100 | thomas |    33 | kerala      |      111 |     121 |
| 101 | adison |    45 | bomby       |      222 |     131 |
| 102 | marco  |    50 | vijayanagar |      333 |     141 |
| 103 | boss   |    60 | gadaga      |      444 |     151 |
| 104 | rama   |    25 | kampli      |      555 |     161 |
+-----+--------+-------+-------------+----------+---------+
5 rows in set (0.00 sec)

mysql> select * from constiuency;
+----------+-------------+--------------+--------------+
| conti_id | consti_name | consti_state | no_of_voters |
+----------+-------------+--------------+--------------+
|      111 | Rajajinagar | karanataka   |            4 |
|      222 | ramnagara   | kerala       |            1 |
|      333 | chittur     | andrapradesh |            1 |
|      444 | yalahank    | bengaluru    |            2 |
|      555 | hebal       | mysuru       |            2 |
+----------+-------------+--------------+--------------+
5 rows in set (0.00 sec)

mysql>  select * from party ;
+-----+----------+----------+
| pid | p_name   | p_symbol |
+-----+----------+----------+
| 876 | bjp      | louts    |
| 877 | congress | hand     |
| 878 | jds      | women    |
| 890 | kvk      | elephant |
| 900 | avks     | circle   |
+-----+----------+----------+
5 rows in set (0.00 sec)

mysql>  select * from contest;
+----------+---------+
| const_id | cand_id |
+----------+---------+
|      111 |     121 |
|      222 |     131 |
|      333 |     141 |
|      444 |     151 |
|      555 |     161 |
+----------+---------+
5 rows in set (0.00 sec)

mysql> select * from candidate;
+---------+----------+------+-----------+-----------+------+
| cand_id | phone_no | age  | cand_name | state     | pid  |
+---------+----------+------+-----------+-----------+------+
|     121 |    90199 |   25 | shiva     | karanatka |  876 |
|     131 |    87227 |   30 | vikas     | kerala    |  877 |
|     141 |    99803 |   20 | vishal    | delhi     |  878 |
|     151 |    56345 |   18 | mallika   | mumbai    |  890 |
|     161 |    98786 |   24 | chethan   | bombay    |  900 |
+---------+----------+------+-----------+-----------+------+
5 rows in set (0.00 sec)
