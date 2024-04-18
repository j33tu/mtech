create database g2;
use g2;
create table g2family(
name varchar(20),
age int,
dep varchar(20),
salary float);
insert into g2family values(
'jitendra',32,'IT',50000
)
;

desc employees;


select * from g2family;

use employees;
show tables;

use hr;
show tables;
desc countries;

show tables;

use hr;
show tables;
use employees;
show tables;
desc g2store;

alter table g2store rename column mobile to phone;
desc g2store;

alter table g2store add column surname varchar(20);
desc g2store;

alter table g2store add column mobile int after rollnumber;

select * from g2store;
alter table g2store modify column  phone varchar(20);
insert into g2store values ('jitendra',063,8879374285,'singh');
select * from g2store;

truncate table g2store;
select * from g2store;

drop table g2store;


show tables;

create table g2(
name varchar(20),
age int,
mobile varchar(10),
surname varchar(20));
select * from g2;
alter table g2 modify column  surname varchar(15);
insert into   g2  values ('jitendra',22,8879374285,'singh');
select * from g2;

drop table g2;

select * from g2;

create table g2 (
name varchar(20),
surname varchar(20),
mobile varchar(10)
)
;
insert into g2 values
('jitendra','singh',8879374285),
('sandy','koli',7506385576)
;
select * from g2;
update g2 set surname='gobar' where name = 'jitendra';

select * from emp;

update emp set salary = salary +100000;
select * from emp;
delete from emp where dep_id=1;

select* from emp;

show tables;

use hr
show tables;
select * from employees
where salary is Null;

select * from emp_dept;

use hr;
show tables;

use employees1;
show tables;
select * from emp;

use hr;
select * from employees;

select concat(first_name,last_name) as name from employees;

## emp workingfor department80
select * from employees;
select * from employees 
where department_id = 80;

select * from employees
where salary > 10000 && department_id =80;

select * from employees
where department_id in (80,100,90);

select * from employees
where salary between 10000 and 20000;

select * from employees
where salary >=10000 and salary <=20000;

select salary ,hire_date from employees
where first_name in ('Neena','lex');

select first_name,job_id 
from employees
where first_name like'%s%';

select first_name,job_id from employees
where job_id like '%cle%';

select first_name from employees
where first_name like '__e_';

select first_name,last_name, salary, salary*.10 as bonus from employees;

select first_name, salary*12 as CTC from employees
where department_id=80;

select first_name,salary , salary*.1 as bonus from employees
where salary*.1 > 1000;

select salary, first_name,salary*ifnull(commission_pct,0) as pct from employees;


select current_date();
select current_time();
select now();



create table dt_datea(

dob date,
entry_time time,
recieved datetime
);
insert into dt_datea values
(date(),time(),now());

select * from dt_datea;

insert into dt_datea values
(current_date(),current_time(),now());
select * from dt_datea;

select * from employees 
where department_id not in (80,90);

select * from employees;
where commission_pct is not NULL;

select distinct department_id from employees
where department_id is not NULL;

select concat(first_name,last_name) as name from employees
where manager_id is NULL;

select * from departments;

select distinct department_id,department_name from departments
where department_name like '%IT%';

-- order by 
select first_name , department_id , salary from employees
order by department_id,salary desc;

select first_name, hire_date from employees
order by hire_date;

select first_name,department_id,hire_date
from employees
order by department_id,hire_date;

select first_name, last_name, department_id
from employees
where first_name like 'Adam';

select first_name,last_name from employees
where last_name like '%LI%'
order by 1 asc;

select * from employees limit 5;

select first_name,last_name,salary from employees
order by 3 desc limit 3;

select max(salary) from employees;

select first_name,last_name,salary,job_id from employees
where job_id = 'ST_MAN'
order by salary desc limit 1;

select round(5454.156154,2);

select truncate(154.8894,1)
;
select floor(154.0);

select ceil(145.1);


select sqrt(25);
select mod(25,2);

select upper(first_name) from employees;

select substr("hello world",2,20) as sub;

select instr("hello world",'o');

select rpad(salary,10,"#")  from employees;


select employee_id,concat(first_name,last_name) as fullname, length(last_name),instr(last_name,'a') 
from employees
where job_id like '%REP%';

select first_name,hire_date  from employees
where hire_date between '1997/01/01' and '1997/12/31'
order by 2 asc; 

select * from employees
where year(hire_date) = 1997;

select * from employees
where extract(month from hire_date) =12;


select adddate(current_date(),interval 1 year);


select hire_date,first_name, last_name, adddate(hire_date,interval 1 year) from employees;

