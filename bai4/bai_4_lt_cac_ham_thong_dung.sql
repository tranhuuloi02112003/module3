create database bai_4_luyen_tap_cac_ham_thong_dung;
use bai_4_luyen_tap_cac_ham_thong_dung;

create table `class`(
	`id` int primary key not null auto_increment,
    `name`	varchar(60) not null,
    `start_date` datetime not null,
    `status` bit 
);
CREATE TABLE student(
    `id`  int primary key not null auto_increment,
    `name` varchar(30) not null,
    `address` varchar(50),
    `phone` varchar(20),
    `status` bit,
    `class_id` int not null,
    foreign key  (class_id) references `class` (id)
);
CREATE table `subject`(
    `id`  int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(30) NOT NULL,
    `credit` TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    `status`  BIT  DEFAULT 1
);
CREATE TABLE `Mark`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sub_id` INT NOT NULL,
    `student_id` INT NOT NULL,
    `mark` FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    `examtimes` TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES `subject` (id),
    FOREIGN KEY (student_id) REFERENCES `student` (id)
);
-- ----------------------------
insert into `class`
value(1,'A1','2008-12-20',1);
insert into `class`
value(2,'A2','2008-12-22',1);
INSERT INTO `class`
VALUES (3, 'B3', current_date, 0);

insert into student (`name`, address, phone, `Status`, `class_id`)
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (`name`, address, `Status`, `class_id`)
 value ('Hoa', 'Hai phong', 1, 1);
 insert into student (`name`, address, phone, `Status`, `class_id`)
 value ('Manh', 'HCM', '0123123123', 0, 2);
 
 insert into subject
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into Mark (sub_id, student_id, mark, examtimes)
value (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

-- BAI 3 TH2: TRUY VAN DU LIEU QLSV
-- Hiển thị danh sách tất cả các học viên
select *from student;
-- Hiển thị danh sách các học viên đang theo học.
select *from student
where `status`=true;
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select *from `subject`
where credit<10;
-- Hiển thị danh sách học viên lớp A1
select *from `class` c
join student s on c.id=s.class_id
where c.`name`='A1';
-- Hiển thị điểm môn CF của các học viên.
select *from `subject` sub
join `mark` m on sub.id=m.sub_id
where sub.`name`='CF';
-- ------------
-- BAI 4 TH:SU DUNG CAC HAM THONG DUNG
-- Hiển thị số lượng sinh viên ở từng nơi
select  address,count(address) from student
group by address;
-- Tính điểm trung bình các môn học của mỗi học viên
select s.`name`,avg(mark) as diemtb from `mark` m
join student s on s.id=m.student_id
group by student_id;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.`name`,avg(mark) as diemtb from `mark` m
join student s on s.id=m.student_id
group by student_id
having diemtb>15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select * from mark m
join student s on s.class_id=m.student_id
where mark=(
select avg(mark) as tb from mark
group by student_id
order by tb desc
limit 1
);

select avg(mark) as tb from mark
group by student_id
order by tb desc
limit 1;


SELECT S.id,S.name, AVG(m.mark) as avg_mark
FROM Student S join Mark M on S.id = M.Student_Id
GROUP BY S.id
HAVING avg_mark >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);

-- BAI 4 BT LUYEN TAP CAC HAM THONG DUNG
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *from `subject`
where `credit`=(select max(credit) from `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *from `subject`s
join `mark` m on s.id=m.sub_id
where `mark`=(select max(`mark`) from `mark`);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.id,s.`name`,s.address,s.phone,avg(m.mark) from student s
join mark m on s.id=m.student_id
group by m.student_id;
