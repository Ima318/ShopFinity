package com.shopfinity.dao;

import com.shopfinity.model.Product;
import com.shopfinity.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateProductDAO {
    private static final String UPDATE_PRODUCT_SQL = 
        "UPDATE products SET name=?, model_number=?, picture=?, price=?, description=?, quantity=? WHERE id=?";
    
    public boolean updateProduct(Product product) throws SQLException {
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_PRODUCT_SQL)) {
            
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getModelNumber());
            pstmt.setString(3, product.getPicture());
            pstmt.setDouble(4, product.getPrice());
            pstmt.setString(5, product.getDescription());
            pstmt.setInt(6, product.getQuantity());
            pstmt.setInt(7, product.getId());
            
            return pstmt.executeUpdate() > 0;
        }
    }
    
    public boolean isModelNumberExists(String modelNumber, int excludeId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM products WHERE model_number = ? AND id != ?";
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, modelNumber);
            pstmt.setInt(2, excludeId);
            var rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }
} 