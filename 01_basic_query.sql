-- Problem 1: List all countries.
select country from country;

-- Problem 2: Show the number of countries.
select count(country_id) from country;

-- Problem 3: Find the United States in the country table.
select * from country where country = 'United States';

-- Problem 4: List payments with specific amounts
select * from payment where amount in (1.99, 2.99, 3.99, 4.99);

-- Problem 5: Insert new country 'Utopia'
insert into country (country) values ('Utopia');