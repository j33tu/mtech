 use employees;
 
 create table persons (
 id int not null,
 lastname varchar(255) not null ,
 firstname varchar(255) not null ,
 age int check (age > 25)
 );
 
 
 show tables;
 
 select * from persons;
 
 create table emp_dept (
 employee_id int ,
 department_id int,
 departmentname varchar(10),
 salary int,
 commission int,
 hiredate date
 );
 
 select * from emp_dept;
 
 use hr;
 
 select salary , first_name from employees 
 order by salary desc
 limit 5;
 
 select * from
(select first_name,salary,salary*0.1 bonus
from employees) e
where bonus <1000;

with t as (select salary,first_name,salary*.1 as bonus from employees)
select * from t
where bonus < 1000;


select * from
(select  row_number()over() 'S.No' , first_name,salary,department_id
from employees) temp
;

-- rank()
select * from 
(select first_name,salary,department_id,
rank()over(order by salary desc) rnk
from employees)temp
order by rnk asc;

select * from (select first_name,salary,department_id, dense_rank()over(order by salary asc) rnk
from employees ) tmp
order by rnk asc;

select * from (select first_name,salary,department_id, rank()over(order by salary asc) rnk
from employees ) tmp
order by rnk asc;


select app , reviews,rank()over( order by reviews desc) as review_rank
from googlestore
select username,avg(session_in_time) as avg_session_time from usersession_data

group by username



select S.staff_id,S.name, SUM(I.INCENTIVE_AMOUNT) AS TOTAL_INSENTIVE , COUNT(I.INCENTIVE_DATE) AS CNT
from STAFF S
JOIN INCENTIVES I 
ON S.STAFF_ID=I.STAFF_REF_ID
GROUP BY S.STAFF_ID,S.NAME
HAVING COUNT(I.INTENSIVE_DATE) >1;
