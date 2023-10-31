package com.example.mvc.repository.impl;

import com.example.mvc.model.Product;
import com.example.mvc.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Sach", 10000, "Sach ngu van", "NXB Giao duc"));
        productList.add(new Product(2, "Vo", 10000, "Sach ngu van", "NXB Giao duc"));
        productList.add(new Product(3, "But", 10000, "Sach ngu van", "NXB Giao duc"));
        productList.add(new Product(4, "Thuoc", 10000, "Sach ngu van", "NXB Giao duc"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void update(Product product) {
        for (Product product1 : productList) {
            if (product1.getId() == product.getId()) {
                product1.setName(product.getName());
                product1.setPrice(product.getPrice());
                product1.setDescription(product.getDescription());
                product1.setProducer(product.getProducer());
            }
        }
    }

    @Override
    public void delete(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                productList.remove(product);
                break;
            }
        }
    }

    @Override
    public Product showDetail(int id) {
        for (Product product1 : productList){
            if(product1.getId() == id){
                return product1;
            }
        }
        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for(Product product : productList){
            if(product.getName().contains(name)){
                products.add(product);
            }
        }
        return products;
    }
}
