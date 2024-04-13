use hr;
show tables;
select * from locations;
select * from employees;

select employee_id,first_name,last_name,salary*.1 as bonus,salary
 from employees
 where salary*.5 > 3000;
 
 -- wher clause cant have alias name before order of execution 
 
 
 -- Null values to be treated well 
 -- display firtane_name salary commtion % for all employees 
 select * from employees;
 select first_name,salary,commission_pct from employees;
 -- display firtane_name salary commtion % values  for all employees 
 select first_name,salary,commission_pct,commission_pct*salary as comm_value,commission_pct*salary + salary as total_Salary  from employees;
 
 -- how to handle NULL  this ll  imputation of Null values
 
 -- ifnull() function 
 
  select first_name,salary,commission_pct,salary*commission_pct as comm_value,ifnull(commission_pct,0)*salary + salary as total_Salary  from employees;

-- filter Null using is operator


-- immediate Data , no dependency of on table for this data 
select 1+2;

select 1+2 from dual; -- no need to give this 


select "welcome to sql" as title;

-- build in functions

select current_date();
-- YYYY/MM/DD

select current_time();

select now();

-- above are all pre defined functions 

select utc_timestamp();

-- DATA TYPE FOR DATE

-- date , time , datetime 
-- int , float 

use employees;
create table dt_data
(
dob date,
entry_time time,
transaction_time datetime
);
desc dt_data;

insert into  dt_data values
( '1989/12/12','10:02:23','1980/03/03 12:00:11'
);
select * from dt_data;

-- 
insert into  dt_data values
( current_date(),current_time(),now()
);

select * from dt_data;

-- display emp except the employees  working for dept 80 and 90
use hr;
select * from employees where
department_id not in (80,90);
-- List all employees who all are having comissions
select * from employees where commission_pct is not Null;

-- all operators to filter out the results ;

-- pick unique records 

-- display all the departments frm meploy

-- in which department employees are working


select distinct department_id  from employees;


-- display department wise job titles 

select * from employees;
select distinct job_id,department_id from employees;
select * from employees where manager_id is Null;
-- display department id and depart name who are working with IT related departments

select * from employees;

select department_id,job_id from departments where job_id  like 'IT%';

select * from departments;

select department_name,department_id from departments where department_name  like 'IT%';

---- order by 
select first_name,department_id , salary from employees 
order by department_id,salary desc;
--- display the seniority list for every department 
select * from employees;

select * 
from employees 
order by department_id,hire_date;

-- 
select * 
from employees 
order by 2,3;

-- display firstname and last for whole last name contains li and arrange  first in alphabetical order

select first_name,last_name from employees
where last_name like  '%li%'
order by first_name;

-- Limit 
select * from employees limit 4,1;

-- display the 3rd top earners 
select * from employees
order by salary desc 
limit 0,3;

-- display 3rd highest salied person among st_man job

select * from employees
where job_id = 'ST_MAN'
order by salary desc
limit 2,1;

--  

--

-- functions 

-- peace of code written to do some job and you can recall that any time you want 

-- function are thee buckets based on data types
-- fucations based on numaric, string and date values 

-- round() truncate()
select round(154.767,2);

select truncate(154.765,2);
-- floor(), ceil();
-- converting float and desimal into nearest whole number

select floor(123.546); -- lowest whole numbers

select ceil(12.454);-- nearest highest whole numbers

select cos(0);

select mod(25,2);
select pow(5,2);
select sqrt (252);
-- string functions()

-- lower() upper()
select lower(first_name) from employees;
-- concat and substr are for string management 

select concat('abc','  ','chasmewala');

select concat(first_name,'    ',
last_name) as emp_name from employees;

select substr('hello world',6,5);
select length('hel   ');   
-- instr

select instr('welcome','x');
use hr;
select lpad(salary,10,'*') from employees;
select rpad(salary,10,'*') from employees;


select trim('m' from 'Madan'); -- case sensitive 
-- to remove unwanted symbols 

-- display first_name last_name combined  -- lenth of last_name , position of a  in last name , 
-- for those job_id contains rep and last name with charactor alter

select concat(first_name,'  ',last_name) as fullname,employee_id,job_id,length(last_name) as LON from employees
where job_id like '%REP%' AND last_name like '%a%';

-- Date functions

-- display employees joined during 1997 

select * from employees
where hire_date between '1997/01/01' and '1997/12/31';
;

select * from employees
where hire_date >= '1997/01/01' and hire_date <= '1997/12/31';
;

select * from employees 
where year(hire_date) = 1997;

select * from employees 
where month(hire_date) = 12;


select month(hire_date) from employees;
select day(hire_date) from employees;

select day(current_date()) + 20;

select adddate(current_date(),interval 1 year);

select subdate(current_date(), interval 1 year);

-- date_format()

select date_format(current_date(),'%D/%M/%Y');
select date_format(current_date(),'%d/%b/%Y');


