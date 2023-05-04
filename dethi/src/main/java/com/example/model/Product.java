package com.example.model;

public class Product {
    private int idPro;
    private String namePro;
    private double price;
    private String color;
    private String nameCategory;

    public Product() {
    }

    public Product(int idPro, String namePro, double price, String color, String nameCategory) {
        this.idPro = idPro;
        this.namePro = namePro;
        this.price = price;
        this.color = color;
        this.nameCategory = nameCategory;
    }

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    public String getNamePro() {
        return namePro;
    }

    public void setNamePro(String namePro) {
        this.namePro = namePro;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }
}
