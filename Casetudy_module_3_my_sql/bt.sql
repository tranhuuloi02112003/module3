-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *from nhan_vien
where  SUBSTRING_INDEX(ho_ten, ' ', - 1) 
regexp '^[HTK]' and CHAR_LENGTH(ho_ten) <= 15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where timestampdiff(year,ngay_sinh,now()) between 18 and 50 
and (dia_chi like '%quang tri' or dia_chi like '%da nang');
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ho_ten,lk.ten_loai_khach,count(hd.ma_khach_hang) as so_lan_dat from hop_dong hd
join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
where ten_loai_khach='diamond'
group by hd.ma_khach_hang
order by so_lan_dat;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu=dv.ma_dich_vu
where (hd.ngay_lam_hop_dong between '2021-1-1' and '2021-3-31');
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu from dich_vu dv
join loai_dich_vu ldv using (ma_loai_dich_vu)
where ma_dich_vu not in (
	select ma_dich_vu from dich_vu dv
	join hop_dong hd using (ma_dich_vu)
	where year(ngay_lam_hop_dong) = 2021
) and ma_dich_vu in(select ma_dich_vu from dich_vu dv
join hop_dong hd using (ma_dich_vu)
where year(ngay_lam_hop_dong) = 2020);
    
--    select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu,ngay_lam_hop_dong from dich_vu dv 
--    join loai_dich_vu ldv using (ma_loai_dich_vu)
--    join hop_dong hd using (ma_dich_vu)
--    where not year(ngay_lam_hop_dong) = 2021;
    
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct(ho_ten) from khach_hang;
select ho_ten from khach_hang
group by ho_ten;
select ho_ten from khach_hang
union
select ho_ten from khach_hang;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select t.thang,sl.sl_khach_dat from 
(
select 1 thang 
union select 2 union select 3 union select 4 union select 5 union select 6 union select 7
union select 8 union select 9 union select 10 union select 11 union select 12
) as t
left join (
	select  month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as sl_khach_dat from hop_dong
	where year(ngay_lam_hop_dong)=2021
	group by thang
) as sl using (thang);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm 
-- ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
	select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,sum(hd.tien_dat_coc) as tong_tien_coc,sum(hdct.so_luong) as sl_dv_di_kem from hop_dong hd
    left join hop_dong_chi_tiet hdct using (ma_hop_dong)
    left join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
    group by hd.ma_hop_dong;
	
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
 -- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
	select dvdk.ma_dich_vu_di_kem,dvdk.gia,dvdk.ten_dich_vu_di_kem,dvdk.trang_thai,dvdk.don_vi,lk.ten_loai_khach,dia_chi from khach_hang kh
	join loai_khach lk using (ma_loai_khach)
    join hop_dong hd using(ma_khach_hang)
    join hop_dong_chi_tiet hdct using (ma_hop_dong)
    join dich_vu_di_kem dvdk using(ma_dich_vu_di_kem)
    where lk.ten_loai_khach='Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%quang ngai')
    ;
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được 
-- khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
	select hd.ma_hop_dong,nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu,sum(hd.tien_dat_coc),sum(hdct.so_luong),hd.ngay_lam_hop_dong 
    from hop_dong hd
    join nhan_vien nv  using (ma_nhan_vien)
    join khach_hang kh using (ma_khach_hang)
    join dich_vu dv using (ma_dich_vu) 
    join hop_dong_chi_tiet hdct using (ma_hop_dong)
    where hd.ma_hop_dong in	
    (	select hd.ma_khach_hang from hop_dong hd
    where ngay_lam_hop_dong between '2020-10-1'and '2020-12-31'
    ) and hd.ma_hop_dong  not in (
    select hd.ma_khach_hang from hop_dong hd
    where ngay_lam_hop_dong between '2021-1-1'and '2021-6-31'
    )
    group by hdct.ma_hop_dong;
    
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
	select hdct.ma_dich_vu_di_kem,sum(hdct.so_luong),dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai
	from dich_vu_di_kem dvdk
    join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
    group by hdct.ma_dich_vu_di_kem
	having sum(hdct.so_luong)  >= all (
		select sum(so_luong) from hop_dong_chi_tiet
		group by ma_dich_vu_di_kem );
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
	SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	select 
     hd.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(dvdk.ma_dich_vu_di_kem) as so_luong_sd
	from dich_vu_di_kem dvdk
    join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
    join hop_dong hd on hd.ma_hop_dong=hdct.ma_hop_dong
    join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
    join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
    group by dvdk.ma_dich_vu_di_kem
    having so_luong_sd=1;
    ;

    
    
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,nv.ho_ten,nv.ngay_sinh,nv.so_cmnd,nv.luong,nv.so_dien_thoai,nv.email,nv.dia_chi,nv.ma_vi_tri,nv.ma_trinh_do,nv.ma_bo_phan from nhan_vien nv
join (
	select ma_nhan_vien,count(ma_nhan_vien) from hop_dong
    where year(ngay_lam_hop_dong)=2020 or year(ngay_lam_hop_dong)=2021
    group by ma_nhan_vien
    having count(ma_nhan_vien) <=3
) as nv_toi_da_3hd_trong_nam on nv.ma_nhan_vien=nv_toi_da_3hd_trong_nam.ma_nhan_vien;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien
where ma_nhan_vien not in
(
select t.ma_nhan_vien from
( select nv.ma_nhan_vien from  nhan_vien nv
join hop_dong hd using (ma_nhan_vien)
where year(ngay_lam_hop_dong) between 2019 and 2021) t
);
delete from nhan_vien nv
where not exists
( select 1 from  hop_dong hd
where hd.ma_nhan_vien = nv.ma_nhan_vien and year(ngay_lam_hop_dong) between 2019 and 2021);
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
	delete from khach_hang kh
    where kh.ma_khach_hang not in
		(
		select kh.ma_khach_hang from hop_dong hd
		join khach_hang kh using(ma_khach_hang)
		where year(hd.ngay_lam_hop_dong) <2021
        );
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
	update dich_vu_di_kem
    set gia=gia*2
    where ma_dich_vu_di_kem in
    (
	select t.ma_dich_vu_di_kem from (
		select dvdk.ma_dich_vu_di_kem from hop_dong_chi_tiet hdct
		join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
		join hop_dong hd using (ma_hop_dong)
		where year(hd.ngay_lam_hop_dong)=2020 
		group by dvdk.ma_dich_vu_di_kem
		having sum(hdct.so_luong)>10) as t
    );
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
	select ma_nhan_vien as id,ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from nhan_vien
    union all
    select ma_khach_hang as id,ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from khach_hang;
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,sum( gia_dv + hdct.so_luong*dvdk.gia) as tong_tien
from khach_hang kh
left join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
left join (-- ====
	select kh.ma_khach_hang,sum(chi_phi_thue) as gia_dv from khach_hang kh
	join hop_dong hd using (ma_khach_hang)
    join dich_vu dv using (ma_dich_vu)
    group by kh.ma_khach_hang
) as gia_dv_moi_nguoi using (ma_khach_hang)
group by kh.ma_khach_hang
;    
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
/*	select * from hop_dong_chi_tiet hdct
    join dich_vu_di_kem dvdk using (ma_dich_vu_di_kem)
    join hop_dong hd using (ma_hop_dong)
    join khach_hang kh using (ma_khach_hang);
*/    
