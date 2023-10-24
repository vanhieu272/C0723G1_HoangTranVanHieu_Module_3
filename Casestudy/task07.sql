/*TASK 7: 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.*/

use furama_resort;

select d.ma_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu d
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = d.ma_loai_dich_vu 
join hop_dong h on h.ma_dich_vu = d.ma_dich_vu
where h.ma_dich_vu in (
select h.ma_dich_vu 
from hop_dong h
where (year(h.ngay_lam_hop_dong)) = 2020 
)
and h.ma_dich_vu not in (
select h.ma_dich_vu 
from hop_dong h
where (year(h.ngay_lam_hop_dong)) = 2021 
)
group by h.ma_dich_vu;