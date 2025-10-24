-- Problem 1) Order countries by ID and show rows 12 to 17.
select * from country order by country_id asc limit 6 offset 11;

-- Problem 2) Find all duplicated first names in the customer table.
select first_name , count(*)
from customer
group by first_name
having count(*) > 1;

-- Problem 3) List all addresses in a city whose name starts with 'A'.
select * from address
where city_id in (
   select city_id from city
   where city like 'A%'
);

-- Problem 4) Display the average amount paid by each customer, along with the customer's first and last name.
Select c.first_name, c.last_name, avg(p.amount) 
from customer c 
join payment p on c.customer_id = p.customer_id 
group by c.customer_id;

-- Problem 5) List all customers' first name, last name, and the city they live in.
select c.first_name, c.last_name, ci.city 
from customer c 
join address a on c.address_id = a.address_id 
join city ci on a.city_id = ci.city_id;
