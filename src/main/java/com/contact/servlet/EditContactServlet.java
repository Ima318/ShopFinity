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
import java.sql.Connection;

@WebServlet("/EditContactServlet")
public class EditContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBConnection.getInstance().getConnection()) {
            ContactDAO dao = new ContactDAO(conn);
            Contact contact = dao.getContactById(id);

            if (contact != null) {
                request.setAttribute("contact", contact);
                RequestDispatcher dispatcher = request.getRequestDispatcher("edit-contact.jsp");
                dispatcher.forward(request, response);
            } else {
                request.getSession().setAttribute("message", "Contact not found!");
                response.sendRedirect("contact.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error loading contact details: " + e.getMessage());
            response.sendRedirect("contact.jsp");
        }
    }
}
