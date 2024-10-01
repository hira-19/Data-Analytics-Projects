create database session4; -- db creation
use  session4; -- db use

select * from customer; -- display datasets
select * from products;
select distinct(category) from products;

select * from purchase_history ;
 
-- safe mode off
SET SQL_SAFE_UPDATES = 0;

-- data type changing
UPDATE customer 
SET date_of_birth = STR_TO_DATE(date_of_birth, '%m/%d/%Y');

ALTER TABLE customer 
MODIFY date_of_birth DATE; -- changing the date format

-- data type changing
UPDATE customer 
SET signup_date = STR_TO_DATE(signup_date, '%m/%d/%Y');

ALTER table customer modify signup_date DATE; -- giving error of format so changing the format  it in above query

-- DATA type change in purchase table
select * from purchase_history;
UPDATE purchase_history 
SET	purchase_date = STR_TO_DATE(purchase_date, '%m/%d/%Y %H:%i'); -- I change y to Y as it was giving me error


-- adding foreign key
ALTER TABLE customer add primary key(customer_id);
ALTER TABLE products add primary key(product_id);
ALTER TABLE purchase_history add primary key(purchase_id);

-- Add foreign Keys
/*
Syntax:
ALTER TABLE child_table
ADD CONSTRAINT fk_name_id
FOREIGN KEY (parent_id) 
REFERENCES parent_table(id);

*/

ALTER table purchase_history 
add constraint fk_product_id foreign key (product_id)
references products(product_id);

ALTER table purchase_history 
add constraint fk_customer_id foreign key (customer_id)
references customer(customer_id);

-- INNER JOIN 
-- Exercise 1: Write a query to retrieve customer information with their purchase history:
select  c.*,p_h.*
from customer c inner join purchase_history p_h on c.customer_id  =
 p_h.customer_id;

-- Exercise 2: Write a query to retrieve product details and their purchase history
select  p.*,p_h.purchase_date,p_h.total_amount
from products p  inner join purchase_history p_h on p.product_id  =
 p_h.product_id;

-- Exercise 3: How many purchases (purchase_id) were made by each customer (customer_id) in total? (only mention those who have made payments)
select c.customer_id,c.gender ,count(p_h.purchase_id) as "total purchases"
from customer c inner join purchase_history p_h
on c.customer_id  = p_h.customer_id group by c.customer_id,c.gender;

-- Exercise 4: Which customers (customer_id) have spent more than $1500 in total (SUM(ph.total_amount)) on purchases?
select c.customer_id,sum(p_h.total_amount) as "total purchases"  
from customer c inner join purchase_history p_h
on c.customer_id  = p_h.customer_id
group by c.customer_id 
having sum(p_h.total_amount) order by sum(p_h.total_amount) desc limit 2;


-- Exercise 5: How many purchases (purchase_id) were made for each product category (p.category) that has been purchased?
select p.category, COUNT(ph.purchase_id) as  "Total Purchases"
from products p  inner join purchase_history ph 
on p.product_id = ph.product_id
group by p.category;

-- Exercise 6: Which products (p.product_name) are most frequently purchased (COUNT(ph.purchase_id)) by Female customers (c.gender = 'Female')?
select p.product_name, (COUNT(ph.purchase_id)) as "total purchases"
from  products p
inner join purchase_history ph on p.product_id = ph.product_id
inner join customer c on c.customer_id = ph.customer_id where c.gender="Female"
group by p.product_name
order by COUNT(ph.purchase_id) desc;

-- Left Join
-- Exercise 1: Which customers (customer_id) have not made any purchases (ph.purchase_id IS NULL)?


-- Exercise 2: Which products (product_id) have not been purchased (ph.purchase_id IS NULL)?
select pro.*, pur.*
from products pro
left join purchase_history  pur
on pro.product_id = pur.product_id 
where pur.purchase_id is null;

-- Exercise 3: Analyze the sales (total_amount) for all products.
select p.product_id , SUM(ph.total_amount) as "TA"
from products p 
left join purchase_history as ph 
on p.product_id = ph.product_id 
group by p.product_id;

-- RIGHT JOIN
-- Exercise 1: What is the total number of purchases (COUNT(ph.purchase_id)) and the total amount spent (SUM(ph.total_amount)) for each product brand (p.brand)?
SELECT  p.brand as "Brand Names",COUNT(ph.purchase_id) "Count of IDs",round(SUM(ph.total_amount)) as "Total Amount" 
from purchase_history ph
right join products p on ph.product_id = p.product_id
group by  p.brand
order by round(SUM(ph.total_amount)) DESC;

-- Exercise 2: How many purchases (COUNT(ph.purchase_id)) has each customer (c.customer_id) made?
SELECT c.customer_id, COUNT(ph.purchase_id) as "Total Purchases"
from purchase_history ph 
right join customer c
on ph.customer_id = c.customer_id
group by c.customer_id;

 -- TO DO task
-- Exercise 1: Fetch those customer's first name and last name who have made puchases.
select c.first_name, c.last_name ,count(ph.purchase_id) as "Purchases"
from customer c
left join purchase_history ph  
on c.customer_id = ph.customer_id
group by c.first_name, c.last_name
order by Purchases desc;

-- Exercise 2: Display how much amount have been spent by each and every customer.
select c.customer_id , count(ph.purchase_id),round(sum(ph.total_amount)) as "Total Amount Spent"
from customer c
left join purchase_history ph 
on c.customer_id = ph.customer_id
group by c.customer_id;

-- Exercise 3: What is the the total amount spent (SUM(ph.total_amount)) for each category?
select p.category,round(SUM(ph.total_amount)) as "Total Amount"
from products p
right join purchase_history ph
on purchase_id = ph.purchase_id
group by category;







