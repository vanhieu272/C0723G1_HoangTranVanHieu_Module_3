drop database if exists quan_ly_vat_tu;
create database if not exists quan_ly_vat_tu;
use quan_ly_vat_tu;

create table phieu_xuat
(
	so_px int primary key auto_increment,
    ngay_xuat datetime not null
);

create table vat_tu
(
	ma_vtu int primary key auto_increment,
    ten_vtu varchar(50) not null
);

create table chi_tiet_phieu_xuat
(
	so_px int primary key auto_increment,
    ma_vtu int not null,
    dg_xuat float not null,
    sl_xuat int not null,
    foreign key (so_px) references phieu_xuat (so_px),
    foreign key (ma_vtu) references  vat_tu (ma_vtu)
);

create table phieu_nhap
(
	so_pn int primary key auto_increment,
    ngay_nhap datetime not null
);

create table chi_tiet_phieu_nhap
(
    so_pn int primary key auto_increment,
    ma_vtu int not null,
    dg_nhap float not null,
    sl_nhap int not null,
    foreign key (ma_vtu) references vat_tu (ma_vtu),
    foreign key (so_pn) references phieu_nhap (so_pn)
);

create table nha_cc
(
	ma_ncc int primary key auto_increment,
    ten_ncc varchar(50) not null,
    dia_chi varchar(50) not null
);

create table don_dh
(
	so_dh int primary key auto_increment,
    ngay_dh datetime not null,
    ma_ncc int not null,
    foreign key (ma_ncc) references nha_cc (ma_ncc)
);

create table chi_tiet_don_dat_hang
(
    so_dh int primary key auto_increment,
    ma_vtu int not null,
    foreign key (ma_vtu) references vat_tu (ma_vtu),
    foreign key (so_dh) references don_dh (so_dh)
);

create table cung_cap
(
	so_dh int not null,
    ma_ncc int not null,
	foreign key(so_dh) references  don_dh(so_dh),
	foreign key(ma_ncc) references  nha_cc(ma_ncc)
);

create table sdt
(
	sdt int not null,
    ma_ncc int not null,
    primary key (sdt, ma_ncc),
    foreign key (ma_ncc) references nha_cc (ma_ncc)
);
	
