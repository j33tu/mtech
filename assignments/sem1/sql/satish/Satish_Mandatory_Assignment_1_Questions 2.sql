# Question 1:
CREATE Database assignment1;
use assignment1;
/*
Player_Id,Player_Name,Runs,Popularity,Charisma
PL1,Virat,50,10,55
*/
create table cric_players( player_id varchar(256)  primary key,
                           player_name varchar(256)  not null,
                           runs int(10),
                           popularity int(10),
                           charisma int(10) );

select * from cric_players;

desc churn1;
select * from churn1;
desc churn;
help cast;
create table churn_ as
select customerID, gender, case when seniorcitizen = '' THEN NULL
                           else convert(seniorcitizen, unsigned) END AS seniorcitizen,
                           nullif(Partner,'') Partner,
                           nullif(Dependents,'') Dependents,
                           case when tenure = '' THEN NULL
                           else convert(tenure, unsigned) END AS tenure,
                           nullif(CallService,'') CallService,
                           nullif(MultipleConnections,'') MultipleConnections,
						   nullif(InternetConnection,'') InternetConnection,
						   nullif(OnlineSecurity,'') OnlineSecurity,
						   nullif(OnlineBackup,'') OnlineBackup,
						   nullif(DeviceProtectionService,'') DeviceProtectionService,
						   nullif(TechnicalHelp,'') TechnicalHelp,
						   nullif(OnlineTV,'') OnlineTV,
						   nullif(OnlineMovies,'') OnlineMovies,
						   nullif(Agreement,'') Agreement,
						   nullif(BillingMethod,'') BillingMethod,
						   nullif(PaymentMethod,'') PaymentMethod,
                           case when MonthlyServiceCharges = '' THEN NULL
                           else convert(MonthlyServiceCharges, float) END AS MonthlyServiceCharges,
                           case when TotalAmount = '' THEN NULL
                           else convert(TotalAmount, float) END AS TotalAmount,
						   nullif(Churn,'') Churn
                           from churn;
alter table churn rename column `nullif(Churn,'')` to Churn;                           
select * from churn_;
alter table churn rename churn_imported;
alter table churn_ rename churn;


-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------

# Q1. Extract the Player_Id and Player_name of the players where the charisma value is null.
select player_id, player_name from cric_players where charisma is null;
 
# Q2. Write a MySQL query to display all the NULL values in the column Charisma imputed with 0.
select player_id, player_name, ifnull(charisma, 0) from cric_players;


-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- -------------------------------------------------------

select * from churn1;
# Q3. Rename the table churn1 to “Churn_Details”.
alter table churn1 rename Churn_Details;

# Q4. Write a query to create a new column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
alter table churn_details add column new_Amount float GENERATED ALWAYS AS (TotalAmount + MonthlyServiceCharges) STORED;
select customerID, new_Amount from churn_details limit 5;

# Q5. Rename column new_Amount to Amount.
alter table churn_details rename column new_Amount to Amount;
select * from churn_details limit 5;

# Q6. Drop the column “Amount” from the table “Churn_Details”.
alter table churn_details drop column Amount;
desc churn_details;

# Q7. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerID, InternetConnection, gender from Churn_Details where substr(InternetConnection,2,1) = 'i';

# Q8. Find the records where the tenure is 6x, where x is any number.(107 Rows)
select customerID, tenure, mod(tenure, 6) from Churn_Details where tenure%6 = 0;
select * from Churn_Details where tenure%6 = 0;

/*
select customerID, tenure, mod(tenure, 6) from Churn_Details where tenure%6 != 0;
select count(*) from Churn_Details where tenure is null;
656+143+11536
11536
  656
  143
-----
12335
Table Churn_Details
select count(*) from Churn_Details;
*/

#Q9. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
desc cric_players;
select upper(player_name), ifnull(charisma, 0) from cric_players order by player_name asc;


# Pre-Requisites:
# Step 1 : Create table as below.

Create table Bank_Inventory_pricing 
( Product CHAR(15) , 
Quantity INT, 
Price  Real ,
purchase_cost Decimal(6,2), 
Estimated_sale_price  Float,
Month int) ;

# Step2: 
# Insert records for above 
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 4000.99 , NULL, 3500, 2) ; 

select * from Bank_Inventory_pricing;
# Create table
Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;

select * from Bank_branch_PL;

############################################ ############################################



# 10) Print average of estimated_sale_price upto two decimals from bank_inventory_pricing table.
/* Solution */
select round(avg(Estimated_sale_price),2) as "Average Estimated_sale_price" from bank_inventory_pricing;

# Question 11:
# 11. Print Products that are appearing more than once in bank_inventory_pricing and whose purchase_cost is
# greater than  estimated_sale_price , assuming estimated_sale_price is 0 when there is no value given
/* Solution */
desc bank_inventory_pricing;
select Product from bank_inventory_pricing where purchase_cost > estimated_sale_price and Product in
       (select Product from bank_inventory_pricing group by Product having count(*) > 1);

# 12) Print unique records of bank_inventory_pricing without displaying the month.
/* Solution */
select distinct product, quantity, price, purchase_cost, estimated_sale_price from bank_inventory_pricing;
# 13) Print the count of unique Products used in  Bank_inventory_pricing
/* Solution */
select product, count(*) product_count from Bank_inventory_pricing group by product;


# 14) Print the sum of Purchase_cost of Bank_inventory_pricing during 1st and 2nd month
/* Solution */
select Month, sum(Purchase_cost) sum_purchase_cost
       from Bank_inventory_pricing where month in (1,2) group by Month;

# 15) Print  products whose average of purchase_cost is less than sum of purchase_cost of  Bank_inventory_pricing
/* Solution */
select product, avg(purchase_cost) avg_purchase_cost,
       sum(purchase_cost) sum_purchase_cost
       from Bank_inventory_pricing group by
       product having avg(purchase_cost) < sum(purchase_cost);



