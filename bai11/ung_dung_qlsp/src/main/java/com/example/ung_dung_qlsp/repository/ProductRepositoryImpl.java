package com.example.ung_dung_qlsp.repository;

import com.example.ung_dung_qlsp.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IproductRepository {

    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product("1", "Laptop", "New", "NSX1", 2000000));
        productList.add(new Product("2", "Tu lanh", "Old", "NSX2", 5000000));
        productList.add(new Product("3", "Dep", "New", "NSX3", 700000));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void edit(Product product) {
        for (Product pro : productList) {
            if (pro.getId().equals(product.getId())) {
//                pro.setId(product.getId());
//                pro.setProducer(product.getProducer());
//                pro.setProductDescription(product.getProductDescription());
//                pro.setProductName(product.getProductName());
//                pro.setProducer(product.getId());
                productList.set(productList.indexOf(pro), product);
            }
        }
    }

    @Override
    public void remove(String id) {
        for (Product pro : productList) {
            if (pro.getId().equals(id)) {
                productList.remove(productList.indexOf(pro));
                break;
            }
        }

//        productList.removeIf(e -> e.getId() == id);
    }

    @Override
    public List<Product> findByIdOrName(String id) {
        List<Product> dsMoi = new ArrayList<>();
        for (Product product : productList) {
            if (product.getId().equals(id)) {
                dsMoi.add(product);
            }
        }
        return dsMoi;
    }

    @Override
    public Product findById(String id) {
        for (Product product : productList) {
            if (product.getId().equals(id)) {
                return product;
            }
        }
        return null;
    }
}
