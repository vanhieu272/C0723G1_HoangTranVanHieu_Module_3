package com.example.mvc.controller;


import com.example.mvc.model.Product;
import com.example.mvc.service.IProductService;
import com.example.mvc.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteForm(req, resp);
                break;
            case "detail":
                showDetailProduct(req, resp);
            case "search":
                searchProduct(req, resp);
            default:
                listProduct(req, resp);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.showDetail(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.showDetail(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("view/product/delete.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDetailProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.showDetail(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("view/product/detail.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> productList = productService.findByName(name);
        RequestDispatcher requestDispatcher;
        if (productList == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            request.setAttribute("name", name);
            request.setAttribute("productList", productList);
            requestDispatcher = request.getRequestDispatcher("view/product/search.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.getAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
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
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        int id = (int) (Math.random() * 10000);
        Product product = new Product(id, name, price, description, producer);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/create.jsp");
        request.setAttribute("mess", "Added Success");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = this.productService.showDetail(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setProducer(producer);
            this.productService.update(product);
            request.setAttribute("product", product);
            request.setAttribute("mess", "Edited Success!!");
            requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.showDetail(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            productService.delete(id);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
