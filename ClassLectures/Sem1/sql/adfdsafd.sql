use pt;
show tables;
select * from departments;


select department_id,department_name, avg(manager_id) from departments
group by department_id,department_name;


select * from departments;

select s.department_id , s.department_name ,s.manager_id
from departments s
join (select  department_id ,department_name ,max(manager_id) 
from departments
group by department_id) t 
on s.department_id=t.department_id AND s.manager_id=t.max(manager_id)
order by s.manager_id desc;


select s.department_id , s.department_name ,max(manager_id)
from departments s
group by department_id;


select vname from students1
 where location = bangalore
 group by name 
 having count(course) > 1;
 
 create table mass_table(
 weight decimal(10,4)
 );
 
 insert into mass_table values (34.0);


select * from mass_table;

select weight , floor(weight) as kg , round(mod(weight*1000,1000)) as grams 
from mass_table;
 
 
 select * from employees;
 
 
 
 select first_name,last_name, salary, 
 case 
 when salary > 15000 then "good"
 when salary between 10000 and 15000 then "avg"
 else "bad"
 end salary_tag
 from employees;