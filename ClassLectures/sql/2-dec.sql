


use hr;

-- only common records 

select first_name,e.department_id,department_name,salary
from employees e  inner join departments d
on e.department_id=d.department_id;


-- left join  common + left table all records , even if its Null it will deisplay 


select first_name,e.department_id,department_name,salary
from employees e  left join departments d
on e.department_id=d.department_id;

-- right join 
-- table1 left join table2 == table2 right on table1 

-- need name salary department id department name and city from locations

Select first_name,salary,e.department_id,department_name,city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id=l.location_id;

-- with nulls use left join 

Select first_name,salary,e.department_id,department_name,city
from employees e left join departments d
on e.department_id = d.department_id
left join locations l
on d.location_id=l.location_id;

use hr;

select * from employees limit 300;

-- display first name last name department id and department ame
-- for all employee for department 80,40

select first_name,last_name,e.department_id,department_name  
from employees  e join departments d
on e.department_id=d.department_id
where e.department_id in (80,40);

--  display all departments including the department where no empoyeees are working 


select * from departments;

-- display the department name where employees are working 

select distinct d.department_id,department_name 
from departments d join employees e
on d.department_id=e.department_id;
-- may or may not needed where e.department_id is not Null;

-- where no employees are working 

select distinct d.department_id,department_name ,employee_id
from departments d left join employees e
on d.department_id=e.department_id
where employee_id is null;

-- where emp are working and se distinct 

select distinct d.department_id,department_name ,employee_id
from departments d left join employees e
on d.department_id=e.department_id
where employee_id is not null;


-- 

-- display job title,  full name of employee and difference between max salary for the job and salary for employee

use hr;
select job_title,concat(first_name,'  ',last_name) employee_name,max_salary,salary,max_salary-salary diff_amount
from employees e join jobs j
on e.job_id =  j.job_id
where max_salary-salary<1000;

-- display department name aerage salary and number of employees working in that department 

select * from departments;
select department_name,avg(salary) avg_salary,count(employee_id)
from departments d join employees e
on d.department_id=e.department_id
group by department_name;

-- 

select concat(first_name,'  ',last_name) as full_name,salary,e.department_id ,city
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where l.city='London';



-- get all employees earning more than empoyee_id 182 

select * from locations;
select salary from employees where employee_id=182;
select first_name,salary from employees
where salary > (select salary from employees where employee_id=182);


select e1.first_name,e1.salary
from employees e1 join employees e2
on e1.salary>e2.salary
where e2.employee_id=182;

select e1.first_name,e1.salary
from employees e1 join employees e2
on e1.salary>e2.salary and e2.employee_id=182;


-- display employee name along with his/her manager name

select e1.first_name,e2.first_name as manager_name
from employees e1 join employees e2
on e1.manager_id=e2.employee_id;


-- get all employees and their manager where joining date of emp is before managers joining date 

select e1.first_name as emp_name,e2.first_name as manager_name,e1.hire_date as emp_join_date,e2.hire_date as manager_hire
from employees e1 join employees e2
on e1.manager_id=e2.employee_id and e1.hire_date < e2.hire_date;

-- display the month in which more than 2 employees join in any department located in seattle


select month(hire_date) as month,count(hire_date) as month_count
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where l.city='seattle'
group by month(hire_date)
having count(hire_Date) > 2
order by month(hire_date);


-- equi join vs non equi joins 

-- 

select first_name,hire_date from employees
where datediff(current_date,hire_date)/365 < 25;


-- cross Join 

-- join two tables with out any condition  out put will be m * n  



select * from employees cross join locations;


-- natural join looks for any common keys existing in table , only common records will be fetched 

-- sub queries 

-- single row sub query >> return a single colume 

-- display all employeed working for marketting dept

Select * from employees where department_id = (select department_id from departments where department_name='marketing');


-- above is single row sub query as using == operator 

-- display the empoyee id , firstname salary of all employee who earn salary wquel to neena


select employee_id,first_name,salary from employees
where salary = (select salary from employees where first_name = 'Neena');

-- this is called non co related sub query  no dependency query 


--  emplloyees the employee details who all are earning salary and job id eals to neena

select employee_id,first_name,salary from employees
where (salary,job_id) = (select salary,job_id from employees where first_name = 'Neena');

-- 
select employee_id,first_name,salary from employees
where salary = (select salary,job_id from employees where first_name = 'Neena') 
and job_id = (select job_id from employees where first_name = 'Neena') ;

-- display all employees who are earning more than the evg salary of an organization 


