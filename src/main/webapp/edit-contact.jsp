<%@ page import="com.contact.model.Contact" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Contact</title>
    <link rel="stylesheet" href="./css/contactus.css">
</head>z
<body>
<div class="contact-section">
    <h2>Edit Your Question</h2>
    <%
        Contact contact = (Contact) request.getAttribute("contact");
        if (contact == null) {
    %>
    <div class="message error">Contact not found.</div>
    <% } else { %>
    <form action="EditContactServlet" method="post">
        <input type="hidden" name="id" value="<%= contact.getId() %>" />

        <label for="name">Your Name</label>
        <input type="text" id="name" name="name"
               value="<%= contact.getName() %>" required />

        <label for="email">Your Email</label>
        <input type="email" id="email" name="email"
               value="<%= contact.getEmail() %>" required />

        <label for="contactNumber">Your Contact Number</label>
        <input type="text" id="contactNumber" name="contactNumber"
               value="<%= contact.getContactNumber() %>"
               required pattern="^[0-9]{10}$"
               title="Enter a valid 10-digit number" />

        <label for="question">Your Question</label>
        <textarea id="question" name="question" rows="4" required><%= contact.getQuestion() %></textarea>

        <button type="submit">Update Question</button>
    </form>
    <% } %>
</div>
</body>
</html>
