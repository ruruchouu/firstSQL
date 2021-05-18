select count(*) from rental;

select count(*) from rental where date(return_date) 
between '2005-05-25' and '2005-05-31'; 

select
date(return_date) as 'Return Date',
count(*) as 'Total'
from rental where date(return_date) 
between '2005-05-25' and '2005-05-31'
group by 1;   


select 
a.postal_code,
count(*) 
from rental r 
join customer c on c.customer_id = r.customer_id 
join address a on a.address_id = c.address_id 
where date(r.return_date) 
between '2005-06-01' and '2005-06-30'
group by 1
having count(*) >= 10; 

select 
c.name as 'Film Category' ,
count(*) as 'Total' 
from rental r
join  inventory i on i.inventory_id = r.inventory_id
join film_category fc on fc.film_id = i.film_id
join category c on c.category_id = fc.category_id
where date(r.rental_date) 
between '2005-07-01' and '2005-07-31'
group by 1; 

