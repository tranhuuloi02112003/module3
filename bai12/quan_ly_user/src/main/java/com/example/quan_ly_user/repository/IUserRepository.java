package com.example.quan_ly_user.repository;

import com.example.quan_ly_user.model.User;

import java.util.List;

public interface IUserRepository {
    public void insertUsers(User users);
    public User selectUserById(int id);
    public void delectUserById(int id);
    public boolean updateUser(User user);
    public List<User> selectAllUsers();

    List<User> selectUserByCountry(String country);

    List<User> sortByName(String search);

    User getUserByIdProcedure(int id);

    void insertUserProcedure(User user);

    void delectUserByIdProcedure(int id);

    boolean updateUserProcedure(User user);

    List<User> selectAllUserProcedure();
}
