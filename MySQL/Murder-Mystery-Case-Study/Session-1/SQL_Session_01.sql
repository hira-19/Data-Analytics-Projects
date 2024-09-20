-- Data Definition Language
-- Create Database

create database users_record;    -- cntrl + enter

-- use or select database
use users_record;


-- Let's create a table
-- column_name datatype constraint
create table users
(
ID int Primary key,
user_name VARCHAR(100), 
age int
);

-- Retrieve the data
select * from users;    -- * refers to all the data

-- Insert a single user entry or record
insert into users (id , user_name, age )
values (1, "Maimoona", 22 );

select * from users;

-- insert multiple rows 
insert into users (id , user_name, age )
values 
(2, "Ahmad", 22 ),
(3, "Ali",23),
(4, "Usman",24),
(5, "Bilal", 22),
(6, "Basit",19),
(7, "Ariyana", 17),
(8, "Daniyal",19),
(9, "Zia", 20),
(10,"Aliyan",19);

select * from users;

-- Load data books_data using "table import wizard"
select * from books_data;

-- fetch only two columns
select Book_name, type, on_promotion from books_data; -- query optimization


-- Fetch all unique languages from the books_data
select * from books_data;
select language from books_data;

select distinct language from books_data;

-- List down details of book with product_real_price is greater than 950
select * from books_data
where product_real_price > 950;

-- where (in, and, or, like, not in not equal)

-- show those books with English as language
select * from books_data
where language="English";


-- Order by
-- sort the dataset by product_real_price
select * from books_data ;
select * from books_data
order by product_real_price;  -- by default it is in ascending

-- descending
select * from books_data
order by product_real_price desc; 

-- Limit = to show specific number of rows
select * from books_data
limit 2;

-- top 5 expensive books
select * from books_data
order by product_real_price desc
limit 5; 


show databases;  -- to show the names of all  existing databases
show tables;  -- to show existing tables

