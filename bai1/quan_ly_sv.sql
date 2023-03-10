CREATE database student_managemen;
use student_managemen;
CREATE table student(
	`id` int NOT NULL primary key,
    `name` varchar(50),
    `age` int ,
    `contry` varchar(45)
);

select *from  teacher;

-- Bảng Class có các trường lần lượt là id, name
-- Bảng Teacher có các trường lần lượt là id, name, age, country
create table class(
	`id` int,
    `name` varchar(50)
);
create table teacher(
	`id` int,
    `name` varchar(50),
    `age` int,
    `country` varchar(50)
);

