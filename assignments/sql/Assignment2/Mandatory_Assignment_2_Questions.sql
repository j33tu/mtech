# Pre-Requsites
# Assuming Candidates are familiar with “Group by” and “Grouping functions” because these are used along with JOINS in the questionnaire. 

use assignment;
Table Definitions:

1. BANK_CUSTOMER - Details of Customers of the Bank
2. BANK_CUSTOMER_EXPORT - Details of Customers of the Bank - to be used only when explicitly asked.
3. Bank_Account_Details - Account Details of the customers along with ADD on cards. One customer can have multiple details for Savings deposits, Recurring deposits, Credit Cards and Add on credit cards.
4. Bank_Account_Relationship_Details - Details of secondary accounts linked to primary accounts.
5. BANK_ACCOUNT_TRANSACTION - Details of the transactions.
6. BANK_CUSTOMER_MESSAGES - Details of Messages sent to customers after a transaction takes place.
7. BANK_INTEREST_RATE - Current interest rates for savings, RD and other accounts.
8. Bank_Holidays - Details of Bank Holidays.


create database Inclass;
# Create below DB objects 
use Inclass;
CREATE TABLE BANK_CUSTOMER 
( customer_id INT PRIMARY KEY,
customer_name VARCHAR(20),
Address 	VARCHAR(20),
state_code  VARCHAR(3) ,    	 
Telephone   VARCHAR(10)	);
				
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",  	"CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow", 	"NY" , "1897614000");



CREATE TABLE BANK_CUSTOMER_EXPORT 
( 
customer_id CHAR(10)PRIMARY KEY,
customer_name CHAR(20),
Address CHAR(20),
state_code  CHAR(3) ,    	 
Telephone  CHAR(10));
    
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123001 ","Oliver", "225-5, Emeryville", "CA" , "1897614500") ;
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123002 ","George", "194-6,New brighton","MN" , "189761700");


#Bank_Account_details table

CREATE TABLE Bank_Account_Details
(Customer_id INT,
Account_Number VARCHAR(19) PRIMARY KEY,
Account_type VARCHAR(25) ,
Balance_amount INT,
Account_status VARCHAR(10),             	 
Relationship_type varchar(1)) ;

ALTER TABLE Bank_Account_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);

INSERT INTO Bank_Account_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , 200000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123001, "5000-1700-3456", "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO Bank_Account_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS", 400000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" ,750000,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123004, "5000-1700-6091", "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123004, "4000-1956-3401",  "SAVINGS" , 655000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123005, "4000-1956-5102",  "SAVINGS" , 300000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, "4000-1956-5698",  "SAVINGS" , 455000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , 355000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S");
INSERT INTO Bank_Account_Details  VALUES (123007, "9000-1700-7777-4321",  "Credit Card"	,0  ,"INACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123007, '5900-1900-9877-5543', "Add-on Credit Card" ,   0   ,"ACTIVE", "S");
INSERT INTO Bank_Account_Details  VALUES (123008, "5000-1700-7755",  "SAVINGS"   	,0   	,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5800-1700-9800-7755', "Credit Card"   ,0   	,"ACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5890-1970-7706-8912', "Add-on Credit Card"   ,0   	,"ACTIVE", "S");
INSERT INTO Bank_Account_Details VALUES (123004,'5000-1700-7791','RECURRING DEPOSITS',40000,'ACTIVE','S');

# CREATE TABLE Bank_Account_Relationship_Details

CREATE TABLE Bank_Account_Relationship_Details
( Customer_id INT ,
Account_Number VARCHAR(19) PRIMARY KEY ,
Account_type VARCHAR(25),
Linking_Account_Number VARCHAR(19) 
);

ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Customer_id) REFERENCES bank_customer(Customer_id);
ALTER TABLE Bank_Account_Relationship_Details ADD FOREIGN KEY (Linking_Account_Number) REFERENCES bank_account_details(Account_Number);

								
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" , "4000-1956-3456");  
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" , "4000-1956-2001" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" , NULL );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-7791",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , NULL);
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, "9000-1700-7777-4321",  "Credit Card" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5900-1900-9877-5543', 'Add-on Credit Card', '9000-1700-7777-4321' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5800-1700-9800-7755', 'Credit Card', '4000-1956-5698' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5890-1970-7706-8912', 'Add-on Credit Card', '5800-1700-9800-7755' );


# CREATE TABLE BANK_ACCOUNT_TRANSACTION

CREATE TABLE BANK_ACCOUNT_TRANSACTION 
(  
Account_Number VARCHAR(19),
Transaction_amount Decimal(18,2) , 
Transcation_channel VARCHAR(18) ,
Province varchar(3) , 
Transaction_Date Date
) ;

