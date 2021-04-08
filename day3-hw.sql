-- Question 1
select customer_id, first_name, last_name, district
from customer
left join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Question 2
select customer.customer_id, first_name, last_name, amount
from customer
left join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by amount asc;

-- Question 3
select *
from customer
where customer_id IN(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

-- Question 4
SELECT customer.first_name, customer.last_name, customer.email, city
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';
-- No one lives in Nepal

-- Question 5
select staff.staff_id, staff.first_name, staff.last_name, count(payment.staff_id)
from staff
left join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(payment.staff_id) desc;
-- Jon Stephens had more sales

-- Question 6
select rating, count(inventory_id)
from film
left join inventory
on film.film_id = inventory.film_id
group by rating;

-- Question 7
select *
from customer
where customer_id IN(
	select customer_id
	from payment
	group by amount, customer_id
	having amount > 6.99
	order by amount asc
);

-- Question 8
select count(amount)
from payment
where amount = 0;
-- 24 free rentals