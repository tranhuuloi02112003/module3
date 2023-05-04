package com.example.ung_dung_qlsp.model;

public class Product {
    private String id,productName,productDescription,producer;
    private double productPrice;

    public Product() {
    }

    public Product(String id, String productName, String productDescription, String producer, double productPrice) {
        this.id = id;
        this.productName = productName;
        this.productDescription = productDescription;
        this.producer = producer;
        this.productPrice = productPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }
}
