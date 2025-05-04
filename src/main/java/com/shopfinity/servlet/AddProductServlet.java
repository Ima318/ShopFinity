package com.shopfinity.servlet;

import com.shopfinity.dao.ProductDAOFactory;
import com.shopfinity.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get product details from request
            String name = request.getParameter("name");
            String modelNumber = request.getParameter("modelNumber");
            String picture = request.getParameter("picture");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Check if model number already exists
            if (ProductDAOFactory.getInstance().getCreateDAO().isModelNumberExists(modelNumber)) {
                request.setAttribute("error", "Model number already exists!");
                request.getRequestDispatcher("add_product.jsp").forward(request, response);
                return;
            }
            
            // Create product object
            Product product = new Product(name, modelNumber, picture, price, description, quantity);
            
            // Add product
            boolean success = ProductDAOFactory.getInstance().getCreateDAO().createProduct(product);
            
            if (success) {
                response.sendRedirect("list_products.jsp");
            } else {
                request.setAttribute("error", "Failed to add product!");
                request.getRequestDispatcher("add_product.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("add_product.jsp").forward(request, response);
        }
    }
} 