/* */
-- create database employees
create database employees; -- ctrl+enter
use employees; -- ope the database
show tables; -- list all the tables
create table emp
(emp_id int,
emp_name varchar(20),
dept varchar(20),
salary float);

desc emp; -- see the structure of the table
-- DDL -- Create
-- Alter
alter table emp add column mobile varchar(10);

alter table emp add column age int after emp_name;

alter table emp add column id int first;

alter table emp drop column id ,drop column age;

-- change the datatype
alter table emp modify column mobile int;

alter table emp modify column dept varchar(10);
-- change the name 

alter table emp rename column dept to department;

-- change
alter table emp change column
emp_name name varchar(25);

-- add,drop,modify,rename,change

alter table emp modify column 
department varchar(10) after mobile;

drop table emp;

drop database emp;

-- truncate
-- DDL
truncate table emp;

-- DDL
desc emp;

insert into emp values
(100,'A',50000,123,'sales');

insert into emp (emp_id,name,mobile,department)
values (101,'B',890,'HR');

select * from emp;

insert into emp values
(102,'C',NULL,24,'ops');
insert into emp values
(103,'D',70000,345,'Sales'),
(104,'E',45000,345,'Admin');

select * from emp;


update emp set salary=80000 where emp_id=101;
select * from emp;

select * from emp;

-- update the salary by adding 5000 
-- to all employees

update emp set salary=salary+5000
where department='sales';

update emp set salary =NULL where ;

truncate table emp; -- remove 4 rows DS
delete from emp where department='mkt'; -- remove 4 rows DS

-- remove the employees working for HR dept
delete from emp where department='HR';

-- DQL select

select salary,emp_id from emp
where salary>50000;

select * from emp where salary is NULL;

show tables;
use employees;
use hr;
select * from employees;
-- Display all employees working for dept 80
select * from employees
where department_id=80;

-- Display employee name who all earning salary
-- more than 10000 -- 15 rows

select first_name,last_name from employees
where salary>10000;

-- diplay employees working for 80 
-- and department 90 and 100
select * from employees where department_id=80
or department_id=90 or department_id=100;

select * from employees where department_id 
in (80,90,100);

-- Display employees working for dept 80 
-- and earning more than 10000 -- 8 rows

-- Display employees earning salary between
-- 10000 and 20000

select * from employees
where salary>=10000 and salary<=20000;

select * from employees
where salary between 10000 and 20000;

-- Display the salary and joinning date 
-- of lex and neena

select salary,hire_date from employees
where  first_name ='neen';

select first_name,salary,hire_date from employees
where first_name in ('lex','NEEN');

-- like
-- wild char % _

-- display all employees name starting with s

select first_name,job_id from employees where 
job_id like '%cle%';

-- starts with s ends with n

-- Display all clerks



-- underscore
-- Display the firstname who has 2nd character 
-- as e

select first_name from employees
where first_name like '__e%';


-- expressions

-- Display first_name,department_id,salary,
-- bonus(10% of salary) for all employees;

select first_name,department_id,salary,
salary*.1 as bonus from employees;

select first_name ,last_name from employees;


-- calculate annual salary for employees
-- working for department 80

select *,salary*12 as "annual salary"
from employees
where department_id=80;
-- diplay one those employees earning bonus
-- more than 3000
select salary,salary*.1 as bonus
from employees
where salary*.1>1500;
-- where clause can not have alias name
-- order of execution : from where select
-- select from where

-- NULL Value
-- diplay first_name, salary, commission % 
-- commission value, for employees
select first_name,salary,commission_pct,
salary*commission_pct as comm_value,
salary+(salary*ifnull(commission_pct,0)) as total_salary
from employees;

select * from employees;

-- ifnull()
select ifnull(20000,.30);

-- immediate data
select 1+2;
select "Welcome to SQL" as title;

select current_date();
-- YYYY/MM/DD
select current_time();
-- HH:MM:SS

select now();

select utc_timestamp();

-- data type date
-- date,time,datetime
-- int , float

create table dt_date
(dob date,
 entry_time time,
 recevied_on datetime);
 
 insert into dt_date values
 ('2000/12/25','12:30:45','2023/05/30 14:23:45');

select * from dt_date;

insert into dt_date values
(current_date(),current_time(),now());

