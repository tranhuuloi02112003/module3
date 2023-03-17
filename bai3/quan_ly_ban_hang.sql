create database bai_3_quan_ly_ban_hang;
use bai_3_quan_ly_ban_hang;

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

insert into customer
value(1,'Minh Quan',10),
(2,'Ngoc Anh',20),
(3,'Hong Ha',50);

insert into `order`
value(1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);

insert into product
value (1,'may giat',3),
	  (2,'tu lanh',5),
      (3,'dieu hoa',7),
      (4,'quat',1),
      (5,'bep dien',2);

insert into order_detail
value (1,1,3),
	  (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
-- -------------------    
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id,`date`,total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.id,c.`name`,c.age,pro.`name`,pro.price from customer c
join `order` o on o.customer_id=c.id
join order_detail od on od.orderr_id=o.id
join product pro on od.product_id=pro.id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.id,`name` from customer c
left join `order` o on o.customer_id=c.id
where o.id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)  
select o.id ,o.`date`,sum(od.od_qty*pro.price) from `order` o
join order_detail od on o.id=od.orderr_id
join product pro on pro.id=od.product_id
group by o.id;

