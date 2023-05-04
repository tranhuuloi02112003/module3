package com.example.ung_dung_qlsp.service;

import com.example.ung_dung_qlsp.model.Product;
import com.example.ung_dung_qlsp.repository.IproductRepository;
import com.example.ung_dung_qlsp.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService{
    IproductRepository repository =  new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public void edit(Product product) {
//        repository.edit(Product product);
        repository.edit(product);
    }

    @Override
    public void remove(String id) {
        repository.remove(id);
    }

    @Override
    public List<Product> findByIdOrName(String id) {
        return repository.findByIdOrName(id);
    }

    @Override
    public Product findById(String id) {
        return repository.findById(id);
    }


}
