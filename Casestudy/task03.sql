use furama_resort;

/*TASK 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. */
select *from khach_hang
where (dia_chi like '%Quảng Trị' or dia_chi like '%Đà Nẵng') and timestampdiff(year,ngay_sinh,curdate()) between 18 and 50;
