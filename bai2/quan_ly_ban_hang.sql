create database bai_2_quan_ly_ban_hang;
use bai_2_quan_ly_ban_hang;

create table `customer`(
	`id` int primary key,
    `name` varchar(50) not null,
    `age` int not null
);

create table `order`(
	`id` int primary key,
    `customer_id` int,
    foreign key (customer_id) references customer(id),
    `date` date,
	`total_price` varchar (50)
);
create table `product`(
	`id` int primary key,
    `name` varchar(50),
    `price` varchar(50)
);
create table `order_detail`(
	orderr_id int,
    product_id int,
    foreign key (orderr_id) references `order`(id),
    foreign key (product_id) references product(id),
    od_qty int
);
