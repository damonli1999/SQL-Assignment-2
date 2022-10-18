-- 1. List all customer who live in Texas
select first_name, last_name, district
from customer 
inner join address 
on customer.address_id = address.address_id 
where district = 'Texas';

-- 2. Get all payment above $6.99 with customer's full name
select first_name, last_name, amount
from customer 
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99

-- 3.Show all customer name who have made payments over $ 175
-- (use Subqueries)
select first_name, last_name 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc 
)

-- 4. List all customers that lived in Nepal
select customer.first_name, customer.last_name,country
from customer 
full join address 
on customer.address_id = address.address_id 
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal'

-- 5. Which Staff had the most transaction 
select staff_id,sum(amount)
from payment 
group by staff_id 
order by sum(amount) desc


-- 6. How many movies of each ratings are there
select rating, count(rating)
from film 
group by rating

-- 7. Show all customers who have made single payment above $6.99
-- Use Subqueries 
SELECT first_name,last_name,customer.customer_id 
FROM customer
left JOIN payment
ON customer.customer_id = payment.customer_id
group by customer.customer_id having sum(amount) > 6.99
order by customer.customer_id asc


-- 8. How many free rentals did our stores give away?
select amount
from payment 
where customer_id in(
	select customer_id
	from rental 
	where amount = 0
)