select * from employees 
where salary > (select avg(salary) from employees);


-- list the reporties of payam


select * from employees 
where manager_id =  (select employee_id from  employees where first_name='payam');


select e1.* from employees e1
join employees e2 on e1.manager_id=e2.employee_id and e2.first_name='payam';

-- display employee da


select * from employees 
where year(hire_date) = (select year(hire_date) from employees where first_name='clara')
and first_name <> 'clara';

select distinct(salary) from employees
order by salary desc;

select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

select * from employees where salary = 
(select distinct(salary) from employees
order by salary desc limit 1,1);

-- display frist name salary department id for those employee who ean less than ag salary of laura's department



select first_name,salary,department_id from employees where salary < 
(select avg(salary) from employees where department_id = 
(select department_id from employees where first_name='laura'));

-- above is called multi level sub query 


-- list all emp earning equalt to devid

use hr;

select * from employees where salary in ( (select salary from employees where first_name='david'));

-- for multiple  returns use in (list of values ) use membership operators 
select * from employees where salary >  any  (select salary from employees where first_name='david');

select * from employees where salary  >   (select min(salary) from employees where first_name='david');

-- salary more than all devids

-- = any or in are same 

-- emp earning more than avg salary of any department



select * from employees where salary > any
(select avg(salary) from employees group by department_id);

-- list the department where at least  oe employes is working


select department_id , department_name from departments 
where department_id in (select distinct(department_id) from employees where department_id is not null);

-- departments where people not working 

select department_id , department_name from departments 
where department_id  not in (select distinct(department_id) from employees where department_id is not null);


-- list all manager name 

select * from employees 
where employee_id in (select  distinct(manager_id) from employees);

select * from employees 
where employee_id in (select  distinct(manager_id) from employees);

-- list all employess belongs to location 1700 


select * from employees ;

select * from employees where department_id in (
select department_id from departments
where location_id=1700) ;



-- exist operator 

select * from employees where exists 
(select * from employees where department_id=80 );

select * from employees where exists 
(select * from employees where department_id=800 );

-- disply department where at least and employee is there 


select department_id,department_name from departments d where exists 
(select * from employees where department_id=d.department_id);

-- not exist 
select department_id,department_name from departments d where not exists 
(select * from employees where department_id=d.department_id);


-- list the departmet name where at least 1 employees earning more than 10000 
-- using in and exist operators 

select department_id,department_name from departments d where not exists 
(select * from employees where department_id=d.department_id);

select department_id,department_name from departments where department_id in 
(select distinct department_id from employees where salary >10000);



select department_id,department_name from departments where 
(select distinct department_id from employees where salary >10000);

select department_id,department_name from departments d  where exists
(select '1' from employees where salary >10000 and department_id=d.department_id) ;


-- co relation more data 

-- list 

-- list employes when as salary is more than the average salary of his her own departmenet 


select * from employees e where salary > 
(select avg(salary) from employees where department_id=e.department_id);

-- find out which department has the most expense as salary 

select sum(salary) as sal_expense, department_id from employees
group by department_id
order by sal_expense desc
limit 1;

select sum(salary) as sal_expense, department_id from employees
group by department_id
having sum(salary) >= all 
(select sum(salary)  from employees group by department_id);


--  display departmenet with hightest emp count 

select count(employee_id) as emp_count, department_id from employees
group by department_id
having count(employee_id) <= all 
(select count(employee_id)  from employees
 group by department_id);


-- show departments having less salary than department 80 

select avg(salary) as max_salary,department_id from employees
group by department_id 
having avg(salary) < (select avg(salary) from employees where department_id=80);

-- select clause sub query

select count(employee_id) as emp_count,
(select count(department_id) from departments) dept_count
from employees;

-- select employee

select employee_id,salary,(select department_name from departments as department_name where e.department_id=department_id ) as department_name from employees e;

-- select display employee name and manager name


select concat(first_name,'  ',last_name) as emp_name , (select first_name  from employees where employee_id=e.manager_id) as manager_name
from employees e;

-- 
select * from employees;


-- sub quer in from clause 

select first_name, salary , salary*0.1 as bonus 
from employees
where  salary*0.1 < 1000; 

select * from 
(select first_name, salary , salary*0.1 as bonus 
from employees)temp
where bonus < 1000;

-- CTE with cluase 

with temp as 
(select first_name,salary,salary*0.1 as bonus from employees)
select * from temp
where bonus < 1000;


-- 
select count(employee_id) as emp_count,
(select count(department_id) from departments) dept_count
from employees;

