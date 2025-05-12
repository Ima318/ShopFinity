package com.register.dao;

import com.register.model.Order;
import com.register.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public static boolean createOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (name, phone, address, email, postal_code, special_instructions, preferred_delivery_time, total_price) VALUES ( ?, ?, ?, ?, ?, ?, ?,?)";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, order.getName());
            stmt.setString(2, order.getPhone());
            stmt.setString(3, order.getAddress());
            stmt.setString(4, order.getEmail());

            stmt.setString(5, order.getPostalCode());
            stmt.setString(6, order.getSpecialInstructions());
            stmt.setString(7, order.getPreferredDeliveryTime());

            stmt.setDouble(8, order.getTotalPrice());
            return stmt.executeUpdate() > 0;
        }
    }

    public static List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try (Connection conn = DBConnection.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("order_id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("postal_code"),
                        rs.getString("special_instructions"),
                        rs.getString("preferred_delivery_time"),
                        rs.getDouble("total_price")
                );
                orders.add(order);
            }
        }
        return orders;
    }

    public static Order getOrderById(int orderId) throws SQLException {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Order(
                        rs.getInt("order_id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("postal_code"),
                        rs.getString("special_instructions"),
                        rs.getString("preferred_delivery_time"),

                        rs.getDouble("total_price")
                );
            }
        }
        return null;
    }

    public static boolean updateOrder(Order order) throws SQLException {
        String sql = "UPDATE orders SET name=?, phone=?, address=?, email=?, postal_code=?, special_instructions=?, preferred_delivery_time=?, total_price=? WHERE order_id=?";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, order.getName());
            stmt.setString(2, order.getPhone());
            stmt.setString(3, order.getAddress());
            stmt.setString(4, order.getEmail());

            stmt.setString(5, order.getPostalCode());
            stmt.setString(6, order.getSpecialInstructions());
            stmt.setString(7, order.getPreferredDeliveryTime());

            stmt.setDouble(8, order.getTotalPrice());
            stmt.setInt(9, order.getOrderId());
            return stmt.executeUpdate() > 0;
        }
    }

    public static boolean deleteOrder(int orderId) throws SQLException {
        String sql = "DELETE FROM orders WHERE order_id=?";
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            return stmt.executeUpdate() > 0;
        }
    }
}
