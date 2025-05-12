package com.register.model;

public class Order {
    private int orderId;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String postalCode;
    private String specialInstructions;
    private String preferredDeliveryTime;
    private double totalPrice;

    // Constructors
    public Order() {
    }

    public Order(int orderId, String name, String phone, String address, String email, String postalCode, String specialInstructions, String preferredDeliveryTime, double totalPrice) {
        this.orderId = orderId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.postalCode = postalCode;
        this.specialInstructions = specialInstructions;
        this.preferredDeliveryTime = preferredDeliveryTime;
        this.totalPrice = totalPrice;
    }

    public Order(String name, String phone, String address, String email, String postalCode, String specialInstructions, String preferredDeliveryTime, double totalPrice) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.postalCode = postalCode;
        this.specialInstructions = specialInstructions;
        this.preferredDeliveryTime = preferredDeliveryTime;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getSpecialInstructions() {
        return specialInstructions;
    }

    public void setSpecialInstructions(String specialInstructions) {
        this.specialInstructions = specialInstructions;
    }

    public String getPreferredDeliveryTime() {
        return preferredDeliveryTime;
    }

    public void setPreferredDeliveryTime(String preferredDeliveryTime) {
        this.preferredDeliveryTime = preferredDeliveryTime;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", postalCode='" + postalCode + '\'' +
                ", specialInstructions='" + specialInstructions + '\'' +
                ", preferredDeliveryTime='" + preferredDeliveryTime + '\'' +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
