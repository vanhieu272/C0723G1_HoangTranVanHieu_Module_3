create database student_management;
use student_management;
create table class(
id int primary key auto_increment,
`name` varchar(50)
);
insert into class (name) values ('C0723G1');

create table teacher(
id int primary key auto_increment,
`name` varchar(50),
age int,
country varchar(50)
)