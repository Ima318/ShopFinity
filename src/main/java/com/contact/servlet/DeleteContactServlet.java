package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.contact.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/DeleteContactServlet")
public class DeleteContactServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        try {
            conn = DBConnection.getInstance().getConnection();
            if (conn != null) {
                ContactDAO dao = new ContactDAO(conn);
                dao.deleteContact(id);
                request.getSession().setAttribute("message", "Question deleted successfully!");
            } else {
                request.getSession().setAttribute("message", "Database connection is not available.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error deleting question: " + e.getMessage());
        } finally {
            DBConnection.getInstance().closeConnection();
        }

        response.sendRedirect("contact.jsp");
    }
}
