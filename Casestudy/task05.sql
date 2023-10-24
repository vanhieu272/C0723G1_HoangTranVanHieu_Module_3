/*TASK 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
(Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
(những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). */

use furama_resort;

select k.ma_khach_hang, k.ho_ten , lk.ten_loai_khach ,hd.ma_hop_dong ,dv.ten_dich_vu, lk.ma_loai_khach,
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, ifnull(dv.chi_phi_thue,0)+sum((ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
from khach_hang k 
left join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = k.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on  hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by k.ma_khach_hang, k.ho_ten , lk.ten_loai_khach ,hd.ma_hop_dong ,dv.ten_dich_vu, lk.ma_loai_khach,
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
order by k.ma_khach_hang;


