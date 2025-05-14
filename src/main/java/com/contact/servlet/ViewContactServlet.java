package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.model.Contact;
import com.contact.util.DBConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class ViewContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getInstance().getConnection();
            ContactDAO dao = new ContactDAO(conn);
            List<Contact> contacts = dao.getAllContacts();

            request.setAttribute("contacts", contacts);
            RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
