package com.example.repository;

import com.example.model.Product;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepsitoryImpl implements IProductRepsitory {
    @Override
    public List<Product> findAll() {
        List<Product> list = new ArrayList<>();
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call get_all()")) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String namePro = resultSet.getString(2);
                Double price = resultSet.getDouble(3);
                String color = resultSet.getString(4);
                String nameCategory = resultSet.getString(5);
                Product product = new Product(id, namePro, price, color, nameCategory);
                list.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void insert(String name, double price, String color, String nameCategory) {
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call `insert`(?,?,?,?);")) {
            statement.setString(1, name);
            statement.setDouble(2, price);
            statement.setString(3, color);
            statement.setInt(4, searchIdCategory(nameCategory));
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void remove(int id) {
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call `remove`(?);")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product searchById(int idSearch) {
       Product product=null;
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call search_by_id(?)")) {
            statement.setInt(1, idSearch);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt(1);
                String name=resultSet.getString(2);
                double price=resultSet.getDouble(3);
                String color=resultSet.getString(4);
                String nameCategory=resultSet.getString(5);
                product= new Product(id,name,price,color,nameCategory);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public void edit(Product product) {
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call `edit`(?,?,?,?,?);")) {
            statement.setInt(1, product.getIdPro());
            statement.setString(2, product.getNamePro());
            statement.setDouble(3, product.getPrice());
            statement.setString(4, product.getColor());
            statement.setInt(5, searchIdCategory(product.getNameCategory()));
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Product> relativeSearch(String search) {
        List<Product>list= new ArrayList<>();
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("select p.id,p.name,p.price,p.color,c.name from product p join category c on c.id=p.category_id where p.id like ? or p.name like ? or p.price like ? or p.color like ? or c.name like ?")) {
            statement.setString(1, "%" +search+ "%");
            statement.setString(2, "%" +search+ "%");
            statement.setString(3, "%" +search+ "%");
            statement.setString(4, "%" +search+ "%");
            statement.setString(5, "%" +search+ "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt(1);
                String namePro=resultSet.getString(2);
                Double price=resultSet.getDouble(3);
                String coler=resultSet.getString(4);
                String nameCategory=resultSet.getString(5);
                list.add(new Product(id,namePro,price,coler,nameCategory));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public int searchIdCategory(String nameCategory) {
        int id = 0;
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call searchIdCategory(?)")) {
            statement.setString(1, nameCategory);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                id=resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
}
