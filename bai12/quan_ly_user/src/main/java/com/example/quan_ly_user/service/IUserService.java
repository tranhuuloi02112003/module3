package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;

import java.util.List;

public interface IUserService {
    public void insertUsers(User users);
    public void insertUserProcedure(User user);
    //
    public User selectUserById(int id);
    public User getUserByIdProcedure(int id);
    //
    public List<User> selectAllUsers();
    public List<User> selectAllUserProcedure();

    //
    public boolean updateUser(User user);
    public boolean updateUserProcedure(User user);

    //
    public void delectUserById(int id);
    public void delectUserByIdProcedure(int id);

    //
    public List<User> selectUserByCountry(String country);

    public List<User> sortByName(String search);

}
