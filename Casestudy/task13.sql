/*TASK 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/

use furama_resort;

-- create view temp as
-- select dk.*, sum(so_luong) as so_luong_dich_vu_di_kem 
-- from hop_dong_chi_tiet hc 
-- join dich_vu_di_kem dk on hc.ma_dich_vu_di_kem = dk.ma_dich_vu_di_kem
-- group by dk.ma_dich_vu_di_kem;

select ten_dich_vu_di_kem, so_luong_dich_vu_di_kem
from temp
where so_luong_dich_vu_di_kem in (select max(so_luong_dich_vu_di_kem) from temp);