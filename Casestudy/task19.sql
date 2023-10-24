/*TASK 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. */

use furama_resort;

create view v_temp as 
select ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = '2020'
group by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10;

set sql_safe_updates = 0;
update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in ( select * from v_temp);