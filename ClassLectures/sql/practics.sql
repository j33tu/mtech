-- create database employees

create database employees;
-- always use the database as context 

use employees;

--  command to show all tables 
-- schema is all about structure of database and swritten into the configuration 

show tables;

create table emp
(
emp_id int,
emp_name varchar(25),
dept varchar(20),
salary float
);

show tables;

select * from emp;

-- describe table structure

desc emp;

-- add column after empname

alter table emp add column age int after emp_name;

select * from emp;

alter table emp drop column id;
alter table emp add column id int first;
select * from emp;


alter table emp modify column salary int;
select * from emp;
select * from emp;
desc emp;
alter table emp modify column dept varchar(15);

desc emp;

alter table emp rename column emp_name to empname;
alter table emp change column empname emp_name varchar(12);

desc emp; 

-- insert into table

insert into  emp values
( 003,'ketan',42,'IT','440000'
);
-- update command 
select * from emp;
delete from emp where salary = 503000;
update emp set  age = 28 where emp_id=21;

update emp set salary = salary + 10000;
select * from emp;

update emp set salary = salary + 999 where dept = 'IT';
select * from emp;

delete from emp where dept='HR';
select * from emp;


select emp_id as empid , dept,emp_name as department ,salary from emp where salary in (400000,500000,60000);
alter table emp add column dep_id int;
select * from emp;

select salary+salary*.1 as ctc,salary , emp_name,emp_id from emp;

----
use employees;
update emp set dep_id=001 where dept='IT';
update emp set dep_id=002 where dept='HR';
select * from emp;
select salary,emp_id,emp_name from emp where emp_name like '%r_';
use hr;
select * from employees where job_id like '%clerk';

