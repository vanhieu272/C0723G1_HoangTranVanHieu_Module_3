/*TASK 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.*/

use furama_resort;

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem  
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong h on h.ma_hop_dong = hdct.ma_hop_dong
join khach_hang k on k.ma_khach_hang = h.ma_khach_hang
join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = "Diamond" and k.dia_chi like "%Vinh%" or dia_chi like "%Quảng Ngãi%"
