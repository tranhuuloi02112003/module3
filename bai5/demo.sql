-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
drop index product_code_index on products;
create unique index product_code_index on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index product_name_price on products(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select *from products;
-- So sánh câu truy vấn trước và sau khi tạo index

-- B4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
	select product_code,product_name,product_price,product_status from products;
-- Tiến hành sửa đổi view
update products_view
set product_price=11111111
where product_code='sp_01';
-- Tiến hành xoá view
drop view products_view;


-- B5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
	delimiter $$
    create procedure show_product()
    begin
    select *from products;
    end $$
    delimiter ;
    call show_product();
    
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(p_id int ,p_code varchar(45),p_name varchar(45),p_price double, p_amount int ,p_description varchar(45),p_status tinyint)
begin
insert into products (id  ,product_code ,product_name,product_price , product_amount  ,product_description ,product_status) 
value(p_id ,p_code ,p_name ,p_price , p_amount  ,p_description ,p_status);
END // DELIMITER ;
delimiter //
CALL add_product(4,'sp04','tu lanh',2222222,1,'new',0);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product_id(p_id int,p_code varchar(45),p_name varchar(45),p_price double, p_amount int, p_description varchar(45), p_status tinyint)
begin
update products
set product_code=p_code,product_name=p_name,product_price=p_price,product_amount=p_amount,product_description=p_description,product_status=p_status
where id=p_id;
end // 
delimiter ;
call update_product_id(4,'sp44','may giat',6000000,1,'het hang',0 );
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_id(p_id int)
begin
delete from products where id=p_id;
end // 
delimiter ;
call delete_product_id(2);
select *from products;