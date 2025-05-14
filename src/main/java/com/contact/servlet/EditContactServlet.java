package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.model.Contact;
import com.register.util.DBConnection;
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

        try {
            Connection conn = DBConnection.getInstance().getConnection();
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
            request.getSession().setAttribute("message", "Error loading contact details!");
            response.sendRedirect("contact.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String question = request.getParameter("question");

        Contact contact = new Contact();
        contact.setId(id);
        contact.setName(name);
        contact.setEmail(email);
        contact.setContactNumber(contactNumber);
        contact.setQuestion(question);

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            ContactDAO dao = new ContactDAO(conn);
            dao.updateContact(contact);
            request.getSession().setAttribute("message", "Question updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error updating question!");
        }

        response.sendRedirect("contact.jsp");
    }
}
