
-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------
use assignment;
select * from students;
# Q1. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
select student_id, name, subject, marks, sum(marks) over(partition by subject) from students;
# Q2. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'

 select student_id, name, subject, marks,
        dense_rank()over(partition by subject order by marks desc) as "rank"
        from students;
 drop table if exists Students_Ranked;
 create table Students_Ranked as
        select student_id, name, subject, marks,
        dense_rank()over(partition by subject order by marks desc) as "rank"
        from students;
-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------


# Q3. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'
with adclicks_stats as
( select website_id, day, ad_clicks, 
	  lead(ad_clicks)over(partition by website_id order by day asc) next_day_adclicks,
      lag(ad_clicks)over(partition by website_id order by day asc) prev_day_adclicks
      from website_stats order by website_id, day) 
 select website_id, day, next_day_adclicks - ad_clicks from
        adclicks_stats where website_id = (select id from web where name = 'Olympus');

# Q4. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.

select name, launch_date, max(launch_date)over() recent_launch_date from web;

-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
# Q5. Write a query thats orders games in the play store into three buckets as per editor ratings received  

select id, name, editor_rating, ntile(3)over(order by editor_rating asc) rating_bucket  from play_store;

# Q6. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, so that the latest game sold gets number 1. Order the result by editor's rating of the game

select name, price, date,
  rank()over(order by date desc) as "rank" from play_store p
  inner join sale s on p.id = s.game_id order by editor_rating;

/* ranking on app based on total sales */
with game_sales_metrics as
( select name, price, date,
  sum(price)over(partition by s.game_id) as total_sales from play_store p
  inner join sale s on p.id = s.game_id )
  select name, price, date, total_sales,
  rank()over(order by total_sales desc) as salesrank,
  dense_rank()over(order by total_sales desc) as salesdenserank
  from game_sales_metrics;



-----------------------------------------------------------------
# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------



# Q7. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).

select * from customers;
select * from movies;
select * from customers;
alter table customers add column join_dt date after join_date;
update customers set join_dt = str_to_date(join_date, '%d-%m-%Y');
select * from customers;
alter table customers drop column join_date;
alter table customers rename column join_dt to join_date;
table ratings;
table movies;
table customers;
table rent;
alter table rent add column rental_dt date after rental_date;
alter table rent add column payment_dt date after payment_date;
update rent set rental_dt = str_to_date(rental_date, '%d-%m-%Y');
update rent set payment_dt = str_to_date(payment_date, '%d-%m-%Y');
alter table rent drop column rental_date;
alter table rent drop column payment_date;
alter table rent rename column rental_dt to rental_date;
alter table rent rename column payment_dt to payment_date;

with movie_ratings as
( select distinct title, genre, avg(r.rating)over(partition by m.id) avg_rating
         from movies m left join ratings r on m.id = r.movie_id )
select title, genre, avg_rating, 
       rank()over(partition by genre order by avg_rating desc) rank_in_genre
       from movie_ratings order by genre asc;

# Q8. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.


with rental_amount as
( select rental_date, sum(payment_amount)over(partition by rental_date) payment_amounts
                       from rent order by rental_date )
select rental_date, 
       payment_amounts, 
       lag(payment_amounts,1,0)over() prev_day_amounts,
	   (payment_amounts - lag(payment_amounts,1,0)over()) as diff from rental_amount;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Q9. Create a table Passengers. Follow the instructions given below: 
-- -- Q9.1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q9.2. Only passengers having age greater than 18 are allowed.
-- -- Q9.3. Assign primary key to Traveller_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Passengers
-- -----------------------------------------------------
create table passengers ( traveller_id varchar(50) not null primary key, /* primary key ensures that this column cannot be null */
						  passenger_fname varchar(256),
                          passenger_lname varchar(256),
                          age int constraint age_constraint check (age > 18),
                          pnr varchar(256) not null,
                          source_city varchar(256),
						  destination_city varchar(256) );

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Questions for table Passengers:  
-- -- Q9.4. PNR status should be unique and should not be null.
-- -- Q9.5. Flight Id should not be null.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
alter table passengers add column pnr_status varchar(256) not null unique;
alter table passengers add column flight_id varchar(128) not null; 
desc passengers;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Q10. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q10.1. Column Traveller_ID should not contain any null value.
-- -- Q10.2. Assign primary key to Traveller_ID
-- -- Q10.3. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table Senior_Citizen_Details
-- -----------------------------------------------------
-- -----------------------------------------------------
create table Senior_Citizen_Details (
             traveller_id varchar(128) not null ,
             primary key (traveller_id),
             foreign key (traveller_id) references
             passengers (traveller_id)
             on update cascade
             on delete restrict
            );
-- --------------------------------------------------------------------------------------------------------------------------------------------------- 

   
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Q11. Create a table books. Follow the instructions given below: 
-- -- Columns: books_no, description, author_name, cost
-- -- Q11.1. The cost should not be less than or equal to 0.
-- -- Q11.2. The cost column should not be null.
-- -- Q11.3. Assign a primary key to the column books_no.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table books (
             books_no bigint primary key,
             description varchar(1024),
             author_name varchar(512),
             cost  double not null check (cost > 0 )
);



-- ----------------------------------------------------
# Datasets Used: employee_details.csv and department_details.csv
-- ----------------------------------------------------
select * from employee_details;
alter table employee_details add column hire_dt date after hire_date;
update employee_details set hire_dt = str_to_date(hire_date, '%d-%m-%Y');
alter table employee_details drop column hire_date;
desc employee_details;
alter table employee_details rename column hire_dt to hire_date;
select * from department_details;
 
 
# Q.12 Create a view "pattern_matching" such that it contains the records from the columns employee_id, first_name, job_id and salary from the table name "employee_details" 
-- --  where first_name ends with "l".
#Solution:

 create or replace view pattern_matching as select 
		employee_id, first_name, job_id, salary
        from employee_details where first_name like '%l';
select * from  pattern_matching;
 
# Q.13 Drop multiple existing views "pattern_matching".
#Solution:
drop view pattern_matching;
 
 
# Q.14 Create a view "employee_department" that contains the common records from the tables "employee_details" and "department_table".
#Solution:
create or replace view employee_department as select e.*, 
			department_name, location_id from employee_details e
            left join department_details d
            on e.department_id = d.department_id;
select * from employee_department;

-- ----------------------------------------------------
# Datset Used: admission_predict.csv
select * from admission_predict;
-- ----------------------------------------------------
# Q.15 A university focuses only on SOP and LOR score and considers these scores of the students who have a research paper. Create a view for that university.
#Solution:
create or replace view admission_predict_view as select `serial No.`, SOP, LOR from admission_predict where Research = 1;
select * from admission_predict_view;