select str_to_date('12-12-1989','%d-%m-%Y');

select extract(year from current_date())-extract(year from hire_date) as tanure,first_name
from employees
order by 1 desc limit 1;

select * from employees;

select first_name,salary,
if (salary>10000,'Good','Normal') as salary_Tag from employees;

select first_name,last_name, if(job_id='%IT&%',"IT","NON-IT") from employees;

select first_name,salary,ifnull(commission_pct,0.12)*salary as bonus from employees;

select first_name,last_name,ifnull(job_id,'jobless') as jobtype from employees;

 select first_name,last_name,salary,
 case 
 when salary >20000 then "very good"
 when salary between 18000 and 19999 then "Good"
 when salary between 15000 and 17999 then "Avg"
 when salary between 12000 and 14999 then "Ok"
 else "BAD"
 end salary_tag
 from employees;
 
 
 create table author(
 name varchar(10) not NULL default 'mr.x',
 id int primary key,
 country varchar(20) not NULL 
 check (country in('UK','USA','UAE')),
 page int check(page>0)
 
 );
 
 
 insert into author values(
 'jitendra','12','UK',200
 )
 ;
 select * from author;
 
 show tables;
 
 drop table author;
 
 create table g2(
 name varchar(10) not NULL
 check (name in('jitendra','jeetu')),
 last_name varchar(20) not NULL default 'g2'
 );
 
 insert into g2 values
 ('jeetu','')
;
select count(*) from employees;

select count(employee_id) from employees;

select count(department_id) from employees;

select count(distinct department_id) from employees;

select count(employee_id),min(salary),max(salary),avg(salary) from employees;

select min(salary) from employees
where department_id=80;

select department_id,min(salary) from employees
group by department_id;

select count(employee_id),department_id from employees
group by department_id
order by count(employee_id) desc;


select count(employee_id),job_id from employees
group by job_id
having count(employee_id) > 20
order by count(employee_id) desc limit 2
;

select department_id,count(employee_id),
case
when count(employee_id) =1 then "Junior"
when count(employee_id) in (2,3)then "intermedieate"
else "senior"
end dept_tag
from employees
group by department_id;
select department_id,max(salary) max_sal from employees
where salary>10000
group by department_id;


select department_id,max(salary) as max_sal from employees
group by department_id
having max(salary)>10000;


select department_id , count(employee_id) from employees
group by department_id
having count(employee_id) > 10;


select department_id,count(employee_id) from employees
group by department_id
having department_id in (30,80,90)
order by count(employee_id) desc;

select department_id,sum(salary) from employees
group by department_id
order by sum(salary) desc limit 1;


select * from employees;

-- display firstname last name dept name and id


select e.first_name,e.department_id,d.department_name
from employees e
join departments d on e.department_id=d.department_id
where e.department_id in (80,90);

select e.first_name,d.department_id,d.department_name
from employees e
join departments d on d.department_id=e.department_id
where d.department_name= 'marketing';


select department_id,avg(salary) as avg_salary
from employees
group by department_id
having avg(salary) >1000
;

