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
    
    

---- 1. Write a query that returns the result as <Name of employee> joined on <Hire_date> for all the employees .
  
  -- Sample Output :Namrata Joined on 1st January 1999( 2 Mark)

        
----- 2. Write down the query to print first letter of a Name in Lower Case and all other letter in Upper Case.(3 Marks)"
-
----- 3. Write a query to display the first & last names of all the employees separated by a space as employee_name and the numbers of years that the employee has been working with the company for only those employees who have been working with the company for more than 30 years. (2 Mark)

----- 4. display the grade of the employee according to their salaries: (3 Marks)
# If salary <3000 grade v
# if salary between 3000 and 5000 grade iv
# if salary >5000 and <=10000 gradeiii
# if salary>10000 and <=50000 grade ii
# if salary>50000 grade i 


		
----- 5. Display the First Name, Job ID and the Hire Date of all the employees who have the same joining date(3 Mark)"

----- 6. Write a Query to find maximum salary for each department.(2 Marks)
-

----- 7. Display the headcount of employees in each department along with department name (3 Mark)

    
----- 8. Display employee_id, first_name, salary, department_id for department_id 60 and 90 using Set operators. (2 Marks)


----- 9. Display 2th highest salary of employee using subquery . (3 Mark)"



---- 10. Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees who draw a salary more than the average salary of their respective department. (2 Mark)


		
---- 11. Write the appropriate window function for below question:  (1 mark)
	
-- Health of the cat is determined by it weight & show quality. In this scenario assist the breeder to solve the buyers queries
--Print a list of breeds, and the second lightest weight of that breed
--Return: breed, imagined_weight
--Order by: breed
---	breed			imagined_weight
--	BritishShorthair	4.8
--	Maine Coon			5.4
--	Persian				4.5
--	Siamese				6.1




----- 12 .Write the appropriate window function for below question : (1 mark)
-- We are worried our cats are too fat and need to diet.
-- We would like to group the cats into quartiles by their weight.
-- Return: name, weight, weight_quartile
-- Order by: weight


-
---- 13.Write the appropriate window function for below question : (1 mark)
-- The breeder would like to know what weight percentile the cat  is in. This requires casting to an integer
-- Return: name, weight, percent
-- Order by: weight






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





-----15. The breeder would like to segregate   cat based on lowest weight by color.

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



---- 16. Write a DDL Statement to create the below table  (5 marks)

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




---- 17. Write a DDL Statement to create the below view   (5 marks)
  
--Refer to the schema of employees and departments
--Create view emp_dept with employee_id,department_id,departmentname,salary,
--commission,hiredate from employees and departments table


