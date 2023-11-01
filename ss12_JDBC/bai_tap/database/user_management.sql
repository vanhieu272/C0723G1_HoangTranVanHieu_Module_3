drop database if exists user_management;
CREATE DATABASE if not exists user_management;
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

select * from users;