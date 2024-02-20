create schema pt;
CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);
	
INSERT INTO departments VALUES ( 10,'Administration',200,1700);
INSERT INTO departments VALUES (20,	'Marketing',201,1800);
INSERT INTO departments VALUES (30,	'Purchasing',14,1700);
INSERT INTO departments VALUES (40,'Human Resources',203,2400);
INSERT INTO departments VALUES (50,'Shipping',121,1500);
INSERT INTO departments VALUES (60,	'IT',103,1400);
INSERT INTO departments VALUES (90,'Executive',100,1700	);


CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);
    
 INSERT INTO employees VALUES (100,'Steven',	'King',	'SKING','515.123.4567',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),	'AD_PRES',	24000,	NULL,	NULL,	90	);
INSERT INTO employees VALUES (101,'Neena','Kochhar','NKOCHHAR',	'515.123.4568',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),	'AD_VP',17000,NULL,	100,90	);
INSERT INTO employees VALUES (102,'Lex','De Haan','LDEHAAN',	'515.123.4569',
	STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),	'AD_VP',17000,NULL,	100,90	);
INSERT INTO employees VALUES (103,'Alexander','Hunold','AHUNOLD','590.423.4567',
	STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),	'IT_PROG',9000,NULL,102,60	);
INSERT INTO employees VALUES (104,'Bruce','Ernst','BERNST',	'590.423.4568',
	STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),	'IT_PROG',6000,NULL,103,60	);
INSERT INTO employees VALUES (105,'David','Austin','DAUSTIN','590.423.4569',
	STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),'IT_PROG',4800,NULL,103,60	);
    
    

---- 1. Write a query that returns the result <Name of employee> joined on <Hire_date> for all the employees .
  
  -- Sample Output :Namrata Joined on 1st January 1999( 2 Mark)
----Solution:
		select distinct concat(first_name,' joined on ',date_format(hire_date,'%D %M %Y')) 
		from employees;
        
----- 2. Write down the query to print first letter of a Name in Lower Case and all other letter in Upper Case.(3 Marks)"
----Solution:
		SELECT First_Name,concat(lower(SUBSTRING(First_Name,1,1)),upper(SUBSTRING(First_Name,2,LENgth(First_Name)-1)))
 		AS First_Name from employees;
 		
----- 3. Write a query to display the first & last names of all the employees separated by a space as employee_name and the numbers of years that the employee has been working with the company for only those employees who have been working with the company for more than 30 years. (2 Mark)
----Solution:
		Select concat(first_name,' ',last_name) as employees_name ,year(current_date())-year(hire_date) as Tenure from employees
		where year(current_date())-year(hire_date)>30;
		
		
-----4. display the grade of the employee according to their salaries: (3 Marks)
# If salary <3000 grade v
# if salary between 3000 and 5000 grade iv 
# if salary >5000 and <=10000 grade iii 
# if salary>10000 and <=50000 grade ii
# if salary>50000 grade i "

----Solution:
	SELECT employee_id,
	CASE 
     WHEN salary<=3000 THEN 'v'
    WHEN salary>=3000 and salary<=5000 THEN 'iv'
    WHEN salary>5000 and salary<=10000 then 'iii'
    WHEN salary>10000 and salary<=50000 then 'ii'
     When salary>50000 then 'i'
END as grade
FROM employees;
		
----- 5. Display the First Name, Job ID and the Hire Date of all the employees who have the same joining date(3 Mark)"
----Solution:
		select e1.first_name, e1.job_id,e1.hire_date 	from employees e1 join employees e2
		where e1.employee_id!=e2.employee_id
		and e1.hire_date=e2.hire_date;
  
		
-----6. Write a Query to find maximum salary for each department.(2 Marks)
----Solution:
		Select department_id,max(salary) from Employees group by department_id;

