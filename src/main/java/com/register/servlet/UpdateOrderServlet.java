package com.register.servlet;

import com.register.dao.OrderDAO;
import com.register.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            Order order = OrderDAO.getOrderById(orderId);
            request.setAttribute("order", order);
            request.getRequestDispatcher("updateOrder.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error fetching order: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String postalCode = request.getParameter("postalCode");
        String specialInstructions = request.getParameter("specialInstructions");
        String preferredDeliveryTime = request.getParameter("preferredDeliveryTime");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        Order updatedOrder = new Order(orderId, name, phone, address, email,postalCode, specialInstructions, preferredDeliveryTime, totalPrice);

        try {
            OrderDAO.updateOrder(updatedOrder);
            response.sendRedirect("checkout.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating order: " + e.getMessage());
        }
    }
}
