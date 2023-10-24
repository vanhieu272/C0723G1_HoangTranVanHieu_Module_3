drop database if exists quan_ly_ban_hang;
create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer
(
	customer_id int primary key auto_increment,
    customer_name varchar(50) not null,
    customer_age int not null
);

create table _order
(
	order_id int primary key auto_increment,
    customer_id int,
    order_date datetime not null,
    order_total_price int not null,
    check(order_total_price >= 0),
    foreign key (customer_id) references customer(customer_id)
);

create table product
(
	product_id int primary key auto_increment,
    product_name varchar(50) not null,
    product_price int not null,
    check(product_price >= 0)
);

create table order_detail
(
	order_id int,
    product_id int,
    product_quantity int,
	primary key(order_id, product_id),
    foreign key(order_id) references _order(order_id),
    foreign key(product_id) references product(product_id),
    check (product_quantity >= 1)
);

insert into customer(customer_name, customer_age)
values	("Hùng", 22), 
		("Hiếu", 22),
		("Tuấn", 19);
update customer
set customer_age = 20
where customer_id = 3;

delete from customer
where customer_id = 3;

select * from customer;




