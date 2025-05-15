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

@WebServlet("/EditContactServlet")
public class EditContactServlet extends HttpServlet {
    // Show edit form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            ContactDAO dao = new ContactDAO();
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

    // Process update
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            ContactDAO dao = new ContactDAO();
            dao.updateContact(contact);
            request.getSession().setAttribute("message", "Your question has been updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error updating your question: " + e.getMessage());
        } finally {
            DBConnection.getInstance().closeConnection();
        }

        response.sendRedirect("contact.jsp");
    }
}
