-- Problem 1) Films longer than minimum in their category.
select f.title , c.name 
from film f
join film_category fc on fc.film_id = f.film_id
join category c on c.category_id = fc.category_id
where f.length > (
          select min(f2.length)
	      from film f2
	      join film_category fc2 on fc2.film_id = f2.film_id
          where fc2.category_id = c.category_id
      );


-- Problem 2: Customers with at least one payment > $11
select c.first_name, c.last_name , p.amount
from customer c
join payment p on p.customer_id = c.customer_id
where p.amount > 11;


-- Problem 3: Customers with at least three payments > $9
select c.first_name, c.last_name 
from customer c
join payment p on p.customer_id = c.customer_id
where p.amount > 9
group by c.customer_id
having count(p.payment_id) >= 3;


-- Problem 4: Top 5 spending customers.
select c.first_name, c.last_name , sum(p.amount) as total_spent
from customer c
join payment p on p.customer_id = c.customer_id
group by c.customer_id
order by total_spent desc
limit 5;


-- Problem 5: Most popular film category.
select c.name, count(f.film_id) as num_films 
from category c 
join film_category fc on c.category_id = fc.category_id 
join film f on fc.film_id = f.film_id 
group by c.category_id 
order by num_films desc
limit 1;
