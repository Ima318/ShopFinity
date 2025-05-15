<%@ page import="com.contact.dao.ContactDAO" %>
<%@ page import="com.contact.model.Contact" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ & Contact</title>

    <!-- Fixed CSS Path -->
    <link rel="stylesheet" href="./css/contactus.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<!-- Header for FAQ Section -->
<div class="header2">
    <h1 class="header2-title">FAQ</h1>
    <h3 class="header2-descript">Frequently Asked Questions</h3>
    <div class="search">
        <input type="text" placeholder="Search...">
        <button>Search</button>
    </div>
</div>

<!-- FAQ Content -->
<div class="faq">
    <div class="faq-name">
        <h1 class="faq-header">Have <br> Questions?</h1>
        <img class="faq-img" src="images/faq.webp" alt="FAQ Illustration">
    </div>

    <div class="faqbox">
        <!-- Example FAQ Item -->
        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-1">
            <label class="faq-title" for="faq-trigger-1">How far in advance should I book my trip?</label>
            <div class="faq-detail">
                <p>
                    Booking at least one month in advance is recommended as packages often get reserved early.
                </p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-2">
            <label class="faq-title" for="faq-trigger-2">How to book a trip?</label>
            <div class="faq-detail">
                <p>
                    Register or log in, visit the packages page, choose a package, and proceed to payment.
                </p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-3">
            <label class="faq-title" for="faq-trigger-3">Are there any age restrictions?</label>
            <div class="faq-detail">
                <p>
                    Minors under 18 must be accompanied by a parent or guardian who signs a responsibility agreement.
                </p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-4">
            <label class="faq-title" for="faq-trigger-4">What safety measures are in place?</label>
            <div class="faq-detail">
                <p>
                    Safety kits are provided, and trained staff are present during the entire trip.
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Contact Us Form Section -->
<div class="contact-section">
    <h2 style="color: rgb(2, 119, 187); font-size: 36px; margin-bottom: 20px;">Got More Questions? </h2>

    <!-- Display success/error message -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <div class="message"><%= message %></div>
    <% } %>

    <form action="AddContactServlet" method="post">
        <label for="name">Your Name</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Your Email</label>
        <input type="email" id="email" name="email" required>

        <label for="contactNumber">Your Contact Number</label>
        <input type="text" id="contactNumber" name="contactNumber" required pattern="^[0-9]{10}$" title="Enter a valid 10-digit number">

        <label for="question">Your Question</label>
        <textarea id="question" name="question" rows="4" required></textarea>

        <button type="submit">Submit Question</button>
    </form>
</div>

<!-- Displaying User Questions -->
<div class="contact-section">
    <h2 style="color: rgb(2, 119, 187); font-size: 36px; margin-bottom: 20px;">Some More of Your Questions!</h2>
    <table class="question-table">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Contact Number</th>
            <th>Question</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                ContactDAO dao = new ContactDAO((Connection) application.getAttribute("dbConnection"));
                List<Contact> contacts = dao.getAllContacts();
                for (Contact c : contacts) {
        %>
        <tr>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getContactNumber() %></td>
            <td><%= c.getQuestion() %></td>
            <td>
                <a href="EditContactServlet?id=<%= c.getId() %>" class="btn">Edit</a>
                <a href="DeleteContactServlet?id=<%= c.getId() %>" class="btn" onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
        %>
        <tr><td colspan="5">Error fetching contacts: <%= e.getMessage() %></td></tr>
        <% } %>
    </table>
</div>

</body>
</html>