-- =,<,>,<>,<=,>=,!=,and,or,not,in,between,like
-- Display employees except the employees 
-- working for dept 80 and 90



use hr;
select * from employees where 
department_id not in (80,90);
select * from employees where 
department_id !=80 and department_id<>90;

-- List all employees who are having commission
select * from employees
where commission_pct is not null;



-- Pick the unique records
-- Display the all the departments from the meployee table
-- In which departments the employees are working

select distinct department_id from employees;

-- Diplaay department wise job titles

select distinct department_id,job_id from employees;

select department_id,job_id from employees
where department_id=90;

select distinct * from employees;

-- Display employee who are not tagged with managers
select * from employees
where manager_id is null;


-- diplay department_id and dept_name IT related department
select * from departments;

select department_id,department_name
from departments where department_name like 'IT%';

-- order by
select first_name,department_id,salary from employees
order by department_id,salary desc;

-- Display the seniority list for every dept

select first_name,department_id,hire_date
from employees
order by department_id,hire_date;

select first_name,department_id,hire_date
from employees
order by 2,3;

-- diplay first_name, and last for whose last name
-- contains LI and arrange first name in alphabetical
-- order

select first_name,last_name from employees
where last_name like '%LI%'
order by first_name;

-- Limit
select * from employees limit 4,1;

-- Display the 3rd top earner

select * from employees 
order by salary desc
limit 2,1;

-- Display the third highest salaried person
-- among ST_MAN job

select * from employees
where job_id ='ST_MAN'
order by salary desc
limit 2,1;

-- functions
-- round() truncate()
select round(154.262,0);
select truncate(154.967,0);
-- floor(), ceil()

select floor(145.0);
select ceil(145.01);

-- os(),sin(),log()

-- mod()
select mod(25,2);
select pow(2,3);
select sqrt(25);

-- string funtions
-- lower(), upper()

select lower(first_name) from employees;
select upper(first_name) from employees;

select concat("welcome", "To", "SQL");

select concat(first_name," ",last_name) emp_name
from employees;

select substr("Hello world",6,20);

select length("Hello world");
select instr("welcome","x");

select rpad(salary,10,"#") from employees;

-- trim()
select length(trim("  vidm ya  "));
select trim('$' from 'MadaM$$$');

-- Display employee_id,first_name&last_name combined,
-- length of last_name, position of a in last_name,
-- for those job_id contains 'REP' and the last_name
-- with the character 'a' 16 rows

select employee_id, concat(first_name,last_name) emp_name,
length(last_name) Len_name, instr(last_name,'a')pos_of_a
from employees
where job_id like '%REP%' and last_name like '%a%';

-- date functions
-- Display the employees joined during 1997
select * from employees
where hire_date between '1997/01/01' and '1997/12/31';

select * from employees
where hire_date>= '1997/01/01' and hire_date<='1997/12/31';

select * from employees
where year(hire_date) = 1997;

select * from employees
where extract(year from hire_date)=1997;

select extract(month from hire_date) from employees;
select extract(day from hire_date) from employees;

select month(hire_date) from employees;
select day(hire_date) from employees;

select year(null);

select current_date()+35;

-- adddate()

select adddate(current_date(),interval 1 year);

select subdate(current_date(),interval 1 week);

-- date_format()


select date_format(current_date(),'%d/%m%/%Y');
select date_format(current_date(),'%D/%m%/%y');

select date_format(now(),'%D %M');

-- str_to_date()
select str_to_date('19-11-2023','%d-%m-%Y');

select str_to_date('19th Nov 23','%D %b %y');

select datediff(current_date(),'2023-01-01');
-- current_date(), current_time()now(),utc_timestamp()
-- month()year()day()extract()
-- adddate, subdate, datediff,date_format,str_to_date

-- display the tenure of employees as on today


select first_name, datediff(current_date(),hire_date)/365
as tenure
from employees
order by tenure desc;

select first_name,year(current_date())-year(hire_date) tenure
from employees
order by tenure desc;

desc employees;


select 1+'1';

select concat('1',1);


select convert('2023-11-19',date);

help 'cast';

-- control stmts

-- if(exp1,exp2,exp2)

select if (mod(61,2)=0,"Even","Odd");

-- Display first_name,salary, salary_tag
-- salary_tag good if salary >10000 otherwise ok

