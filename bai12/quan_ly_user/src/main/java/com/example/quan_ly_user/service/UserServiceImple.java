package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;
import com.example.quan_ly_user.repository.IUserRepository;
import com.example.quan_ly_user.repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImple implements IUserService {
    IUserRepository repository= new UserRepositoryImpl();

    @Override
    public void insertUsers(User user) {
        repository.insertUsers(user);
    }

    @Override
    public User selectUserById(int id) {
        return repository.selectUserById(id);
    }

    @Override
    public void delectUserById(int id) {
        repository.delectUserById(id);
    }

    @Override
    public void delectUserByIdProcedure(int id) {
        repository.delectUserByIdProcedure(id);
    }

    @Override
    public boolean updateUser(User user) {
        return repository.updateUser(user);
    }

    @Override
    public boolean updateUserProcedure(User user) {
        return repository.updateUserProcedure(user);
    }

    @Override
    public List<User> selectAllUsers() {
         return repository.selectAllUsers();
    }

    @Override
    public List<User> selectAllUserProcedure() {
        return repository.selectAllUserProcedure();
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return repository.selectUserByCountry(country);
    }

    @Override
    public  List<User> sortByName(String search) {
         return repository.sortByName(search);
    }

    @Override
    public User getUserByIdProcedure(int id) {
        return repository.getUserByIdProcedure(id);
    }

    @Override
    public void insertUserProcedure(User user) {
        repository.insertUserProcedure(user);
    }


}
