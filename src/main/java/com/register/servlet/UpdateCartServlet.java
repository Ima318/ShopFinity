package com.register.servlet;

import com.register.dao.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        try {
            if ("increment".equals(action)) {
                CartDAO.updateQuantity(id, 1);
            } else if ("decrement".equals(action)) {
                CartDAO.updateQuantity(id, -1);
            }
            response.getWriter().println("Quantity updated successfully!");
        } catch (SQLException e) {
            response.getWriter().println("Error updating quantity: " + e.getMessage());
        }
    }
}

