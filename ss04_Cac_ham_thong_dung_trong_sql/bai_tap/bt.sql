use quan_li_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * , max(credit)
from subject;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất
select * 
from subject sj
join mark on sj.subject_id = mark.subject_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select *, avg(mark) as diem_tb
from student s
join mark on s.student_id = mark.student_id
group by s.student_id
order by diem_tb desc;
