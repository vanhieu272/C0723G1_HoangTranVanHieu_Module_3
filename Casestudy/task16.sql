

use furama_resort;

CREATE VIEW xoa AS 
SELECT n.ma_nhan_vien, n.ho_ten, COUNT(h.ma_hop_dong) as so_hop_dong_da_lap
FROM nhan_vien n
LEFT JOIN hop_dong h ON n.ma_nhan_vien = h.ma_nhan_vien
GROUP BY n.ma_nhan_vien
HAVING COUNT(h.ma_hop_dong) = 0;
SELECT * FROM xoa;
DROP VIEW xoa;

SET sql_safe_updates = 0;
DELETE FROM nhan_vien n
WHERE n.ma_nhan_vien IN (SELECT ma_nhan_vien FROM xoa);
SET sql_safe_updates = 1;