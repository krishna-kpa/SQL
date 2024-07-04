create table users(
	id serial primary key,
	first_name varchar(50),
	last_name varchar(20)
);

create table products(
	id serial primary key,
	name varchar(50),
	department varchar(20),
	price integer,
	weight float4
);

create table orders(
	id serial primary key,
	user_id integer references users(id),
	product_id integer references products(id),
	paid boolean
);

insert into users(first_name,last_name)
values
('krishna', 'prasad'),
('kp', 'prasad'),
('kp', 'krishna'),
('prasad', 'kp'),
('prasad', 'prasad'),
('prasad', 'krisha');



insert into products(name,department,price,weight)
values
('tooth brush','stationary',10,.050),
('tooth','stationary',100,50),
('brush','2stationary',1000,10),
('tooth brush 3','1stationary',110,1.050),
('tooth brush 4','1stationary',710,1.050);

insert into orders(user_id,product_id,paid)
values
(1,1,false),
(2,1,false),
(2,2,true),
(3,3,false),
(3,3,true),
(4,3,false),
(6,5,true),
(6,1,false),
(6,2,true),
(6,2,false),
(1,5,true);


problem 1 (count of paid and unpaid orders)
select paid,count(*)
from orders
group by paid;

problem 2 (print users first name and whether they paid or not)
select first_name,paid
from users
join orders on users.id = orders.user_id;

problem 3 (sort products based on price)
select *
from products
order by price;

problem 4 (limit and offset -- skip first 2 rows and take next first 2 rows)
select *
from products
limit 2
offset 2;

problem 5 (find 4 products with highest price and 4 product with price/weight ratio)
(
	select *
	from products
	order by price desc
	limit 4
)
union 
(
	select *
	from products
	order by price/weight desc
	limit 4
);