use hr;
Select count(job_id) from employees
where job_id like '%Clerk';


-- solution 

select revised_job_id,count(revised_job_id) from
(select job_id,
case when job_id like '%clerk' then 'clerk'
else 'Manager'
end revised_job_id
from employees
where job_id like '%mgr%' or job_id like '%man%' or job_id like '%clerk%')temp
group by revised_job_id;



select 'manager' job_id, count(job_id) as managers
from employees
where job_id like '%mgr%' or job_id like '%man%'
union
select 'clerk', count(job_id) as clearks
from employees
where job_id like '%clerk%' ;

-- department_id 

select count(job_id),job_id,department_id,(select count(job_id)  from employees where department_id=80) as total_count
from employees  e
where department_id = 80
group by job_id;




-- advanced aggregate functions   Over Functions 
-- partition  by  summed up with other details as well  and group by  returns one value
-- order by 
-- framing and slicing 

-- over -- Rank function , Aggegrate function , analytical functions



-- ranking functions 
select * from
(select row_number()over() 's.no',first_name,salary
from employees) temp
where `s.no` between 10 and 20;

-- rank ()
select * from 
(select first_name,salary,department_id,
rank()over(order by salary desc) rnk
from  employees) temp
where rnk=2;

-- -- in such conditions use dense rank  if rank skips any single rank as two people got same rank 
select * from 
(select first_name,salary,department_id,
dense_rank()over(order by salary desc) rnk
from  employees) temp
;



-- cummulative distributions 

select first_name,salary, cume_dist()over(order by salary) dist_value
from employees;



-- aggregate functions min() max() sum() count() avg()

-- let see how to use them with over functions 

select first_name , department_id, salary,
avg(salary)over()  avg_sal ,
max(salary)over() max_sal
from employees;

select * from (
select first_name , department_id, salary,
avg(salary)over()  avg_sal ,
max(salary)over() max_sal,
dense_rank()over(order by salary desc) rnk
from employees) t;

-- 
-- display employees who are earning salary more than avg salary of roganiza

select * from employees where salary > (select avg(salary) from employees);


select * from
(select * ,
avg(salary)over() avg_sal  from employees where department_id=t.department_id)t
where salary > avg_sal;


-- display employees where salary is more than avg salary of their department 
select * from 
(select first_name,salary,department_id,
avg(salary)over(partition by department_id) avg_salary
from employees) t
where salary > avg_salary;

-- list the senior employees

select first_name from employees where hire_date = (select min(hire_date) from employees);

select * from employees 
where first_name = 'Steven';

select * from employees where employee_id= (select min(employee_id) from employees);



-- list all the seniors from each department 

select * from(
select first_name,department_id,hire_date,
min(hire_date)over(partition by department_id) min_date 
from employees) t
where hire_date=min_date;



select * from employees e where hire_date = (select min(hire_date) from employees where department_id=e.department_id);


-- 
--  display the recent hired emploees detaisl from each department 

select * from employees e where hire_date = (select max(hire_date) from employees where department_id=e.department_id);

select * from (
select first_name,department_id,hire_date,
dense_rank()over(partition by  department_id order by hire_date desc) rnk
from employees)t
where rnk=1;




-- list the employee who joined tho organized recent half period 
select * from employees where hire_date> (
select adddate(min(hire_date),interval(
select round(datediff(max(hire_date),min(hire_date))/2,0) from employees) day) mid_date
from employees );



-- lead() lag() functions 

select  first_name,salary,
lag(salary)over() next_salary from employees;


-- list the emp id first job promoted job 

select * from job_history;



select  employee_id,
lead(job_id)over() first_job,
lag(job_id)over() first_job
from employees
order by employee_id; 

-- uper not good

-- mom solution below 
select * from
(
select employee_id,job_id first_job,
lead(job_id)over(partition by employee_id order by start_date) promoted_job
from job_history)t
where promoted_job is not null;



-- first_value() , last_value()

select salary , first_value(salary)over() from employees;
select salary , last_value(salary)over() from employees;

select salary , first_value(salary)over(order by salary desc) from employees;
select salary , last_value(salary)over(order by salary desc) from employees;

select salary , last_value(salary)over(order by salary desc
rows between unbounded preceding and unbounded following) from employees;

select salary , last_value(salary)over(order by salary desc
rows between unbounded preceding and unbounded following) from employees;

-- above was part of over clause 

-- use cases 


select salary,salary+lag(salary)over()
from employees;


select salary, sum(salary)over(
rows between  1 preceding and current row  )
from employees; 

