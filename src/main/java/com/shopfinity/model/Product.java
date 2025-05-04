package com.shopfinity.model;

public class Product {
    private int id;
    private String name;
    private String modelNumber;
    private String picture;
    private double price;
    private String description;
    private int quantity;

    // Default constructor
    public Product() {
    }

    // Constructor with all fields
    public Product(int id, String name, String modelNumber, String picture, double price, String description, int quantity) {
        this.id = id;
        this.name = name;
        this.modelNumber = modelNumber;
        this.picture = picture;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }

    // Constructor without id (for new products)
    public Product(String name, String modelNumber, String picture, double price, String description, int quantity) {
        this.name = name;
        this.modelNumber = modelNumber;
        this.picture = picture;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
} 