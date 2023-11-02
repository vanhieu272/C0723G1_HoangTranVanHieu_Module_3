package com.example.ss12mvc.repository;

import com.example.ss12mvc.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {

    public boolean insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> searchByCountry(String country);

    List<User> orderByName();

    void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, List<Integer> permission);

    void insertUpdateWithoutTransaction();

    void insertUpdateUseTransaction();

    List<User> getAllUsersBySP();

    boolean updateUserBySP(User user);

    boolean deleteUserBySP(int id);

    void deleteUserTransaction() throws SQLException;
}
