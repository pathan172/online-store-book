create database  onlinebookstore;

drop table if exists books;
create table books (
	book_id serial primary key,
	title varchar(100),
	author varchar(100),
	genre varchar(50),
	 published_year int,
	 price numeric (10,2),
	 stock int
);

drop table if exists customers;
create table customers (
	customer_id serial primary key,
	name varchar(100),
	email varchar(100),
	phone varchar (15),
	city varchar (50),
	country varchar(150)
);
drop table if exists orders;
create table orders(
	orer_id serial primary key,
	customer_id int references customers(customer_id),
	book_id int references books(book_id),
	order_date date,
	quantity int,
	total_amount numeric (10,2)
);

select * from books;
select * from customers;
select * from orders;
--import csv files to books
--import scv files to customers
--import csv files to orders


--1 retrieve all books in the "fiction" genre;
select * from books
where genre = 'Fiction';

--2 find books published after the year 1950;
select * from books
where published_year>1950;

--3 list all the customers from the canada;
select * from customers
where country = 'Canada';

--4 show  orders plaaced in novemebr 2023;
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

--5 retrieve the total stocks of books available;

select sum(stock) as total_stock
from books;

--6 find the deatail of the mosst expensive books;
select * from books order by price desc limit 1 ;

--7 show all customers who ordered more than 1 quantity of a book;
select * from orders
where quantity>1;

-- 8 retrieve all the order whwere the total amount exceeds 520;
select * from orders
where total_amount > 20;

-- 9 list all the genres availabl in the books table;
select distinct genre from books;

--10 find the books with the lowest stock;
select * from books order by  stock limit 1;

--11 calculate the total revenue generated from all orders;
select  sum(total_amount) as revenue
from orders;

-- advance question 
---1) retrieve the total amount of books sold for each genre
select * from orders;

select b.genre, sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id
group by b.genre;


--2) find the average price of book in the "fantasy" genre:
select avg(price) as avg_price
from books
where genre= 'Fantasy';

--3) list customers who have placed at leasts 2 orders:
select o.customer_id, c.name, count(o.orer_id) as orer_count
from orders o
join customers c on o.customer_id = c.customer_id
group by o.customer_id , c.name
having count(orer_id) >= 2;


--4) find the most frequently ordered book:
select o.book_id,b.title,count(o.orer_id) as order_count
from orders o
join books b on o.book_id= b.book_id
group by o.book_id,b.title
order by order_count desc limit 1;

--5) shoe the top 3 most expensive books of "fantasy" genre:
select * from books
where genre = 'Fantasy'
order by price desc limit 3;

--6) retrieve the total quantity of books solid by each author:
select b.author, sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id
group by b.author;

--7) list the cities where customers who spent over 30 dollar are located:
select distinct c.city ,total_amount
from orders o
join customers c on o.customer_id = c.customer_id
where o. total_amount >30;

--8) find customer who spent the most on orders:
select c.customer_id, c.name,sum(o.total_amount) as total_spent
from orders o 
join customers c on o.customer_id = c.customer_id
group by c. customer_id,c.name
order by total_spent desc limit 1;

--8) calculate the stock remaining afer fulfillling all orders:
select b.book_id,b.stock,coalesce(sum(o.quantity),0)as order_quantity,
	b.stock- coalesce(sum(o.quantity),0) as remainig_quantity
from books b
left join orders o on b.book_id = o.book_id
group by b.book_id order by b.book_id;