package com.contact.servlet;

import com.contact.dao.ContactDAO;
import com.register.util.DBConnection;
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

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            ContactDAO dao = new ContactDAO(conn);
            dao.deleteContact(id);
            request.getSession().setAttribute("message", "Question deleted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error deleting question!");
        }

        response.sendRedirect("contact.jsp");
    }
}
