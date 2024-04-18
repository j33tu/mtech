create database employees1;
use employees;
select * from  emp;
use employees1;
create table emp (
emp_id int,
name varchar(20),
email varchar(20),
mobile int,
salary float
);

select * from emp;

insert into table (
);
show tables;

alter table emp add column salary1 float;
select * from emp;

select * from emp;
use employees;
show tables;
desc dt_data;
select * from dt_data;	

select * from emp;
alter table emp modify mobile varchar(10);
insert into emp (emp_id,mobile) values (1,'8879374285');

update emp 
set mobile ='8879174285'
where emp_id=3;

delete from emp   
where age is NULL;

alter table emp add column country varchar(20) after mobile;

alter table emp drop column country;
select * from emp;
-- update the column type

alter table emp modify column mobile int;
desc emp;


-- resizing the vharchar cdate type
alter table emp modify column mobile varchar(20);
select * from emp;
desc emp;
alter table emp rename column emp_id to eid;
select * from emp;
desc emp;
insert into emp (eid,emp_name,dept,salary,mobile)
values (12,'g2','IT',50000,887967454);

select * from emp;
update emp 
set age=32
where eid = 12;
-- DDL create drop alter truncate
-- DML insert , update , delete
-- DCL  date control lag grant , revoke 
-- TCL transaction control lang commit , roll back, 
-- DQL select 

insert into emp
values (13,'g3',33,'IT',13,50000,887967454);


update ;

update emp set age=49 
where emp_name = 'G2';
select * from emp;

update emp set salary = salary +100000;

-- dlete columns

delete from emp 
where eid=23;
select * from emp;

-- truncate command

-- DQL Data query language 

select * from emp;

use hr;
select * from employees
where salary > 8000;

-- in operator 
select * from employees 
where salary in (8000,7000,15000);

select * from employees where department_id in (50,80);

select concat(first_name,last_name) as Name_Emp , email,salary*10/100 as bonus , department_id from employees
where job_id = 'ST_MAN';

select concat(first_name,last_name) as Name_Emp , email,salary*10/100 as bonus , department_id from employees
where department_id=80 and salary between 800 and 10000;


-- display salary and joiningdateof   lex and neena

select * from employees;
select salary,hire_date,concat(first_name,last_name) as emp_name from employees
where first_name in ('lex','neena');
select salary,hire_date,concat(first_name,' ',last_name) as emp_name from employees
where first_name like 'a%t';

select salary,hire_date,concat(first_name,' ',last_name) as emp_name ,job_id
from employees
where job_id like '%clerk';

select salary,hire_date,concat(first_name,' ',last_name) as emp_name ,job_id
from employees
where substring(first_name,2,1) = 'a';
select salary,hire_date,concat(first_name,' ',last_name) as emp_name ,job_id
from employees
where first_name like '%a%';

create table export as select salary,hire_date,concat(first_name,' ',last_name) as emp_name ,job_id
from employees
where substring(first_name,2,1) = 'a';

select * from export;

select salary*12 as annual_salary,salary*12*10/100 as bonus,first_name , last_name
 from employees;
 
 select salary,hire_date,concat(first_name,' ',last_name) as emp_name ,job_id
from employees
where first_name like '_a%';

-- Expessions


select first_name,last_name,department_id,salary*.1 as bonus  from employees
where salary*.1>1000;

select * from employees;

select first_name,last_name,commission_pct ,salary*commission_pct as comm_value , salary + salary*(ifnull(commission_pct,0)) as total_Salary from employees;
 select ifnull(2000,30) as result;
 
 select 1+32;
 select 'hello world'as title;select current_date();
 
 select now();
 select time();
 select utc_time();
 
 create table dt_date(
 dob date,
 entry_time time,
 recieved_on datetime
 );
 
 select * from dt_date;
 
 insert into  dt_date values (
 current_date(),current_time()
 ,now());
 select * from dt_Date;
 
 select * from employees
 where commission_pct is not null;
 
 select distinct department_id,job_id from employees;

 select distinct * from employees;
 
 select * from employees 
 where manager_id is null;
 select * from departments;
 
 select * from departments
 where department_name like 'IT%';
 
 -- order by 
 select first_name,department_id from employees
 order by department_id;
  select first_name,department_id,hire_date from employees
 order by department_id,hire_date;
 
 select first_name,department_id,hire_date from employees
 order by 2,3;
 
 select first_name,last_name from employees
 where first_name like '%li'
 order by first_name;
 
 select * from employees;
 select * from employees limit 4,1;
 
 select * from employees
 order by salary desc
 limit 2,1;
 
 select * from employees 
 
where job_id like '%ST%'
 order by salary desc
 limit 2,1;
 
 select round(154.62,2);

select truncate(154.937,2);

