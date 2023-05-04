package com.example.ung_dung_qlsp.repository;

import com.example.ung_dung_qlsp.model.Product;

import java.util.List;

public interface IproductRepository {
    List<Product> findAll();
    void save(Product product);

    void edit(Product product);

    void remove(String id);

    List<Product> findByIdOrName(String id);

    Product findById(String id);
}
