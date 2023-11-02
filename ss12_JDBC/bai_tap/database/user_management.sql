drop database if exists user_management;
create database if not exists user_management;
USE user_management; 
create table users ( 
      id int NOT NULL AUTO_INCREMENT, 
      name varchar(120) NOT NULL, 
      email varchar(220) NOT NULL, 
      country varchar(120), 
      PRIMARY KEY (id) 
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia'),('Hieu','inh@codegym.vn','Viet Nam'),
('Kiet','mnh@codegym.vn','China'),
('Tuan','mfhnh@codegym.vn','Viet Nam'),
('Hung','mifdnh@codegym.vn','Japan'),
('Tuong','midgnh@codegym.vn','Viet Nam'),
('Dat','fgsminh@codegym.vn','Viet Nam'),
('Huu','sdgsg@codegym.vn','Viet Nam'),
('Toan','tw@codegym.vn','Viet Nam'),
('Toan','tw@codegym.vn','Viet Nam'),
('Toai','vzv@codegym.vn','Viet Nam'),
('Giang','fjf@codegym.vn','Viet Nam');

DELIMITER $$
create procedure get_user_by_id(in user_id int)
begin
 select users.name, users.email, users.country
 from users
 where users.id = user_id;
 end$$
DELIMITER ;

DELIMITER $$
create procedure insert_user(in user_name varchar(50),in user_email varchar(50),in user_country varchar(50))
begin
 insert into users(name, email, country) values(user_name, user_email, user_country);
 end$$
DELIMITER ;

create table permision(
      id int(11) primary key,
      name varchar(50)
);

create table user_permision(
     permision_id int(11),
     user_id int(11),
     foreign key (permision_id) references permision(id),
     foreign key (user_id) references users(id)
);

insert into permision(id, name) values(1, 'add');
insert into permision(id, name) values(2, 'edit');
insert into permision(id, name) values(3, 'delete');
insert into permision(id, name) values(4, 'view');


create table employee ( 
            id int(3) NOT NULL AUTO_INCREMENT, 
            name varchar(120) NOT NULL, 
            salary int(220) NOT NULL, 
            created_Date datetime, 
            PRIMARY KEY (id) 
);


delimiter //
create procedure get_user()
begin
 select *
 from users;
 end //
delimiter ;


delimiter //
create procedure sp_edit_user(p_id int,p_name varchar(120), p_email varchar(220), p_country varchar(120))
begin
 update users
 set name = p_name,
 email = p_email,
 country = p_country
 where id = p_id;
 end //
delimiter ;


delimiter //
create procedure sp_delete_user(p_id int)
begin
 delete from users
 where id = p_id;
 end //
delimiter ;