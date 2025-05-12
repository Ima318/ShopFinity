package com.register.dao;

import com.register.model.CartItem;
import com.register.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    // Method to get all items from the cart
    public static List<CartItem> getAllCartItems() throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM cart";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                // Create CartItem object and add to the list
                CartItem item = new CartItem(id, name, price, quantity);
                cartItems.add(item);
            }
        }

        return cartItems;
    }

    // Update quantity based on action (+1 or -1)
    public static void updateQuantity(int id, int delta) throws SQLException {
        String sql = "UPDATE cart SET quantity = GREATEST(quantity + ?, 0) WHERE id = ?";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, delta);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }
    }

}

