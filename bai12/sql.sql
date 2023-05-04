create database `demo`;
use demo;

create table `user`(
	id int auto_increment primary key ,
    name varchar(120) not null,
    email varchar(120) not null,
    country varchar(120)
);
insert into `user`(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into `user`(name, email, country) values('Kante','kante@che.uk','Kenia');
delimiter $$
create procedure get_user_by_id(in user_id int)
begin
select user.`name`,user.email,user.country
from `user`
where user.id=user_id;
end$$
delimiter ;

delimiter $$
create procedure insert_user(in user_name varchar(120),in user_email varchar(120),in user_country varchar(120))
begin
insert into `user`(name,email,country) values(user_name,user_email,user_country);
end$$
delimiter ;
CALL get_user_by_id(9);
call insert_user("canh","canh@gmail.com","VN" );
delimiter $$
create procedure show_list()
begin
select * from `user` ;
end$$
delimiter ;
call show_list();
delimiter $$
create procedure delete_by_id(in id_delete int)
begin
delete from `user` where id=id_delete;
end$$
delimiter ;
call delete_by_id(5);

delimiter $$
create procedure update_user( in id_update int,in name_update varchar(120),in email_update varchar(120),in country_update varchar(120))
begin
update `user` set `name`=name_update,email=email_update,country=country_update where id=id_update;
end$$
delimiter ;
call update_user(6,"A","A","A");

delimiter $$
create procedure select_all_user()
begin
select *from `user`;
end$$
delimiter ;
call select_all_user();
select *from `user` where country like "VN" order by `name`

