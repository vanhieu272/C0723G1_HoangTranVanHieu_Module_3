package com.example.ss12mvc.service.impl;

import com.example.ss12mvc.model.User;
import com.example.ss12mvc.repository.IUserRepository;
import com.example.ss12mvc.repository.impl.UserRepository;
import com.example.ss12mvc.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository = new UserRepository();

    @Override
    public boolean insertUser(User user) throws SQLException {
       return userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }

    @Override
    public List<User> orderByName() {
        return userRepository.orderByName();
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userRepository.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) {
        userRepository.addUserTransaction(user, permission);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userRepository.insertUpdateUseTransaction();
    }

    @Override
    public List<User> getAllUsersBySP() {
        return userRepository.getAllUsersBySP();
    }

    @Override
    public boolean updateUserBySP(User user) {
        return userRepository.updateUserBySP(user);
    }

    @Override
    public boolean deleteUserBySP(int id) {
        return userRepository.deleteUserBySP(id);
    }

    @Override
    public void deleteUserTransaction() throws SQLException {
        userRepository.deleteUserTransaction();
    }
}
