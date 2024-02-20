use hr;
-- display the first_name,department_id,department_name and salary

select first_name,employees.department_id,department_name,salary
from employees join departments
on employees.department_id=departments.department_id;

select first_name,e.department_id,department_name,salary
from employees  e join departments d
on e.department_id=d.department_id;

-- Display first_name,salary,department_id,department_name and city
select first_name,salary,e.department_id,department_name,city
from departments e join employees d
on e.department_id=d.department_id
left join locations l
on d.location_id=l.location_id;

-- Display the first name, last name, department id and department name, 
-- for all employees for departments 80 or 40. -- 35 rows

select first_name,last_name,e.department_id,department_name
from employees e left join departments d
on e.department_id=d.department_id
where e.department_id in (40,80);


select first_name,last_name,e.department_id,department_name
from employees e left join departments d
on e.department_id=d.department_id and e.department_id in (40,80);

-- e.department_id=80 or e.department_id=40

select first_name,last_name,e.department_id,department_name
from employees e,departments d
where e.department_id=d.department_id;


-- Diplsay all the departments including the department where no employees
-- are working
-- 27

select department_id,department_name from departments;

-- Display the department name where employees are working

select  distinct d.department_id,department_name from departments d
inner join employees e
on e.department_id=d.department_id;

-- Display the departments where no employee is working
select distinct d.department_id,department_name
from departments d left join employees e
on e.department_id=d.department_id
where employee_id is not null;



-- display job title, full name (first and last name ) of employee,
--  and the difference between maximum salary for the job 
-- and salary of the employee.
-- generate the list of employees where the difference amount falls less than 1000


select job_title,concat(first_name," ",last_name) as emp_name,
max_salary,salary, max_salary-salary as diff_amount
from employees e join jobs j
on e.job_id=j.job_id
where max_salary-salary <1000;

-- display the department name, average salary and number of employees 
-- working in that department.
-- sales 4500 20

select department_name,avg(Salary),count(employee_id)
from departments d join employees e
on e.department_id=d.department_id
group by department_name;

-- Write a query in SQL to display the full name (first and last name),
--  and salary of those employees who working in  department located in London.

select concat (first_name,last_name) emp_name,salary,job_title
from employees e
 join departments d 
 on e.department_id=d.department_id
join locations l
 on d.location_id=l.location_id
join jobs j on e.job_id=j.job_id
where city='london';


-- self join


-- Display all employee who are earning more than the employee 182

-- select * from employees where salary >182's salary


select e1.first_name,e1.salary from
employees e1 join employees e2
on e1.salary>e2.salary
where e2.employee_id=182;

select e1.first_name,e1.salary from
employees e1 join employees e2
on e1.salary>e2.salary and e2.employee_id=182;

select * from employees where salary>
(select salary from employees where employee_id=182);

-- diplay employee name along with his/her manager name

select e1.first_name employee_name, e2.first_name manager_name
from employees e1 join employees e2
on e1.manager_id=e2.employee_id;

-- List all those employees who joined before their manager
select * from employees; -- 30 rows


select e1.first_name employee_name, e1.hire_date employee_join_date,
e2.first_name manager_name,e2.hire_date mgr_join_date
from employees e1 join employees e2
on e1.manager_id=e2.employee_id  and e1.hire_date<e2.hire_date;


-- Display the month in which more than 2 employees joined in any 
-- department located in seattle.

--  4 months

select month(hire_date),count(hire_date) from 
employees e join departments d using(department_id)
join locations l using(location_id)
where city ='seattle'
group by month(hire_date)
having count(hire_date)>2
order by month(hire_date); 

-- equi and non equi join



-- List all employees who are working less than 25 years as on today

-- datediff(current_date,hire_date)/365 <25;

-- year(current_date)-year(hire_date)<25

-- cross join

select employee_id from employees cross join departments;
-- 107*27


-- subquery
-- display all the employees working for markeing dept.

select * from employees e join departments d using(department_id)
where department_name='marketing';


select * from employees where department_id =
(select department_id from departments where department_name='marketing');

-- Display the employee id, first_name, salary for all employees
--  who earns salary equals to Neena (subquery)

select employee_id, first_name, salary from employees 
where salary =
(select salary from employees where first_name='neena')
and first_name <>'neena';

-- Display the employee id, first_name, salary,job_id for all 
-- employees who earns salary and job_id equals to Neena

select employee_id,first_name,salary,job_id from employees
where (salary,job_id)=
(select salary,job_id from employees where first_name='neena');


select employee_id,first_name,salary,job_id from employees
where salary =
(select salary from employees where first_name='neena')
and job_id=(select job_id from employees where first_name='neena');

