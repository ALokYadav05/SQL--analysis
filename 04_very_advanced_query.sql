-- Problem 1: Average rental duration per category.
select c.name, avg(f.rental_duration) as avg_rental_duration 
from category c 
join film_category fc on c.category_id = fc.category_id 
join film f on fc.film_id = f.film_id 
group by c.category_id;


-- Problem 2: Customers who rented same film multiple times
select c.first_name, c.last_name, f.title, count(*) as rental_count 
from customer c 
join rental r on c.customer_id = r.customer_id 
join inventory i on r.inventory_id = i.inventory_id 
join film f on i.film_id = f.film_id 
group by c.customer_id, f.film_id 
having count(*) > 1;


-- Problem 3: Total revenue per staff member
select s.first_name, s.last_name, sum(p.amount) as total_revenue 
from staff s 
join payment p on s.staff_id = p.staff_id 
group by s.staff_id;


-- Problem 4: Top 3 cities with most customers.
select ci.city, count(c.customer_id) as customer_count 
from city ci 
join address a on ci.city_id = a.city_id 
join customer c on a.address_id = c.address_id 
GROUP BY ci.city_id 
order by customer_count desc 
limit 3;



-- Problem 5: Average payment amount per store.
select st.store_id, avg(p.amount) as avg_payment 
from store st 
join staff s on st.store_id = s.store_id 
join payment p on s.staff_id = p.staff_id 
group by st.store_id;