package com.example.ung_dung_qlsp.service;

import com.example.ung_dung_qlsp.model.Product;

import java.util.List;

public interface IProductService {
//Hiển thị danh sách sản phẩm
//Tạo sản phẩm mới

//Cập nhật thông tin sản phẩm
//Xoá một sản phẩm
//Xem chi tiết một sản phẩm
//Tìm kiếm sản phẩm theo tên

    List<Product> findAll();
    public void save(Product product);
    public void edit(Product product);
    public void remove(String id);
    public List<Product> findByIdOrName(String id);


    Product findById(String id);
}
