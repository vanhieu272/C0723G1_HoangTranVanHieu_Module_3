drop database if exists quan_li_ban_hang;
create database if not exists quan_li_ban_hang;
use quan_li_ban_hang;

create table customer(
customer_id int primary key auto_increment not null,
customer_name varchar(200) not null,
age int
);

create table orders (
order_id int primary key auto_increment not null,
order_date datetime not null,
order_total_price float,
customer_id int not null,
foreign key (customer_id) references customer (customer_id)
);

create table product (
product_id int primary key auto_increment not null,
product_name varchar(200) not null,
product_price float not null
);

create table order_detail (
order_id int not null ,
product_id int not null,
order_quantity int not null,
primary key (order_id, product_id),
foreign key (order_id) references orders (order_id),
foreign key (product_id) references product (product_id)
);

insert into customer (customer_name, age)
values ('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into orders (order_date, customer_id)
values ('2006-3-21', 1),
('2006-3-23', 2),
('2006-3-16', 1);

insert into product (product_name, product_price)
values ('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail (order_id, product_id, order_quantity)
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer_name, product_name
from customer c
join orders o on c.customer_id = o.customer_id
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.customer_name 
from customer c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

/* Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)*/
select o.order_id, o.order_date, sum(p.product_price * od.order_quantity) as total_price
from orders o 
join order_detail od on o.order_id = od.order_id
join product p on p.product_id = od.product_id
group by order_id;