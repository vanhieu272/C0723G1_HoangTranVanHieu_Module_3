package com.example.ss12mvc.repository.impl;

import com.example.ss12mvc.model.User;
import com.example.ss12mvc.repository.IUserRepository;
import com.example.ss12mvc.util.BaseRepository;
import com.mysql.cj.jdbc.result.ResultSetImpl;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private final String SELECT_ALL = "select * from users;";
    private final String INSERT_INTO = "insert into users(name,email,country) values (?, ?, ?);";
    private final String UPDATE_USER = "update users set name = ?,email= ?, country =? where id = ?;";
    private final String SELECT_USER_BY_ID = "select * from users where id =?";
    private final String DELETE_USER = "delete from users where id = ?;";
    private static final String SEARCH_BY_COUNTRY = "select * from users where country like ?;";
    private final String ORDER_BY_NAME = "select * from users order by name;";

    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " + " (?, ?, ?);";

    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";
    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";
    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"
            + "("
            + " ID serial,"
            + " NAME varchar(100) NOT NULL,"
            + " SALARY numeric(15, 2) NOT NULL,"
            + " CREATED_DATE timestamp,"
            + " PRIMARY KEY (ID)"
            + ")";
    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";

    @Override
    public boolean insertUser(User user) {
        Connection connection = BaseRepository.getConnectDB();

        int count = 0;
        try {
            PreparedStatement preparedStatement = null;
            preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            count = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return (count == 1);
    }

    @Override
    public User selectUser(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean check;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        preparedStatement.setInt(4, user.getId());

        check = preparedStatement.executeUpdate() > 0;
        return check;
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_COUNTRY);
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> orderByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    /******************************************************************************/
    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";

        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;
        try {
            conn = BaseRepository.getConnectDB();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getCountry());
            int rowAffected = pstmt.executeUpdate();
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next())
                userId = rs.getInt(1);
            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "
                        + "VALUES(?,?)";
                pstmtAssignment = conn.prepareStatement(sqlPivot);
                for (int permissionId : permission) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permissionId);
                    pstmtAssignment.executeUpdate();
                }
                conn.commit();
            } else {
                conn.rollback();
            }

        } catch (SQLException ex) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        Connection conn = BaseRepository.getConnectDB();
        try {
            Statement statement = conn.createStatement();
            PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);
            PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE);
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);

            // Run list of insert commands
            psInsert.setString(1, "Quynh");
            psInsert.setBigDecimal(2, new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psInsert.setString(1, "Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psUpdate.setBigDecimal(2, new BigDecimal(999.99));
            psUpdate.setString(2, "Quynh");
            psUpdate.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertUpdateUseTransaction() {
        Connection conn = BaseRepository.getConnectDB();
        try {
            Statement statement = conn.createStatement();
            PreparedStatement psInsert = conn.prepareStatement(SQL_INSERT);
            PreparedStatement psUpdate = conn.prepareStatement(SQL_UPDATE);
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            conn.setAutoCommit(false);
            psInsert.setString(1, "Quynh");
            psInsert.setBigDecimal(2, new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psInsert.setString(1, "Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            psUpdate.setBigDecimal(2, new BigDecimal(999.99));
            psUpdate.setString(2, "Quynh");
            psUpdate.execute();
            conn.commit();
            conn.setAutoCommit(true);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public List<User> getAllUsersBySP() {
        List<User> users = new ArrayList<>();
        String query = "{CALL get_user()}";
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(query);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    @Override
    public boolean updateUserBySP(User user) {
        boolean rowUpdated;
        Connection connection = BaseRepository.getConnectDB();
        String update_sp = "{CALL sp_edit_user(?,?,?,?)}";
        try {
            CallableStatement callableStatement = connection.prepareCall(update_sp);
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
    public boolean deleteUserBySP(int id) {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        String updateSp = "{call sp_delete_user(?)}";
        try {
            CallableStatement callableStatement = connection.prepareCall(updateSp);
            callableStatement.setInt(1, 1);
            callableStatement.executeUpdate();
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public void deleteUserTransaction() throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        int rowEffect = 0;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_SQL);
            preparedStatement.setInt(1, 1);
            rowEffect += preparedStatement.executeUpdate();
            preparedStatement.setInt(1, 2);
            rowEffect += preparedStatement.executeUpdate();
            preparedStatement.setInt(1, 3);
            rowEffect += preparedStatement.executeUpdate();
            if (rowEffect == 3) {
                connection.commit();
            }
        } catch (SQLException e) {
            connection.rollback();
            throw new RuntimeException(e);
        }
    }
}
