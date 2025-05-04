package com.shopfinity.dao;

import com.shopfinity.model.Product;
import com.shopfinity.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReadProductDAO {
    private static final String GET_ALL_PRODUCTS_SQL = "SELECT * FROM products";
    private static final String GET_PRODUCT_BY_ID_SQL = "SELECT * FROM products WHERE id = ?";
    
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DBConnection.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(GET_ALL_PRODUCTS_SQL)) {
            
            while (rs.next()) {
                products.add(extractProductFromResultSet(rs));
            }
        }
        return products;
    }
    
    public Product getProductById(int id) throws SQLException {
        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(GET_PRODUCT_BY_ID_SQL)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractProductFromResultSet(rs);
            }
        }
        return null;
    }
    
    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        return new Product(
            rs.getInt("id"),
            rs.getString("name"),
            rs.getString("model_number"),
            rs.getString("picture"),
            rs.getDouble("price"),
            rs.getString("description"),
            rs.getInt("quantity")
        );
    }
} 