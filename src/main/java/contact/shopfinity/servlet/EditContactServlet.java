import contact.shopfinity.dao.ContactDAO;
import contact.shopfinity.model.Contact;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/editContact")
public class EditContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("id"));

        // Fetch the contact from the database
        ContactDAO dao = new ContactDAO((Connection) getServletContext().getAttribute("dbConnection"));
        Contact contact = dao.getContactById(contactId);

        // Set the contact object in the request scope for the form
        request.setAttribute("contact", contact);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editContact.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String question = request.getParameter("question");

        // Create Contact object
        Contact contact = new Contact();
        contact.setId(contactId);
        contact.setName(name);
        contact.setEmail(email);
        contact.setContactNumber(contactNumber);
        contact.setQuestion(question);

        // Update the contact in the database
        ContactDAO dao = new ContactDAO((Connection) getServletContext().getAttribute("dbConnection"));
        dao.updateContact(contact);

        // Redirect to contact page after update
        response.sendRedirect("contact.jsp");
    }
}
