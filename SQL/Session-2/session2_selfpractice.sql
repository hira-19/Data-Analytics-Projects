select * from books_data;

select Book_name, type,on_promotion from books_data; -- query optimization

select * from books_data WHERE language = "English";

select distinct language from books_data; -- unique values

SELECT * FROM books_data
ORDER BY product_real_price;

SELECT * FROM books_data
ORDER BY product_real_price desc;

SELECT * FROM books_data
ORDER BY product_real_price limit 5;

-- session 2 queries
SELECT * FROM books_data
WHERE Book_name = "alchemist";

SELECT * FROM books_data
WHERE product_real_price > 100;

SELECT * FROM books_data
WHERE product_real_price < 300;

select * from books_data WHERE language = "Hindi";

select * from books_data WHERE discount_offered_prcnt >= 30 and discount_offered_prcnt <= 40;

select * from books_data WHERE language = "English" or language = "Hindi" or language =  "bengali";

SELECT * FROM books_data WHERE language IN ("Bengali");

SELECT * FROM books_data WHERE language NOT IN ("Bengali");

SELECT * FROM books_data WHERE author LIKE "A%" or author LIKE "B%";

ALTER table books_data add record_date date;
-- now updating =0 so we can edit
set sql_safe_updates= 0;

select * FROM books_data;
update books_data set record_date = "2024-07-07";

 select * FROM books_data;         

-- updating author name
update books_data 
set author = "a.c. bhaktivedanta swami prabhupada"
where author = '"his divine grace a.c. bhaktivedanta swami prabhupada"""';

select * from books_data;

alter table books_data
rename column Book_Name to Book_name;

select * from books_data;

alter table books_data
modify record_date datetime;

select * from books_data;

select * from books_data where Book_name = "Atomic Habits";

set sql_safe_updates= 0;

update books_data set record_date = "20-03-22 12:33:22" where Book_name ="Atomic Habits";

select * from books_data where Book_name = "Atomic Habits";

delete from books_data where sr_no =1;

select * from books_data where sr_no = 1;

ALTER table books_data
add primary key (sr_no);


alter table books_data modify sr_no int auto_increment;
select * from books_data;


select concat("This ",book_name, " is in ", language, " language") as Book_Details from books_data;

select product_real_price as prices from books_data;

alter table books_data
 drop column record_date;
  
  
  alter table books_data modify sr_no int auto_increment; -- remove auto increment
  
   alter table books_data modify sr_no int;
  
  alter table books_data drop primary key;

























-- a
