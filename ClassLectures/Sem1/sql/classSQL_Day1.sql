-- create database employees;
use employees; -- open the dabase
show tables;-- list all the tables 
create table emp 
(emp_id int,
emp_name varchar(20),
dept varchar(20),
salary float
);
use employees;
show tables;
desc emp; --  see the structure of the table 

--  DDL -- Create 
-- Alter 

alter table emp  add column mobile varchar(10);

-- add after emp_name
alter table emp add column age int after emp_name;
alter table emp add column id first;
-- removing columsn from table s

alter table emp drop column emp_id,drop column age;
desc emp;

-- update the column type
alter table emp modify column mobile int;
desc emp;

-- resizing the varchar data type

alter table emp modify column dept varchar(10);
desc emp;

-- change the name of attributed dept as department

alter table emp rename column dept to department;
desc emp;

-- rename emp_name to name and datatype to varchar(10)



alter table  emp change column emp_name name varchar(25);
desc emp;

-- modify position

alter table emp modify column department varchar(10) after mobile;
desc emp;

-- drop table emp;
-- drop database emp;



-- truncate  all data be gone but structue will be there 

-- DDL  data defination language 

-- DDL only structure  , DML , DQL < DCL < TCL 

-- DML  only to do with Data not data structure 

-- insert 
insert  into emp values
( 001,'Jitendra',33,'IT',88,'887938374'
);

select * from EMP;

-- if you dont have all daa then skip but need to specify what all values u are putting 
insert into emp (emp_id,emp_name,dept,salary,mobile)
values (002,'Divya','HR','90','76337338');

insert  into emp values
( 003,'g2',Null,'IT',84,'887934474'
);


-- add multiple values , 
insert  into emp values
( 003,'g2',Null,'IT',84,'887934474'),(004,'GD',23,'FIN',56,'8388228292');


-- update 

update emp set age=49 where emp_name='g2';
-- update the salary by adding 5 in existing salary

update emp set salary=salary+20;

update emp set salary=salary+100 where dept='IT';
-- null and 0 are problem  null + 


-- delete 
-- delete remove the empoyees working from HR dept

delete from emp where dept='HR';
select * from EMP;


-- do not delete make it null if single value to be deleted 
-- delete command will delete entire row 

--- truncate command 

Truncate table emp; -- result is same but retain DS  no roll back u cant get data back 
Delete from emp; -- result is same but retain DS but you can roll back the delete options
-- suppose we want to delete with depeartment so delete its good 
-- not truncate filters 
-- delete is expensive cuz some one is holding the same 

 -- trucate helps to archive and for maintainance purpose 
 
 
 
 
 -- DQL Select 
 select * from emp;
 Select emp_id,salary from emp where salary > 200  ; -- filter out the data 
 
 -- is null and = null are diff 
 
 use hr;
 show tables;
 select * from employees;
 -- more on filter using where
 
 
 -- example of in operator 
 -- display all employeees woring 
 select * from employees where  department_id=80;
  select first_name,employee_id,salary*82 as salINR from employees where  salary > 10000;
 -- null last row is a feeder to inserst data using IDE 
 -- emp working for both departmnet
 select first_name,employee_id,salary*82 as SALINR,department_id as salINR from employees where department_id = 80 OR department_id =  90 ;
 
 
 select * from employees where department_id in (80,90,100);
 
 -- Emp working for departnetb 80 and earning more than 10000
 


 select employee_id,first_name,email,salary*80 as SALINR,department_id from employees where department_id = 80 and salary > 10000;
 
-- display employees earning salary between 
 
 select employee_id,first_name,email,salary*80 as SALINR,department_id from employees where  salary >= 10000 and salary <=20000;
  select employee_id,first_name,email,salary*80 as SALINR,department_id from employees where  salary between 10000 and 20000;

-- dispay salary and joining date of lex and neena
select * from employees;
select salary,first_name,hire_date from employees where first_name ='lex' or first_name='neena';

-- in 
select salary,first_name,hire_date from employees where first_name in ('lex','neena');

-- like pattern matching operator  two wild charators % _ 
select salary,first_name,hire_date from employees where first_name like 't%'; -- start with t
select salary,first_name,hire_date from employees where first_name like '%t'; -- end with t 
select salary,first_name,hire_date from employees where first_name like 'a%t'; -- end with t 

select first_name,employee_id from employees where job_id like '%Clerk%';


-- _ what it can do 

-- display the name who has 2nd charactor as e

create table test as select first_name,salary*10/100 as bonus from employees; -- send result to a table 
select * from test;
-- bonus is caled alias 
select first_name, last_name from employees;
select first_name last_name from employees; -- does as alias of first_ame as last_name


-- calculate annual salary for empes working for departmnet 80

select first_name,salary*12,department_id as annual_salary from employees where department_id = 80;