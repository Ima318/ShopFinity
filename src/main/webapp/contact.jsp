<%@ page import="com.contact.dao.ContactDAO" %>
<%@ page import="com.contact.model.Contact" %>
<%@ page import="java.util.List" %>
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
        <img class="faq-img" src="./Images/f.png" alt="FAQ Illustration">
    </div>

    <div class="faqbox">
        <!-- Example FAQ Item -->
        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-1">
            <label class="faq-title" for="faq-trigger-1">What is your return and refund policy?</label>
            <div class="faq-detail">
                <p>
                    We offer a 30-day return policy on most items. Please visit our Returns page for more details on how to initiate a return.
                </p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-2">
            <label class="faq-title" for="faq-trigger-2">Do you ship internationally?</label>
            <div class="faq-detail">
                <p>Yes, we ship to most countries. Shipping fees and delivery times vary by location.
                   </p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-3">
            <label class="faq-title" for="faq-trigger-3">How long does shipping take?</label>
            <div class="faq-detail">
                <p>Delivery times vary depending on your location and the shipping method chosen at checkout. Typically, orders arrive within 3-7 business days.</p>
            </div>
        </div>

        <div class="faq-wrapper">
            <input type="checkbox" class="faq-trigger" id="faq-trigger-4">
            <label class="faq-title" for="faq-trigger-4">Can I change or cancel my order?</label>
            <div class="faq-detail">
                <p>You can change or cancel your order within a limited time after purchase. Please contact our support team as soon as possible.</p>
            </div>
        </div>




    </div>
</div>

<!-- Contact Us Form Section -->
<div class="contact-section">
    <h2 style="color: purple; font-size: 36px; margin-bottom: 20px;">Got More Questions? </h2>

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
    <h2 style="color: purple; font-size: 36px; margin-bottom: 20px;">Some More of Your Questions!</h2>
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
                ContactDAO dao = new ContactDAO();
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