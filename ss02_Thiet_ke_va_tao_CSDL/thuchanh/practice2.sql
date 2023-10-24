create database QuanLySinhVien;
use QuanLySinhVien;

create table HocSinh(
MaHS varchar(20) primary key not null,
TenHS varchar(50),
NgaySinh datetime,
Lop varchar(20),
GioiTinh varchar(20)
    );
    
create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(50),
SDT varchar(10)
);
    
create table MonHoc(
MaMH varchar(20) primary key not null,
TenMH varchar(50),
MaGV varchar(20), 
foreign key (MaGV) references GiaoVien(MaGV)
);

create table BangDiem(
MaHS varchar(20),
MaMH varchar(50),
DiemThi int,
NgayKT date,
primary key(MaMH, MaHS),
foreign key(MaMH) references MonHoc(MaMH),
foreign key(MaHS) references HocSinh(MaHS)
)
    
    