ALTER TABLE Bank_Account_Transaction ADD FOREIGN KEY (Account_number) REFERENCES Bank_Account_Details(Account_Number);


INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3456",  -2000, "ATM withdrawl" , "CA", "2020-01-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -4000, "POS-Walmart"   , "MN", "2020-02-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -1600, "UPI transfer"  , "MN", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -6000, "Bankers cheque", "CA", "2020-03-23");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -3000, "Net banking"   , "CA", "2020-04-24");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  23000, "cheque deposit", "MN", "2020-03-15");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-6091",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-7791",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3401",   8000, "Cash Deposit"  , "NY", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5102",  -6500, "ATM withdrawal" , "NY", "2020-03-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5698",  -9000, "Cash Deposit"  , "NY", "2020-03-27");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-9977",  50000, "ECS transfer"  , "NY", "2020-01-16");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -5000, "POS-Walmart", "NY", "2020-02-17");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -8000, "Shopping Cart", "MN", "2020-03-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -2500, "Shopping Cart", "MN", "2020-04-21");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5800-1700-9800-7755", -9000, "POS-Walmart","MN", "2020-04-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( '5890-1970-7706-8912', -11000, "Shopping Cart" , "NY" , "2020-03-12") ;



# CREATE TABLE BANK_CUSTOMER_MESSAGES

CREATE TABLE BANK_CUSTOMER_MESSAGES 
(  
Event VARCHAR(24),
Customer_message VARCHAR(75),
Notice_delivery_mode VARCHAR(15)) ;


INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Adhoc", "All Banks are closed due to announcement of National strike", "mobile" ) ;
INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Transaction Limit", "Only limited withdrawals per card are allowed from ATM machines", "mobile" );


INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    10000.00     ,'ECS transfer',     'MN' ,    '2020-02-16' ) ;

-- inserted for queries after 17th  
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    40000.00     ,'ECS transfer',     'MN' ,    '2020-03-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    60000.00     ,'ECS transfer',     'MN' ,    '2020-04-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    20000.00     ,'ECS transfer',     'MN' ,    '2020-03-20' ) ;

-- inserted for queries after 24th 

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    49000.00     ,'ECS transfer',     'MN' ,    '2020-06-18' ) ;




# CREATE TABLE BANK_INTEREST_RATE

CREATE TABLE BANK_INTEREST_RATE(  
account_type varchar(24)PRIMARY KEY,
interest_rate decimal(4,2),
month varchar(2),
year  varchar(4)
)	;

