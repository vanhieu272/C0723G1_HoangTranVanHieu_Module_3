package com.example.mvc.repository;

import com.example.mvc.model.Product;

import java.util.List;

public interface IProductRepository {

    List<Product> getAll();

    void save(Product product);

    void update(Product product);

    void delete(int id);

    Product findById(int id);

    List<Product> findByName(String name);
}
