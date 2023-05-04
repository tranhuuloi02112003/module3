SELECT * FROM test__exam.product;
-- lấy all product
delimiter $$
create procedure get_all()
begin
	select p.id ,p.`name`,p.price ,p.color,c.`name`  from product p
     join category c on c.id=p.category_id;
end$$
delimiter ;
call get_all();
-- tìm tên category theo id
delimiter $$
create procedure get_name_category(in category_id int)
begin
	select `name` from category
    where id=category_id;
end$$
delimiter ;
-- thêm mới
delimiter $$
create procedure `insert`(in `name` varchar(120),in price double,in color varchar(120),in nameCategory int)
begin
		insert into product(`name`,price,`color`,`category_id`)
        values(`name`,price,color,nameCategory);
end$$
delimiter ;
call `insert`("book",5000,"red",2);
-- tìm id category
delimiter $$
create procedure `searchIdCategory`(in nameCategory varchar(120))
begin
		select id from category where `name`=nameCategory;
end$$
delimiter ;
-- xóa theo id
delimiter $$
create procedure `remove`(in id_remove int)
begin
		delete from product where id=id_remove;
end$$
delimiter ;
call `remove`(12);
-- tìm theo id
delimiter $$
create procedure `search_by_id`(in id_search int)
begin
		select p.id,p.`name`,p.price,p.color,c.`name` from product p
        join category c on c.id=p.category_id
        where p.id=id_search;
end$$
delimiter ;
call search_by_id(3);
-- edit product
delimiter $$
create procedure `edit`(in id_search int,in `name_edit` varchar(120),in price_edit varchar(120),in color_edit varchar(120),in category_id_edit int)
begin
		update product 
        set `name`=name_edit,`price`=price_edit,color=color_edit,category_id=category_id_edit
        where id=id_search;
        
end$$
delimiter ;
call edit();





