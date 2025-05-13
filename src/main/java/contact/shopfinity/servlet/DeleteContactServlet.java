import contact.shopfinity.dao.ContactDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteContact")
public class DeleteContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("id"));

        // Delete the contact from the database
        ContactDAO dao = new ContactDAO((Connection) getServletContext().getAttribute("dbConnection"));
        dao.deleteContact(contactId);

        // Redirect back to the contact page after deletion
        response.sendRedirect("contact.jsp");
    }
}
