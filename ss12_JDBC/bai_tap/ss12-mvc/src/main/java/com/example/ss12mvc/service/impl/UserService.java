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
}