select floor(145.1);
select ceil(145.01);
 
 select mod(25,2);
 
 select upper(first_name) from employees;
 
 select substring('hello world',6,1) as string;
 
 select length('hello');
 
 
 select rpad(salary , 11
 ,'#') from employees;
 
 select trim('$' from 'MDAM$$');
 
 select concat (first_name,last_name) as emp_name,length(last_name)
 from employees
 where job_id like '%REP%' and last_name like '%a%';
 
-- date functions

select * from employees
where hire_date between '1997/01/01' and '1997/12/31';


select * from employees
where year(hire_date) =1997;

select adddate(curdate(),interval 1 year);

select date_format(current_date(),'%d-%m-%Y');


select first_name,last_name,datediff(current_date(),hire_date)/365 as tenure 
from employees
order by tenure;

select first_name , year(current_date())-year(hire_date) as tenure
from employees
order by tenure;

select if (mod(60,2),'odd','even');
select * from employees;

select first_name , ifnull(commission_pct,0.01)
from employees;

select nullif(10,10);

select first_name,job_id, 
if(job_id="IT_PROG",NULL,job_id) revised_job
from employees;

select first_name, salary ,
case
when salary > 20000 then 'very good'
when salary between 15000 and 20000  then 'good'
else 'bad'
end salary_tag
from employees;



select salary , first_name,
case 
when salary > 20000 then 'very good'
when salary between 15000 and 20000 then 'good'
else 'bad'
end salary_tag
from employees;

select count(commission_pct
) from employees;

select count(employee_id),min(salary), max(salary) from employees;


select min(salary) , department_id from employees
group by department_id;

select Count(employee_id) as count  , department_id
from employees
group by department_id
order by count desc;

select department_id,count(employee_id) as count,
case 
when count(employee_id) = 1 then 'junior'
when count(employee_id) between 1 and 3 then 'inter'
else 'senior'
end tag
from employees
group by department_id; 

select department_id , max(salary)
from employees
where salary > 10000
group by department_id;


select department_id,count(employee_id) as cnt
from employees
group by department_id
having count(employee_id) >10;

select department_id,count(employee_id) as cnt
from employees
group by department_id
having department_id in (30,80,90);


select department_id , sum(salary) as spend
from employees
group by department_id
order by spend desc
limit 1;

select * from employees;
select * from departments;

select first_name, e.department_id,department_name 
from employees e join departments d 
on e.department_id=d.department_id;

-- inner join will only take common 

select first_name,e.department_id,department_name,
city from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id;

-- joins 

select first_name , e.department_id,department_name 
from employees e 
join departments d 
on e.department_id = d.department_id
join locations l
on d.location_id=l.location_id;

use hr;
select first_name , last_name, e.department_id,department_name , city
from employees e
join departments d 
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where e.department_id in (80,90);

select e.* ,department_name
from employees e
join departments d
on e.department_id =  d.department_id ;


-- class2 

select city,first_name,e.department_id,department_name,salary
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id;

select city,first_name,e.department_id,department_name,salary
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where e.employee_id is null;

-- 
select job_title, concat(first_name,last_name) as emp_name, max_salary,salary,max_salary-salary as diff_sal
from employees e 
join jobs j
on e.job_id=j.job_id
where max_salary-salary< 1000;

select * from jobs;


select department_name,avg(salary) , count(employee_id)
from departments d join employees e
on e.department_id=d.department_id
group by department_name
order by count(employee_id) desc
limit 1;


select concat(first_name,last_name) as emp , salary,job_title
from employees 
having l.city='london';

select * from locations;
select * from employees; 


select e1.first_name,e1.salary
from employees e1
join employees e2 
on e1.salary > e2.salary
where e2.employee_id=182;


select e1.first_name as employee_name,e2.first_name as manager_name
from employees e1 
join employees e2
on e1.manager_id=e2.employee_id;

select e1.first_name employee_name, e2.first_name manager_name
from employees e1
join employees e2
on e1.manager_id=e2.employee_id;

select e1.first_name  as emp_name ,e1.hire_date emp_joinDate,e2.hire_date as man_joinDate,e2.first_name as man_namen 
from employees e1
join employees e2
on e1.hire_date < e2.hire_date;


select month(hire_date) , count(hire_date) from 
employees
join departments d using (department_id)
join locations l using (location_id)
where l.city = 'seattle'
group by month(hire_date)
having count(hire_date) >2;


-----------------------------------------------------------------------------


-- equi and non equi join

select employee_id  from employees cross join departments;

-- subquery 

select * from employees 
join departments d using(department_id)
where department_name='marketing';

select * from employees where department_id =(select department_id from departments where department_name = 'marketing');

select first_name,employee_id,salary from employees where salary =(select salary from employees where first_name= 'neena');


select * from employees
where salary > (select avg(salary) from employees);


select * from employees
where manager_id = (select employee_id from employees where first_name='payam');