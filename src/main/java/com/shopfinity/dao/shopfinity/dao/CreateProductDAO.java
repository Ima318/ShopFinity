package com.shopfinity.dao.shopfinity.dao;

import com.shopfinity.dao.shopfinity.model.Product;
import com.shopfinity.dao.shopfinity.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateProductDAO {
    private static final String INSERT_PRODUCT_SQL = 
        "INSERT INTO products (name, model_number, picture, price, description, quantity) VALUES (?, ?, ?, ?, ?, ?)";
    
    public boolean createProduct(Product product) throws SQLException {
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {
            
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getModelNumber());
            pstmt.setString(3, product.getPicture());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setString(5, product.getDescription());
            pstmt.setInt(6, product.getQuantity());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean isModelNumberExists(String modelNumber) throws SQLException {
        String sql = "SELECT COUNT(*) FROM products WHERE model_number = ?";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, modelNumber);
            var rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }
} 