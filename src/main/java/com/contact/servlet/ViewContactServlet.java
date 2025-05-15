package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.model.Contact;
import com.contact.util.DBConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewContactServlet")
public class ViewContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ContactDAO dao = new ContactDAO();
            List<Contact> contacts = dao.getAllContacts();

            request.setAttribute("contacts", contacts);
            RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error fetching contacts: " + e.getMessage());
            response.sendRedirect("contact.jsp");
        }
    }
}
