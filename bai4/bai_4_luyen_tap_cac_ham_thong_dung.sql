create database bai_3_truy_van_du_lieu_qlsv;
use bai_3_truy_van_du_lieu_qlsv;

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
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *from student
where `name`like 'H%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *from `class`
where month(start_date) =12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *from `subject` 
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update `student`
set class_id=2
where `name`='Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.`name`,sub.`name` ,m.mark  from student as s
join mark as m on m.student_id=s.id
join subject as sub on sub.id=m.sub_id
order by mark desc,s.`name` ;
