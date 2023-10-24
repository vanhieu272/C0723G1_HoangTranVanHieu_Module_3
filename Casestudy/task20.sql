/*TASK 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi. */

use furama_resort;

select ma_nhan_vien id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union select ma_khach_hang id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;