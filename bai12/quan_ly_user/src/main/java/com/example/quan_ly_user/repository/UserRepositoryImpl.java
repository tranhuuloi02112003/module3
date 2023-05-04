package com.example.quan_ly_user.repository;

import com.example.quan_ly_user.model.User;
import com.mysql.cj.jdbc.CallableStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    @Override
    public List<User> selectAllUsers() {
        Connection connection = DBconnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<User> userList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select * from `user`");
                resultSet = statement.executeQuery();

                User user = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    String name = resultSet.getString(2);
                    String email = resultSet.getString(3);
                    String country = resultSet.getString(4);
                    user = new User(id, name, email, country);
                    userList.add(user);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBconnection.close();
            }
        }
        return userList;
    }
    @Override
    public List<User> selectAllUserProcedure() {
        List<User>userList=new ArrayList<>();
        try (Connection connection= DBconnection.getConnection();
             CallableStatement callableStatement= (CallableStatement) connection.prepareCall("call select_all_user()")){
            ResultSet resultSet =callableStatement.executeQuery();
            while (resultSet.next()){
                int id =resultSet.getInt(1);
                String name =resultSet.getString(2);
                String email =resultSet.getString(3);
                String country =resultSet.getString(4);
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }
    @Override
    public boolean updateUser(User user) {
        boolean rowUpdated = false;
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("update `user` set `name`=? ,email=?,country=? where id=?;")) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }
    @Override
    public boolean updateUserProcedure(User user) {
        boolean rowUpdated = false;
        try (Connection connection = DBconnection.getConnection();
             CallableStatement callableStatement = (CallableStatement) connection.prepareCall("call update_user(?,?,?,?)")) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public void insertUsers(User user) {
        Connection connection = DBconnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into user values (?,?,?,?)");

                statement.setInt(1, user.getId());
                statement.setString(2, user.getName());
                statement.setString(3, user.getEmail());
                statement.setString(4, user.getCountry());

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBconnection.close();
            }
        }
    }
    @Override
    public void insertUserProcedure(User user) {
        try (Connection connection=DBconnection.getConnection();
             CallableStatement callableStatement= (CallableStatement) connection.prepareCall("call insert_user(?,?,?)")){
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delectUserById(int id) {
        Connection connection = DBconnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("delete from `user` where id=?");
                statement.setInt(1, id);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBconnection.close();
            }
        }
    }

    @Override
    public void delectUserByIdProcedure(int id) {
        try (Connection connection=DBconnection.getConnection();
             CallableStatement callableStatement= (CallableStatement) connection.prepareCall("call delete_by_id(?)")){
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUserById(int id) {
        User user = null;
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("select * from `user` where id=?")) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                user = new User(id, name, email, country);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    @Override
    public User getUserByIdProcedure(int id) {
        User user = null;
        try (Connection connection = DBconnection.getConnection();
             CallableStatement statement = (CallableStatement) connection.prepareCall("call get_user_by_id(?)")) {
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    @Override
    public List<User> selectUserByCountry(String countrySearch) {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("select *from `user` where country=?")) {
            statement.setString(1, countrySearch);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
    @Override
    public List<User> sortByName(String search) {
        if (search.equals("")){
            search="%";
        }
        List<User> sortList = new ArrayList<>();
        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement("select *from `user` where country like ? order by `name`")) {
           statement.setString(1, search);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                sortList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sortList;
    }
}