select date_format(now(),'%d/%b/%y/%h/%m/%s');

-- str_to_Date

select str_to_date('19-11-2023','%d-%m-%Y');

-- current_DAte(),current_time() now() utc_timestamp()
-- month() year() day() extract()
-- adddata , subdate, diffdate date_format str_to_date


-- display the tenure of employees as on today 

select first_name, datediff(current_date(),hire_Date)/365 as tenure , hire_date , concat(first_name,last_name) as Full_name 
from employees
order by tenure desc;


select first_name,year(current_date()) - year(hire_date) as tenure 
 from employees
 order by tenure Desc;

--  common problem date comes as string so cant do date operations on that 
select 1+2;
select 1+'a';
select concat(1,'1');

select cast('2023-11-19' as date);
select convert('2023-11-19', date);

help cast;


-- control staments 

-- if else kind of statements 

-- ifNull nullif 

select if (mod(51,2)=0,'even','odd');

-- display firt_name,salary,salary_Tag
-- salary_tag good if salary > 1000 otherwise ok

select first_name,salary, if(salary>10000,'good','ok') as salary_tag from employees;

-- ifnull 

-- display first_name,salary, commision %  display 1 %  if an emp do not have commision 
select * from employees;

select first_name,salary,ifnull(commission_pct,0.01) as commision_pct  from employees;

-- ifnull(exp1,emp2)

-- nullif(exp1,exp2) checked if exp1=exp2 if yes it returns Null

select nullif(10,10);
-- where do we use this 
-- identify all It_programmers and make them Null 


select first_name,job_id,nullif(job_id,'IT_PROG') revised_job 
from employees;

select first_name,job_id,nullif(job_id,'IT_PROG') revised_job 
from employees;

/* slary > 20000 - vgood 
18000 -20000 - good 
15000 - 18000 moderate
12000 - 15000 average 
10000 -12000 ok 
else BAD
*/
select first_name,salary,
case 
when salary > 20000 then 'very good '
when salary between 18000 and 19999 then 'good'
when salary between 15000 and 17999 then 'moderate'
when salary between 12000 and 14999 then 'avg'
when salary between 10000 and 11999 then 'ok'
else 'bad'
end 
salary_tag 
from employees;
-- primary key unique and no Null
-- alternate keys phone numbers may be 

use employees;
create table author 
(id int primary key,
name varchar(10) not null default 'Mr X ',
country varchar(10) not null
check (country in('USA','UK','UAE')),
page int
check(page>0)
);
select * from author;

insert into author values
(
100,'A','UK',30
);

--  ------------------

-- group by 

use hr;

--- aggregate function group functions 
-- sum(), min(),count(),max(), need at least two values 
select count(*) from employees;
select count(employee_id) from employees;

select count(department_id) from employees;
select count(commission_pct) from employees;
select min(commission_pct) from employees;
select max(commission_pct) from employees;
select count(employee_id),min(salary), max(salary),avg(salary) from employees;

select min(salary)  as min_salary_80, department_id 
from employees
group by department_id;

select count(distinct(department_id)) from employees;
select * from employees where salary = (select min(salary) from employees);


-- display total number of empuyees working for each department

select count(employee_id) as count_emp,department_id from employees 
group by department_id
order by count_emp desc
limit 1;
select * from employees;
-- display number of employees working for different desgnation 
select count(employee_id) as count_emp,job_id from employees 
group by job_id
order by count_emp desc
limit 3 ;


-- tag each department based on below creteria

-- tag as junior when single employee is working 
-- tag intermediate when 2-3 emp are working
-- tag senior when more than 3 employees are working 

select count(employee_id) as count_emp,department_id,
case
when count(*) = 1 then 'Junior'
when count(*) in (2,3) then "intermediate"
else "senior"
end dept_tag
from employees
group by department_id
;

-- display department whi has max salary more than 10000
use hr;
select department_id,max(salary) as max_sal from employees
group by department_id
having max_sal>10000
;


-- display department_id and number o employees workng for department 30,80,90 

select department_id , count(employee_id) from employees
where department_id in (30,80,90)
group by department_id;

-- find the department in which organization is spending more on salary 
use hr;
select department_id , sum(salary) as salary_sum from employees
group by department_id
order by salary_sum desc; 
-- Joins are used to query data from two of more tables 
-- inner join only the common key factors 
-- display firstname department id for all employees


select first_name , e.department_id,department_name from employees e inner join departments d
on e.department_id=d.department_id;

select first_name , e.department_id,department_name from employees e inner join departments d
on e.department_id=d.department_id;


select first_name,e.department_id,department_name,city from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id;


-- display the employees workin for marketting department

select e.*,department_name from employees e join departments d
on e.department_id=d.department_id
where department_name = 'marketing';


-- display all the departments includding the dept where no emp are working
select count(employee_id) as count , e.department_id,d.department_name
from employees e join departments d
on e.department_id=d.department_id
group by department_id
order by count desc;