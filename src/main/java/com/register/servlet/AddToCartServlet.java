package com.register.servlet;

import com.shopfinity.dao.ReadProductDAO;
import com.shopfinity.model.Product;
import com.shopfinity.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product ID from request
        String productId = request.getParameter("id");

        ReadProductDAO productDAO = new ReadProductDAO();

        try {
            // Get product details using the ID
            Product product = productDAO.getProductById(Integer.parseInt(productId));

            if (product != null) {
                // Add to cart if the product exists
                addToCart(product);
                response.sendRedirect("cart.jsp");
            } else {
                response.getWriter().println("Product not found.");
            }
        } catch (SQLException e) {
            response.getWriter().println("Error adding product to cart: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid product ID.");
        }
    }

    private void addToCart(Product product) throws SQLException {
        // SQL to insert or update cart item
        String sql = "INSERT INTO cart (id, name, price, quantity) VALUES (?, ?, ?, ?) "
                + "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";

        try (Connection conn = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters for the SQL statement
            stmt.setString(1, String.valueOf(product.getId()));
            stmt.setString(2, product.getName());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, 1);  // Default quantity is 1

            // Execute the update
            stmt.executeUpdate();
        }
    }
}