INSERT  INTO BANK_INTEREST_RATE VALUES ( "SAVINGS" , 0.04 , '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES ( "RECURRING DEPOSITS" , 0.07, '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES   ( "PRIVILEGED_INTEREST_RATE" , 0.08 , '02' , '2020' );

# Bank_holidays:

Create table Bank_Holidays (
Holiday  date PRIMARY KEY,
Start_time datetime ,
End_time timestamp);

Insert into bank_holidays values ( '2020-05-20','2020-05-20','2020-05-20' ) ;

Insert into bank_holidays values( '2020-03-13' ,'2020-03-13' ,'2020-03-13' ) ;



select * from BANK_CUSTOMER;


############################################ Questions ############################################


# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.
/* Solution */
use inclass;
select c.customer_id, customer_name, round(avg(balance_amount),2) AvgBalance from 
    BANK_CUSTOMER c inner join Bank_Account_Details a on c.customer_id = a.customer_id group by c.customer_id;
    
    
    select * from bank_customer;
# Question 2:
# 2) Print the customer ids, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.
/* Solution */
select a.customer_id, a.account_number, balance_amount, transaction_amount,
       transaction_amount, transaction_date from bank_account_details a inner join
       bank_account_transaction b on
       a.account_number = b.account_number
       where month(b.transaction_date) < 4;


select * from bank_account_details;
select * from bank_account_relationship_details;
select * from bank_account_transaction;
select * from bank_customer;
select * from bank_customer_export;
select * from bank_customer_messages;
select * from bank_holidays;
select * from bank_interest_rate;
# Question 3:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types

/* Solution */

select customer_id, account_number, account_type, balance_amount from bank_account_details;
select a.customer_id, a.account_number, a.account_type, balance_amount, 
       linking_account_number, b.account_type account_type_b from bank_account_details a inner join
	   bank_account_relationship_details b on a.account_number = b.account_number
       order by a.customer_id;
# Question 4:
# a) Display records of All Accounts , their Account_types, the balance amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  
# transaction amount of accounts appeared  in another column.

/* Solution */
SELECT 
    customer_id, account_number, account_type, balance_amount
FROM
    bank_account_details;
select a.customer_id, a.account_number, a.account_type, balance_amount, 
       linking_account_number, b.account_type account_type_b from bank_account_details a inner join
	   bank_account_relationship_details b on a.account_number = b.account_number;

select a.customer_id, a.account_number, a.account_type, balance_amount, 
       linking_account_number, b.account_type account_type_b,
       transaction_amount, transaction_date
       from bank_account_details a inner join
       bank_account_relationship_details b
       on a.account_number = b.account_number inner join
       bank_account_transaction c on a.account_number = c.account_number
       order by customer_id, account_number, transaction_date;
       

# 5) Display every account's total no of transactions for every year and each month.
 
/* Solution */
 select account_number, year(transaction_date) year,
        month(transaction_date) month, 
        count(*) num_transactions from bank_account_transaction 
        group by account_number, year(transaction_date), month(transaction_date)
        order by account_number, year, month;


# Question 6:
# 6) Compare the aggregate sum transaction amount of Feb2020 month versus Jan2020 Month for each account number.
-- Display account_number, transaction_amount , 
-- sum of feb month transaction amount ,
-- sum of Jan month transaction amount , 
 
/* Solution */

select distinct account_number, 
                (select sum(transaction_amount) from bank_account_transaction j where
						j.account_number = a.account_number and month(transaction_date) = 1
                        and year(transaction_date) = 2020 ) as Jan2020,
				(select sum(transaction_amount) from bank_account_transaction j where
						j.account_number = a.account_number and month(transaction_date) = 2
                        and year(transaction_date) = 2020 ) as Feb2020 from bank_account_transaction
                        a;

# Dataset used: titanic_ds.csv
# Use subqueries for every question

USE ex1;

select * from titanic_ds;


#Q7. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. (11 Rows)

select first_name, last_name, fare from titanic_ds where fare > (select avg(fare) from titanic_ds);

#Q8. Display the first_name ,sex, age, fare and deck_number of the passengers having same deck number and sex as passenger number 7 but exclude the record of passenger number 7 from the display.(3 Rows)
 select passenger_no, first_name, sex, age, fare, deck_number from titanic_ds where (deck, sex) =
       (select deck, sex from titanic_ds where passenger_no = 7 ) and passenger_no != 7;

#Q9. Display first_name,embark_town where deck is equals to the deck of embark town ends with word 'town' (7 Rows)
select first_name, embark_town from titanic_ds 
      where deck = ANY (select deck from titanic_ds where embark_town like '%town');


# Dataset used: youtube_11.csv

alter table youtube_11 rename youtube;
select * from youtube;

#Q10. Write a query to print video_id and channel_title where trending_date is equals to the trending_date of  category_id 1(5 Rows)

select video_id, channel_title, trending_date from
	   youtube where trending_date = 
       (select trending_date from youtube where category_id = 1);
#Q11. Write a query to display the publish date, trending date ,views and description where views are more than views of Channel 'vox'.(7 Rows))


select publish_date, trending_date, views, description from youtube
 where views > (select views from youtube where channel_title = 'vox');

#Q12. Write a query to display the channel_title, publish_date and the trending_date having category id in between 9 to Maximum category id .
# Do not use Max function(3 Rows)

select channel_title, publish_date, trending_date from youtube 
       where category_id between 9 and 
       (select max(category_id) from youtube);


#Q13. Write a query to display channel_title, video_id and number of view of the video that has received more than  mininum views. (10 Rows)
select channel_title, video_id, views from youtube 
	    where views > (select min(views) from youtube);

# Database used: db1 (db1.sql file provided)

select * from customers;
select customernumber, customername, salesRepEmployeeNumber,
      firstName, lastName from customers c inner join
      employees e on c.salesRepEmployeeNumber = e.employeeNumber;
#Q14. Get employee details who shipped an order within a time span of two days from order date (15 Rows)
select distinct firstName, lastName from orders o inner join customers c
       on o.customerNumber = c.customerNumber inner join
       employees e on c.salesRepEmployeeNumber = e.employeeNumber
       where datediff(shippedDate, orderDate) < 3;

#Q15. Get product name , product line , product vendor of products that got cancelled(53 Rows)
select distinct productName, productLine, productVendor from products p
       inner join orderdetails o  on p.productCode = o.productCode
       inner join orders r on o.orderNumber = r.orderNumber where
       r.status = 'Cancelled';
