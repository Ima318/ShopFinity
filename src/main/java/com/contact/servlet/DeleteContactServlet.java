package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteContactServlet")
public class DeleteContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            ContactDAO dao = new ContactDAO();
            dao.deleteContact(id);
            request.getSession().setAttribute("message", "Question deleted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error deleting question: " + e.getMessage());
        } finally {
            DBConnection.getInstance().closeConnection();
        }

        response.sendRedirect("contact.jsp");
    }
}
