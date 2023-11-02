package com.example.ss12mvc.controller;

import com.example.ss12mvc.model.User;
import com.example.ss12mvc.service.IUserService;
import com.example.ss12mvc.service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAddForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteForm(req, resp);
                break;
            case "search":
                searchByCountry(req,resp);
                break;
            case "order":
                orderByName(req,resp);
                break;
            case "test-without-tran":
                testWithoutTran(req, resp);
                break;
            case "test-use-tran":
                testUseTran(req, resp);
                break;
            default:
//                showAll(req, resp);
                showAllBySP(req,resp);
                break;
        }
    }

    private void showAllBySP(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.getAllUsersBySP();
        req.setAttribute("userList", userList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("view/user/list.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void testUseTran(HttpServletRequest req, HttpServletResponse resp) {
        userService.insertUpdateUseTransaction();
    }

    private void testWithoutTran(HttpServletRequest req, HttpServletResponse resp) {
        userService.insertUpdateWithoutTransaction();
    }

    private void orderByName(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.orderByName();
        req.setAttribute("userList", userList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/user/list.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        List<User> userList = userService.searchByCountry(country);
        req.setAttribute("userList", userList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/user/list.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUser(id);
        RequestDispatcher dispatcher;
        req.setAttribute("user", user);
        dispatcher = req.getRequestDispatcher("/view/user/delete.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUser(id);
        req.setAttribute("user", user);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/edit.jsp");

        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/create.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.selectAllUsers();
        try {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/list.jsp");
            req.setAttribute("userList", userList);
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(req, resp);
                break;
            case "edit":
//                editUser(req, resp);
                editUserBySP(req,resp);
                break;
            case "delete":
//                deleteUser(req, resp);
                deleteUserBySP(req,resp);
                break;

        }
    }

    private void deleteUserBySP(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userService.deleteUserBySP(id);
        resp.sendRedirect("/user");
    }

    private void editUserBySP(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(id, name, email, country);
        userService.updateUserBySP(user);
        resp.sendRedirect("/user");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUser(id);
        try {
            userService.deleteUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            resp.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(id, name, email, country);
        try {
            userService.updateUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            resp.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");

        User user = new User(name, email, country);
        try {
            userService.insertUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        resp.sendRedirect("/user");
    }
}
