drop database if exists products;
create database if not exists products;
use products;
create table products (
    id int auto_increment primary key,
    product_code varchar(50) not null,
    product_name varchar(50) not null,
    product_price float not null,
    product_amount int not null,
    product_description varchar(50) not null,
    product_status varchar(50) not null
);

insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
values  ('123','Notebook', 3500, 2, 'blue', 'new'),
		('124','Pencil', 2000, 4, 'red', 'new'),
		('125','Eraser', 6000, 5, 'black', 'old');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)        
create unique index product_index
on products (product_code);
show indexes from products;
-- sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = '124';

-- Tạo composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index products_index
on products (product_name, product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_name = 'Eraser' or product_price = '3500';

-- tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as 
select product_code, product_name, product_price, product_status
from products;

select * from product_view;
-- Tiến hành sửa đổi view
update product_view
set product_code = '111'
where product_name = 'Pencil';
select * from product_view;

drop view product_view;

-- tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_product_infor()
begin
	select * from products;
end //
delimiter ;
call get_product_infor();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure insert_product(p_code varchar(50), p_name varchar(50), p_price float, p_amount int, p_des varchar(50), p_status varchar(50))
begin
    insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
    values (p_code, p_name, p_price, p_amount, p_des, p_status);
end //
delimiter ;
call insert_product('112', 'noteNotebook', 4500, 10, 'adorable', 'thick');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product(p_id int, new_name varchar(50))
begin
	update products
    set product_name = new_name
    where id = p_id;
end //
delimiter ;
call update_product(4, 'bag');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(p_id int)
begin
	delete from products
    where id = p_id;
end //
delimiter ;
call delete_product(4); 