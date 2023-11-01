package com.example.mvc.service;

import com.example.mvc.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    void save(Product product);

    void update(Product product);

    void delete(int id);

    Product findById(int id);

    List<Product> findByName(String name);
}
