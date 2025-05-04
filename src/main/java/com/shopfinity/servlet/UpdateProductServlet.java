package com.shopfinity.servlet;

import com.shopfinity.dao.ProductDAOFactory;
import com.shopfinity.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get product details from request
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String modelNumber = request.getParameter("modelNumber");
            String picture = request.getParameter("picture");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Create product object
            Product product = new Product(id, name, modelNumber, picture, price, description, quantity);
            
            // Check if model number already exists (excluding current product)
            if (ProductDAOFactory.getInstance().getUpdateDAO().isModelNumberExists(modelNumber, id)) {
                request.setAttribute("error", "Model number already exists!");
                request.setAttribute("product", product);
                request.getRequestDispatcher("edit_product.jsp").forward(request, response);
                return;
            }
            
            // Update product
            boolean success = ProductDAOFactory.getInstance().getUpdateDAO().updateProduct(product);
            
            if (success) {
                response.sendRedirect("list_products.jsp");
            } else {
                request.setAttribute("error", "Failed to update product!");
                request.setAttribute("product", product);
                request.getRequestDispatcher("edit_product.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("edit_product.jsp").forward(request, response);
        }
    }
} 