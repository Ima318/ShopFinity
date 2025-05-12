package com.register.servlet;

import com.register.dao.OrderDAO;
import com.register.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.shopfinity.util.DBConnection;

import java.io.IOException;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("postalCode");
        String specialInstructions = request.getParameter("specialInstructions");
        String preferredDeliveryTime = request.getParameter("preferredDeliveryTime");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        Order order = new Order(0, name, phone, address, email,postalCode, specialInstructions, preferredDeliveryTime, totalPrice);

        try {
            OrderDAO.createOrder(order);
            response.sendRedirect("checkout.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error placing order: " + e.getMessage());
        }
    }
}
