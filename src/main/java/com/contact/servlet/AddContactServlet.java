package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.model.Contact;
import com.contact.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String question = request.getParameter("question");

        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setContactNumber(contactNumber);
        contact.setQuestion(question);

        Connection conn = null;
        try {
            conn = DBConnection.getInstance().getConnection();
            if (conn != null) {
                ContactDAO dao = new ContactDAO(conn);
                dao.addContact(contact);
                request.getSession().setAttribute("message", "Your question has been submitted successfully!");
            } else {
                request.getSession().setAttribute("message", "Database connection is not available.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error submitting your question: " + e.getMessage());
        } finally {
            DBConnection.getInstance().closeConnection();
        }

        response.sendRedirect("contact.jsp");
    }
}
