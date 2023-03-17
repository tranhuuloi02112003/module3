create database bai_2_erd;
use bai_2_erd;
create table phieu_xuat(
	so_px int primary key,
    ngay_xuat date
);
create table vat_tu(
	ma_vtu char primary key,
    ten_vtu varchar(50)
);
create table phieu_nhap(
	so_pn int primary key,
    ngay_nhap date
);
create table don_dh(
	so_dh int primary key,
    ngay_dh date
);
create table nha_cc(
	ma_ncc char primary key,
    ten_ncc varchar (50),
    dia_chi varchar(50)
    -- sdt varchar(11)
);

alter table don_dh add column ma_ncc char;
alter table don_dh add foreign key (ma_ncc) references nha_cc(ma_ncc);

create table chi_tiet_nha_cc(
	nha_cc_ma char,
    foreign key (nha_cc_ma) references nha_cc(ma_ncc),
    sdt int
);


create table chi_tiet_xuat_khau(
	 don_gia_xuat double,
     sl_xuat int,
     ma_vtu varchar(50) ,
     foreign key (ma_vtu) references vat_tu(ma_vtu),
     so_px int,
     foreign key(so_px) references phieu_xuat(so_px)
);
create table chi_tiet_phieu_nhap(
	dg_nhap double,
    sl_nhap  int,
    ma_vtu char,
    foreign key (ma_vtu) references vat_tu(ma_vtu),
    so_pn int,
    foreign key (so_pn) references phieu_nhap(so_pn) 
);

create table chi_tiet_don_dat_hang(
	ma_vtu char,
    so_dh int,
    foreign key(ma_vtu)references vat_tu(ma_vtu),
    foreign key (so_dh) references don_dh(so_dh)
);



