package com.example.service;

import com.example.model.Product;
import com.example.repository.IProductRepsitory;
import com.example.repository.ProductRepsitoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService{
    IProductRepsitory repsitory =  new ProductRepsitoryImpl();
    @Override
    public List<Product> findAll() {
        return repsitory.findAll();
    }

    @Override
    public void insert(String name,double price,String color,String nameCategory) {
        repsitory.insert(name,price,color,nameCategory);
    }

    @Override
    public void remove(int id) {
        repsitory.remove(id);
    }

    @Override
    public Product searchById(int id) {
        return repsitory.searchById(id);
    }

    @Override
    public void edit(Product product) {
         repsitory.edit(product);
    }

    @Override
    public List<Product> relativeSearch(String search) {
        return repsitory.relativeSearch(search);
    }
}
