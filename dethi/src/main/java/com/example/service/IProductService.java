package com.example.service;

import com.example.model.Product;

import java.util.List;

public interface IProductService {


    List<Product> findAll();


    void insert(String name,double price,String color,String nameCategory);

    void remove(int id);

    Product searchById(int id);

    void edit(Product product);
    List<Product> relativeSearch(String search);
}
