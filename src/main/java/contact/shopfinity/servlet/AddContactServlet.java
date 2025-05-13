import contact.shopfinity.dao.ContactDAO;
import contact.shopfinity.model.Contact;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String question = request.getParameter("question");

        // Create Contact object
        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setContactNumber(contactNumber);
        contact.setQuestion(question);

        // Save contact to database
        ContactDAO dao = new ContactDAO((Connection) getServletContext().getAttribute("dbConnection"));
        dao.addContact(contact);

        // Redirect to contact page after submission
        response.sendRedirect("contact.jsp");
    }
}