-----7. Display the headcount of employees in each department along with department name (3 Mark)
----Solution:
	SELECT  department_name, COUNT(employee_id) headcount
	FROM  employees e INNER JOIN departments d
        ON d.department_id = e.department_id
	GROUP BY 
    e.department_id;
    
        ------ 8. Display employee_id, first_name, salary, department_id for department_id 60 and 90 using Set operators. (2 Marks)
----Solution:
SELECT employee_id, first_name, salary,department_id
FROM employees
WHERE department_id=60
UNION
SELECT employee_id, first_name, salary,department_id
FROM employees
WHERE department_id=90
ORDER BY 3;
select * from employees;

----- 9. Display 2th highest salary of employee using subquery . (3 Mark)"
----Solution:
select min(salary ) 
from (select salary from employees order by salary desc limit 2)a;


----10. Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees who draw a salary more than the average salary of their respective department. (2 Mark)
----Solution:
	SELECT employee_id, first_name, last_name,salary,department_id
	FROM employees e
	WHERE salary > ANY  (SELECT avg(salary)
		FROM employees
		WHERE e.department_id  = department_id )
		ORDER BY department_id ; 
		
----11. Write the appropriate window function for below question:  (1 mark)
	
-- Health of the cat is determined by it weight & show quality. In this scenario assist the breeder to solve the buyers queries
--Print a list of breeds, and the second lightest weight of that breed
--Return: breed, imagined_weight
--Order by: breed
---	breed			imagined_weight
--	BritishShorthair	4.8
--	Maine Coon			5.4
--	Persian				4.5
--	Siamese				6.1


--Solution:nth_value()

----- 12.Write the appropriate window function for below question : (1 mark)
-- We are worried our cats are too fat and need to diet.
-- We would like to group the cats into quartiles by their weight.
-- Return: name, weight, weight_quartile
-- Order by: weight


--Solution:ntile()

---- 13.Write the appropriate window function for below question : (1 mark)
-- The breeder would like to know what weight percentile the cat  is in. This requires casting to an integer
-- Return: name, weight, percent
-- Order by: weight



--Solution:cume_dist()


---- 14.The breeder would like to see the next heaviest cat's weight when grouped by breed : (1 mark)

--Print a list of cats, their weights and  the next heaviest cat's weight 

-- Return: name, weight, breed, next_heaviest
-- Order by: weight

--Desired output:
--name		weight	breed				next_heaviest
--Tigger	3.8		British Shorthair	4.8
--Molly		4.2		Persian				4.5
--Ashes		4.5		Persian				5
--Charlie	4.8		British Shorthair	4.9

--Solution:lead(weight, 1)



-----15 The breeder would like to segregate   cat based on lowest weight by color.

--Print cat name, color and the minimum weight of cats with that color.
--Return: name, color, lowest_weight_by_color
--Order by: color, name

--Desired output:
--name		color		weight_by_color
--Ashes		Black		4.2
--Charlie	Black		4.2
--Molly		Black		4.2
--Oscar		Black		4.2
--Smudge	Black		4.2
--Alfie		Brown		5.5
--Misty		Brown		5.5
--Smokey	Brown		5.5


--Solution:first_value(weight) over (partition by color order by weight) 

----16. Write a DDL Statement to create the below table  (5 marks)

	Table name :	Course 
	Columns/Attributes	Datatype
	Course_ID             Int
	Course_Name 		  Varchar(10) 
	course_duration 	  int 
	course_title 		  varchar(20) 
	course_start_date 	  date

-- Create a check constraint on column course_duration should be less than or equal to 21.
-- Create a check constraint on course_title should be in 'Python','SQL','STATS'

-- Solution

CREATE TABLE COURSE
(
Course_ID Int,
Course_Name Varchar(10) ,
course_duration int CHECK (course_duration <= 21),
course_title varchar(20) check (course_title in ('Python','SQL','STATS')),
course_start_date date);


----17. Write a DDL Statement to create the below view   (5 marks)
  
--Refer to the schema of employees and departments
--Create view emp_dept with employee_id,department_id,departmentname,salary,
--commission,hiredate from employees and departments table


