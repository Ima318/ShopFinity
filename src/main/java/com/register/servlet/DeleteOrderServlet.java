package com.register.servlet;

import com.register.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            OrderDAO.deleteOrder(orderId);
            response.sendRedirect("checkout.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting order: " + e.getMessage());
        }
    }
}
