/*TASK 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”*/
use furama_resort;

select k.ma_khach_hang , k.ho_ten , l.ten_loai_khach , h.ma_hop_dong , count(h.ma_khach_hang) as so_lan_dat_phong
from khach_hang k 
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
where l.ten_loai_khach ='Diamond'
group by h.ma_khach_hang
order by so_lan_dat_phong;