select truncate(156.2654,1);
select round(156.2654,1)
;
select first_name,last_name  from employees
where exists ( select salary 
;

SELECT department_id, COUNT(*) as employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;


SELECT (CHAR_LENGTH('Great Learning') - CHAR_LENGTH(REPLACE('Great Learning', 'a', ''))) AS total_a_count;

select(char_length(replace('greatlearning','a','')));
select(char_length('greatlearning'))

;

SELECT first_name,count(*)
FROM employees
group by first_name
HAVING COUNT(*) > 1;

select * from employees;

use hr;
show tables;
alter table g2
add column address varchar(20);

use hr;
show tables;

select * from employees;

CREATE TABLE t (
	col CHAR
);
INSERT INTO t(col)
VALUES('A'),('B'),('B'),('C'),('D'),('D'),('E');
SELECT 
	*
FROM
	t;
select col , rank() over (order by col)  myrank 
from t;

CREATE TABLE a (
	col CHAR
);

INSERT INTO a(col)
VALUES('A'),('B'),('B'),('B'),('D'),('D'),('E');



select col , rank() over (order by col)  myrank 
from a;

select col , dense_rank() over (order by col)  myrank 
from a;

CREATE TABLE parent_table (
    parent_id INT PRIMARY KEY,
    name varchar(10)
);
CREATE TABLE child_table (
    child_id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent_table(parent_id)
);

use hr;
show tables;
select e.first_name,e.department_id,d.department_name
from employees e 
join departments d on e.department_id=d.department_id
where d.department_name='Marketing';

select e.first_name,e.department_id,d.department_name,l.city
from employees e 
join departments d on e.department_id=d.department_id
join locations l on d.location_id = l.location_id;

select distinct d.department_id,d.department_name
from employees e 
join departments d 
on e.department_id=d.department_id
where e.employee_id is not NULL;


select * from jobs;

select j.job_title,concat(e.first_name,' ',e.last_name) as emp_name,salary,j.max_salary,e.salary,max_salary-salary as diff
from employees e
join jobs j on e.job_id=j.job_id
where max_salary-salary < 1000;


-- display 

select d.department_name,avg(Salary),count(employee_id)
from departments d join employees e
on e.department_id =d.department_id
group by department_name 
order by count(employee_id) desc;


select concat(first_name,last_name),e.Salary,l.city
from employees e
join departments d on d.department_id=e.department_id
join locations l on l.location_id=d.location_id
join jobs j on j.job_id=e.job_id
where city='london';


show tables;

select * from g2;
insert into g2 values
('jitendra','singh','bangalore');
select * from g2;
update g2 set last_name = 'singh'
where name='jeetu';

select * from g2;
set autocommit=0;
savepoint k;
update g2 set last_name='nsingh'
where name='jeetu';
select * from g2;
rollback to savepoint k;

select * from g2;

-- selfjoin 

select e1.first_name,e1.salary from 
employees e1
join employees e2 
on e1.salary>e2.salary
where
e2.employee_id=182;

select first_name,last_name,salary from employees
where salary > (select salary from employees where employee_id=182);

select e1.first_name as emp_name,e2.first_name as manager_name;



select e1.first_name employee_name, e1.hire_date employee_join_date,
e2.first_name manager_name,e2.hire_date mgr_join_date
from employees e1
join employees e2 
on e1.manager_id=e2.employee_id
where e1.hire_date < e2.hire_Date;

select month(hire_date), count(hire_date) from 
employees e join departments d using (department_id)
join locations l using (location_id)
where city='seattle'
group by month(hire_date);


select employee_id from employees cross join departments;


select first_name,salary
from employees
where salary > (select avg(salary) from employees);



select first_name,year(hire_Date) from employees
where year(hire_date) =(select year(hire_date) from employees where first_name='clara');



select max(salary) from employees where salary<;
select max(salary) from employees where salary < (select max(salary) from employees);

select distinct salary from employees
order by salary desc limit 1,1;
select * from employees where salary <(
select avg(salary) from employees 
where department_id=(select department_id from employees where first_name='laura'));


select * from employees
where salary >  (select max(salary) from employees where first_name='david');

select salary from employees where first_name='david';

select * from employees where salary > any (select avg(salary) from employees group by department_id);


select department_id,department_name
from departments
where department_id in (select distinct(department_id) from employees where department_id is not NULL);

select * from employees where exists
(select * from employees where department_id=80);

select department_id,department_name from departments d 
where exists (select * from employees where department_id=d.department_id);

select first_name,salary from employees e 
where salary > any 
(select avg(salary) from employees
where department_id=e.department_id);

select sum(salary),department_id 
from employees e
group by department_id
 order by sum(salary) desc limit 1;
 
 select department_id,sum(salary) from employees
group by department_id
having sum(salary)>=ALL
(select sum(salary) from employees group by department_id);


select count(employee_id) , department_id  from employees
group by department_id
having count(employee_id) <=ALL (select count(employee_id) from employees group by department_id);


select department_id,avg(salary) from employees
group by department_id
having avg(salary) <= All (select avg(salary) from employees having department_id in (80,90));


select * from (select first_name,salary,salary*.1 as bonus from employees ) t
where bonus < 1000;


with t as 
(select salary,salary*.10 as bonus from employees)
select * from t 
order by  bonus desc;



select job_id,
case 
when job_id like'%clerk%' then 'cleark'
else 'man'
end revised_jobid
from employees;


select 'Manager' Job_id,count(job_id) Total_count from employees
where job_id like '%mgr%' or job_id like '%man%'
union
select 'Clerk',count(job_id) from employees
where job_id like '%clerk%';

select department_id,job_id, count(job_id) from employees
 where department_id=80
 group by department_id,job_id
 union;
 select count(job_id) from employees
where department_id=80;
with t as (
select first_name,salary,department_id,rank() over (order by salary desc) rnk
from employees
)
select * from t 
;


with t as
(select first_name,salary,dense_rank() over (order by salary desc) RNK
from employees)
select * from t;


use hr;

create view v1  as 
select * from employees;
desc v1;

select * from V1;
update v1 set department_id=100 where employee_id=146;
alter view v1 as
select * from employees;