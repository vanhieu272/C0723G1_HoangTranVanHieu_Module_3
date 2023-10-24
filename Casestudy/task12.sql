/*TASK 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
 ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ
 đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021. */
 
 use furama_resort;
 
 select hd.ma_hop_dong, nv.ho_ten as ten_nhan_vien, kh.ho_ten as ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu, sum(ifnull(hdct.so_luong, 0)) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
 from hop_dong hd
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 where (quarter(ngay_lam_hop_dong) = 4
			and year(ngay_lam_hop_dong) = '2020')
        and dv.ma_dich_vu not in (seLect 
            ma_dich_vu
        from
            hop_dong
        where
            (quarter(ngay_lam_hop_dong) in (1,2)
                and year(ngay_lam_hop_dong) = '2021'))
 group by hd.ma_hop_dong;


 
       


 