select first_name,salary,
if(salary>10000,"Good","OK") as salary_tag
from employees;

-- ifnull()
-- display first_name,salary,commission% Display 1 %
-- if an employee do not have commission

select first_name,salary,ifnull(commission_pct,0.01) as
commission_pct
from employees;
select first_name,salary,
if (commission_pct is null,0.01,commission_pct) as 
commission_pct
from employees;

-- ifnull(exp1,exp2)

-- nullif(exp1,exp2) -- checks for e1=e2 if yes it returns NULL
-- otherwise exp1

select nullif(10,20);
select first_name,job_id, 
nullif(job_id,"IT_PROG") revised_job
from employees;

select first_name,job_id, 
if(job_id="IT_PROG",NULL,job_id) revised_job
from employees;

/* salary >20000 - Very Good
	18000 - 20000 - Good
    15000 - 18000 - Moderate
    12000 - 15000 - Average
    10000 - 12000 - ok
    else bad
    */
    select first_name,salary,
    case 
    when salary>20000 then "Very Good"
    when salary between 18000 and 20000 then "Good"
    when salary between 15000 and 17999 then "Moderate"
    when salary between 12000 and 14999 then "Average"
    when salary between 10000 and 11999 then "OK"
    else "Bad"
    end salary_tag
    from employees;
    
    
    
    
create table author
(id int primary key,
name varchar(10) not null default 'Mr.X',
country varchar(10) not null 
check (country in ('USA', 'UK', 'UAE')),
page int check(page>0)
);
insert into author values
(100,'A','UK',10);

-- aggregate function Group function
-- sum(),min(),max(),count()
use hr;
select count(*) from employees;
select count(employee_id) from employees;
select count(department_id) from employees;
select count(commission_pct) from employees;

select count(employee_id), min(salary),max(Salary),
avg(salary)
from employees;

select min(salary) from employees
where department_id=80;
-- Display min salary for every dept

select min(salary) from employees
group by department_id;

select department_id, min(salary) from employees
group by department_id;

-- Display the total number of employees working for each
-- department

select department_id,count(employee_id)cnt from employees
group by department_id
order by cnt desc
limit 1;

-- Display number of employees working for the different
-- designation

select job_id, count(job_id) cnt from employees
group by job_id
order by cnt desc
limit 3;

-- Tag each department based on below criteria
-- Tag as "Junior" when single employee is working
-- Tag as "Intermediate when 2 or 3 employees are working
-- Tag as "Senior" when more than 3 employees are working

select department_id, count(employee_id),
case 
when count(*)=1 then "Junior"
when count(*) in(2,3) then "Intermediate"
else "Senior"
end dept_tag
from employees
group by department_id;

-- Display the departments which has 
-- max salary more than 10000
select department_id,max(salary) max_sal from employees
where salary>10000
group by department_id;


select department_id,salary from employees
where salary>10000;

-- Display the department where you have employees
-- more than 10

select department_id, count(employee_id) cnt from employees
group by department_id
having cnt>10;

-- display department_id and number of employees
-- working for department 30,80 and 90

select department_id,count(employee_id)
from employees
where department_id in (30,80,90)
group by department_id;

select department_id,count(employee_id)
from employees
group by department_id
having department_id in (30,80,90);

-- Find the department in which organisation
-- is spending more on salary

select department_id, sum(salary)sum_sal from employees
group by department_id
order by sum_sal desc
limit 1;

-- Display first_name,department_id and department_name
-- for all employees
select first_name,e.department_id,
department_name
from employees e  join departments d
on e.department_id=d.department_id;

-- first_name,department_id,department_name,city

select first_name,e.department_id,department_name,
city from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id;

-- display first_name,department_id and department_name
-- for all those employees working for dept 80 and 90

select first_name,e.department_id,
department_name
from employees e  join departments d
on e.department_id=d.department_id
where e.department_id in (80,90);

-- Display the employees working for marketing dept

select e.*,department_name
from employees e  join departments d
on e.department_id=d.department_id
where department_name='marketing';

-- Display all the departments including the depts 
-- where no employees are working


select department_id,department_name from departments;


select distinct d.department_id,department_name
from departments d left join employees e
on d.department_id=e.department_id
where employee_id is not null;

-- 

























 











 






































 

