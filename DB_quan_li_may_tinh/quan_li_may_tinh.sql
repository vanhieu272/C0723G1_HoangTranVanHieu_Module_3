drop database if exists quan_ly_tiem_net;
create database if not exists quan_ly_tiem_net;

use quan_ly_tiem_net;

create table may_tinh(
ma_may int primary key auto_increment,
hang_san_xuat varchar(50),
vi_tri_dat_may varchar(50),
gia_1_gio float
);

create table loai_khach_hang(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(20)
);

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ten_khach_hang varchar(50),
sdt varchar(10),
email varchar(50),
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach_hang(ma_loai_khach)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(50),
gia float 
);

create table hoa_don(
ma_hoa_don int primary key auto_increment,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
ma_khach_hang int,
ma_may int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_may) references may_tinh(ma_may)
);

create table hoa_don_chi_tiet(
ma_hoa_don_chi_tiet int primary key auto_increment,
ma_hoa_don int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_hoa_don) references hoa_don(ma_hoa_don),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- ========================================================================== --
insert into may_tinh(hang_san_xuat, vi_tri_dat_may, gia_1_gio)
values ("Predator", "VIP", 10000),
("Predator", "VIP", 10000),
("Predator", "VIP", 10000),
("Acer", "Normal", 8000),
("Dell", "Normal", 8000),
("Lenovo", "Normal", 8000);
select * from may_tinh;

insert into loai_khach_hang(ten_loai_khach)
values("VIP"),
("Member"),
("Other");