-- Display all employees who are earning more than the average salary
-- of an organisation -- 51 rows
select * from employees where salary>
(select avg(salary) from employees);

-- List the reportees of payam -- 8 rows
select * from employees where manager_id=
(select employee_id from employees where first_name='payam');


select e1.* from employees e1 join employees e2
on e1.manager_id=e2.employee_id and e2.first_name='payam';

-- Display the employee details who joined in the same year along with clara
-- Exclude Clara while listing -- 27


select * from employees where year(hire_date)=
(select year(hire_date) from employees where first_name='clara')
and first_name<>'clara';

-- what is the  second highest salary 

select * from employees where salary =
(select max(salary) from employees where salary<
(select max(salary) from employees));

select * from employees where salary =
(select distinct salary from employees order by salary desc limit 1,1);


-- Display the first name,salary, and department ID 
-- for those employees who earn less than the average salary, 
-- of Laura’s department -- 37 rows
select * from employees where salary<
(select avg(salary)from employees where department_id=
(select department_id from employees where first_name='laura'));


-- List all employees who are earning equal to david

select * from employees where salary in
(select salary from employees where first_name='david');
-- 4800,9500,6800

-- List all employees who are earning more than david

select * from employees where salary >ANY 
(select salary from employees where first_name='david');

select * from employees where salary >
(select min(salary) from employees where first_name='david');

-- List all employees who are earning more than all the david
select * from employees where salary >
(select max(salary) from employees where first_name='david');

select * from employees where salary >ALL
(select salary from employees where first_name='david');

-- =ANY /in

-- List employees who are earning more than the avg salary of any of the dept

select * from employees where salary > ANY
(select avg(salary) from employees group  by department_id);


-- List the department id and dept name  where atleast one employee is working
select department_id,department_name from departments where department_id 
not in
(select distinct department_id from employees
where department_id is not null);

select department_id,department_name from departments where department_id 
in
(select distinct department_id from employees
where department_id is not null);

-- List all manager name

select first_name from employees where employee_id in
(select distinct manager_id from employees);

select first_name from employees where employee_id in
(select distinct manager_id from departments);


-- list all employees belongs to location 1700 -- 18 rows


select * from employees where department_id in
(select department_id from departments where location_id=1700);


-- exists

select * from employees where exists
(select * from employees where department_id=800);

-- Display the department where atleast an employee is working

select department_id,department_name  from departments d where exists
(select * from employees where department_id= d.department_id);

select department_id,department_name from departments where department_id 
in
(select distinct department_id from employees
where department_id is not null);





select department_id,department_name  from departments d where not exists
(select * from employees where department_id= d.department_id);


-- in and exists
-- not in and not exists


-- List the department name where atleast 1 employee earninig more than 10000
-- [using in and exists operators]

select department_id,department_name from departments where department_id in
(select distinct department_id from employees where salary>10000);


select department_id, department_name from departments  d where exists
(select '1' from employees where salary>10000 and department_id=d.department_id);

-- List employees when a salary is more than the average salary of 
-- his/her own department

-- compared individual salary with all the dept average salary
select * from employees where salary >ANY
(select avg(salary) from employees group  by department_id);

-- Need to compare average with his/her own department alone -- 38 rows
select * from employees e where salary >
(select avg(salary) from employees where department_id=e.department_id);

-- Find out which department for which the organisation spending
-- more for salary
-- 80 304500.00




select department_id,sum(salary) from employees
group by department_id
having sum(salary)>=ALL
(select sum(salary) from employees group by department_id);

select department_id,sum(salary) from employees
group by department_id
having sum(salary) =
(select sum(salary) from employees group by department_id
order by sum(salary) desc limit 1);

select departemnt_id,sum(salary) from employees group by department_id
order by sum(salary) desc limit 1;


-- display the department with lowest employee count



select department_id,count(employee_id) from employees
group by department_id
having count(employee_id)<=ALL
(select count(employee_id) from employees
group by department_id);

select department_id,count(employee_id) cnt from employees
group by department_id
having cnt=
(select count(employee_id) cnt from employees
group by department_id
order by cnt limit 1);

-- Find the department which has average salary less than the average
-- salary of department 80 -- 7 departments



select department_id,avg(salary) avg_sal from employees
group by department_id
having avg_sal<
(select avg(salary) from employees where department_id=80);

-- select clause subquery

select count(employee_id) emp_count,
(Select count(department_id) from departments) dept_count
 from employees;
 

select employee_id, salary,department_id,
(select department_name from departments where department_id=e.department_id)
dept_name
 from employees e;

-- Display employeename and managername

select first_name employee_name,
(select first_name from employees where employee_id=e.manager_id) manager_name
from employees e;















































































































































































