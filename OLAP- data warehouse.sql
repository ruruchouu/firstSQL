create database data_warehouse;
use data_warehouse; 

create table customer_dim
(
Customer_ID smallint (5), 
Postal_code varchar (10), 
City varchar(26),
Country varchar (38),
Member_date date
)
;

-- drop table customer_dim; 

-- select max(length(city)) from sakila.city;  (helps to select the number of characters needed for an entry)

insert into customer_dim (Customer_ID, Postal_code, City, Country, Member_date)
select distinct
c.customer_id,
a.postal_code,
ci.city,
co.country,
date(c.create_date) as member_date 
from 
sakila.customer c 
join sakila.address a on c.address_id = a.address_id
join sakila.city ci on a.city_id = ci.city_id  
join sakila.country co on co.country_id = ci.country_id
; 

select * from customer_dim group by customer_id asc; 

create table product_dim (
product_dim_id int,
product_name varchar (255),
product_category varchar (100) 

);

insert into product_dim (product_dim_id, product_name, product_category)
Select distinct
f.film_id,
f.title,
c.name
FROM 
	sakila.film f JOIN 
	sakila.film_category fc on f.film_id = fc.film_id
	JOIN 
	sakila.category c on c.category_id = fc.category_id
	;

select * from product_dim; 


create table date_dim
(
date_dim_id date,
Year smallint,
Month tinyint, 
Monthname varchar (20),
Quarter char(3)
);

create table sales_fact
(
date_dim_id date,
customer_dim_id int,
product_dim_id int,
total_amount decimal(9,2) 
);

insert into sales_fact (date_dim_id, customer_dim_id, product_dim_id, total_amount) 
select 
date(p.payment_date) as date_dim_id, 
p.customer_id, 
i.film_id,
sum(p.amount) as total_amount
FROM
sakila.payment p JOIN 
sakila.rental r ON p.rental_id = r.rental_id JOIN
sakila.inventory i on r.inventory_id = i.inventory_id
group by 1, 2, 3
order by customer_id ; 

-- Total Sales by Month Name for Year 2005 
select 
d.monthName,
sum(s.total_amount) as TotalSales, 
from sales_fact s 
join date_dim d on s.date_dim_id = d.date_dim_id
join product_dim p on d.product_dim_id =p.product_dim_id
where d.year = '2005 '
Group by 1; 
# note I have not yet inserted date into date_dim 

