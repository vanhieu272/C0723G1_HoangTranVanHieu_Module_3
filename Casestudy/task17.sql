/*TASK 17: 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.*/

use furama_resort;

create view cap_nhat_khach_hang as
    select 
        h.ma_khach_hang,
        sum(d.chi_phi_thue + dk.gia * hc.so_luong) as tong_tien
    from
        khach_hang k
            join
        hop_dong h on k.ma_khach_hang = h.ma_khach_hang
            join
        dich_vu d on h.ma_dich_vu = d.ma_dich_vu
            left join
        hop_dong_chi_tiet hc on hc.ma_hop_dong = h.ma_hop_dong
            join
        dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = hc.ma_dich_vu_di_kem
    where
        year(ngay_lam_hop_dong) = '2021'
    group by h.ma_khach_hang
    having sum(d.chi_phi_thue + dk.gia * hc.so_luong) > 1000000;
select 
    *
from
    cap_nhat_khach_hang;

-- drop view cap_nhat_khach_hang;
update khach_hang 
set 
    ma_loai_khach = 1
where
    ma_loai_khach = 2 
    and ma_khach_hang in (select ma_khach_hang from cap_nhat_khach_hang);
    
SELECT * FROM furama_resort.khach_hang;   
