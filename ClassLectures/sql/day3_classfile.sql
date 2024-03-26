select * from bag_of_words_model;
use hr;

-- subquery in from clause/derived table/inline table
select * from
(select first_name,salary,salary*0.1 bonus
from employees) t
where bonus<1000;

-- CTE with clause

with t as
(select first_name,salary,salary*0.1 bonus
from employees)
select * from t
order by bonus;

select * from t;

select revised_jobid job_id,count(revised_jobid) total_count from
(select job_id,
case when job_id like '%clerk%' then 'Clerk'
else 'Manager'
end revised_jobid
 from employees
where job_id like '%mgr%' or job_id like '%man%' or
job_id like '%clerk%')temp
group by revised_jobid;

select 'Manager' Job_id,count(job_id) Total_count from employees
where job_id like '%mgr%' or job_id like '%man%'
union
select 'Clerk',count(job_id) from employees
where job_id like '%clerk%';

select * from 
(select department_id,job_id, count(job_id) from employees
 where department_id=80
 group by department_id,job_id) t1
cross join
(select count(job_id) from employees
where department_id=80)t2;

select department_id,job_id, count(job_id),
(select count(job_id) from employees
where department_id=80) total_count
 from employees
 where department_id=80
 group by department_id,job_id;

-- Advanced analytical function
-- Ranking function
-- row_number()

select * from employees;

select * from
(select row_number()over() 'S.No' , first_name,salary,department_id
from employees) temp
where `S.No` between 10 and 20;

-- rank()
select * from 
(select first_name,salary,department_id,
rank()over(order by salary desc) rnk
from employees)temp
where rnk=3;

-- dense_rank()

select * from 
(select first_name,salary,department_id,
dense_rank()over(order by salary desc) rnk
from employees)temp
where rnk=6;

select first_name,salary,
cume_dist()over(order by salary) dist_value
from employees;



-- aggregate fns min(),max(),sum()count(),avg()


(select first_name,salary,department_id, 
dense_rank()over(order by salary desc) rnk,
avg(salary)over() avg_sal,
max(salary)over() max_sal
 from employees)t;
 
 -- Display employees who are earning salary more than
 -- average salary of an organisation
 
 select * from employees where salary>
 (select avg(salary) from employees);
 
 select * from 
 (select *,
 avg(salary)over() avg_Sal from employees)t
 where salary>avg_sal;
 
 
-- Display employees where salary more than average salary
-- of his/her own dept
select * from
(select first_name,department_id,salary,
avg(salary)over(partition by department_id) avg_Sal
from employees)t
where salary>avg_sal;

select first_name,department_id,salary from employees e1
where salary>
(select avg(salary) from employees
where department_id=e1.department_id);

-- List the senior employee

select first_name from employees
order by hire_date limit 1;

select first_name from employees where hire_date=
(select min(hire_date) from employees);

select department_id,max(hire_date) from employees;


-- List all the seniors from each dept

select * from 
(select first_name,department_id,hire_date,
min(hire_date)over(partition by department_id) min_date
from employees)t
where hire_date=min_date;

select * from employees e where hire_date=
(select min(hire_date) from employees 
where department_id=e.department_id);


-- display the recent hired employee detail from each dept
-- 14 rows
select * from
(select first_name,department_id,hire_date,
dense_rank()
over(partition by department_id order by hire_date desc) rnk
from employees)t
where rnk=1;

-- List all those employees who joined in the organisation
-- recent half period

select max(hire_date) from employees;
select min(hire_date) from employees;

select max(hire_date)-min(hire_date) from employees;


-- 18-11-1993

select * from employees where hire_date>
(select adddate(min(hire_date),interval 
(select round(datediff(max(hire_date),min(hire_date))/2,0) 
from employees) day) mid_date
from employees);


-- lead() lag() functions

select first_name,salary,
lead(salary)over() next_salary from employees;

select first_name,salary,
lag(salary)over() next_salary from employees;

-- List the employee_id, first_job,promoted_job
select * from job_history;
101 AC_ACCOUNT AC_MGR

select * from
(select employee_id, job_id first_job,start_date joined_date,
lead(job_id)over(partition by employee_id order by start_date)
promoted_job,
lead(start_date)over(partition by employee_id order by start_date)
promoted_date
from job_history)t
where promoted_job is not null;
-- first_value(), last_value()

select salary, first_value(salary)over() from employees;
select salary, last_value(salary)over() from employees;

select salary, first_value(salary)over(order by salary desc) from employees;

select salary, last_value(salary)
over(order by salary desc 
rows between unbounded preceding and unbounded following
) from employees;

select salary, first_value(salary)
over(order by salary
rows between current row and unbounded following)
from employees;

-- rows between 1 preceding and 1 following

select salary,
sum(salary)over(rows between 1 preceding and current row) tot_Sal
from employees;


select salary, salary+lag(salary)over() tot_sal
from employees;



-- cummulative total

select department_id,salary , 
sum(salary)over( rows between unbounded preceding and
current row) running_total
from employees;

select department_id,salary , 
sum(salary)over( partition by department_id between unbounded preceding and
current row) running_total
from employees;


-- Find the average frequency of appoinments for each dept.

select avg(days) from
(select hire_date first_appoinment,
lag(hire_date)over(order by hire_date) previous_appoinment,
datediff(hire_date,lag(hire_date)over(order by hire_date)) days
from employees
where department_id=90)t;



select  department_id,avg(days) from
(select department_id,hire_date first_appoinment,
lag(hire_date)
over(partition by department_id order by hire_date) previous_appoinment,
datediff(hire_date,
lag(hire_date)over(partition by department_id order by hire_date)) days
from employees
)t
group by department_id;

-- Foreign key

-- views
use hr;
create view v1 as
select * from employees where department_id=80;

desc v1;

select * from v1;

update v1 set department_id=100 where employee_id=146;


alter view v1 as
select * from employees;

drop view v1,v2;



































































