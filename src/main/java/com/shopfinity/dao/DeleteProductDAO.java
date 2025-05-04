package com.shopfinity.dao;

import com.shopfinity.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProductDAO {
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM products WHERE id = ?";
    
    public boolean deleteProduct(int id) throws SQLException {
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(DELETE_PRODUCT_SQL)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        }
    }
} 