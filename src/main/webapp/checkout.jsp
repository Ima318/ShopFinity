<%-- checkout.jsp --%>
<%@ page import="com.register.dao.CartDAO" %>
<%@ page import="com.register.dao.OrderDAO" %>
<%@ page import="com.register.model.CartItem" %>
<%@ page import="com.register.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
  <title>Checkout</title>
  <!-- Linking the external CSS file -->
  <link rel="stylesheet" type="text/css" href="./css/checkout.css">
  <script>
    function validateForm() {
      let name = document.forms["orderForm"]["name"].value;
      let phone = document.forms["orderForm"]["phone"].value;
      let email = document.forms["orderForm"]["email"].value;
      let postalCode = document.forms["orderForm"]["postalCode"].value;
      let deliveryTime = document.forms["orderForm"]["preferredDeliveryTime"].value;

      if (!/^[A-Za-z\s]+$/.test(name)) {
        alert("Name must contain only letters and spaces.");
        return false;
      }

      if (!/^\d{10}$/.test(phone)) {
        alert("Phone number must be exactly 10 digits.");
        return false;
      }

      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        alert("Please enter a valid email address.");
        return false;
      }

      if (!/^\d{5}$/.test(postalCode)) {
        alert("Postal Code must be exactly 5 digits.");
        return false;
      }

      if (!/^([01]\d|2[0-3]):[0-5]\d$/.test(deliveryTime)) {
        alert("Preferred Delivery Time must be in HH:MM format (24-hour clock).");
        return false;
      }

      return true;
    }
  </script>

  <style>
    body { margin: 0; font-family: Arial, sans-serif; }
    .navbar { display: flex; align-items: center; justify-content: space-between; background: #370852;
      background: linear-gradient(90deg, rgba(55, 8, 82, 1) 0%, rgba(137, 20, 196, 1) 79%, rgba(237, 83, 204, 1) 100%);
    ; padding: 10px 20px; color: white; }
    .logo { font-size: 30px; font-weight: bold;height: 70px }
    .logo span { color: #ffdb4d; }
    .search-box { display: flex; align-items: center; background-color: white; border-radius: 20px; }
    .search-box input { border: none; padding: 8px 15px; border-radius: 20px 0 0 20px; outline: none; width: 300px; }
    .search-box button { background-color: #ffffff; border: none; padding: 8px 12px; border-radius: 0 20px 20px 0; cursor: pointer; }
    .search-box button i { color: #4b2a7b; }
    .nav-icons { display: flex; gap: 20px; align-items: center; }
    .nav-icons i { font-size: 20px; cursor: pointer; }
    .nav-icons .language { margin-right: 5px;}
  </style>
  <link rel="stylesheet" type="text/css" href="./homepage.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="navbar">
  <div class="logo">Shop<span>F</span>inity</div>
  <div class="search-box">
    <input type="text" placeholder="SEARCH THE ENTIRE STORE...">
    <button><i class="fas fa-search"></i></button>
  </div>
  <div class="nav-icons">
    <div class="language">Eng <i class="fas fa-chevron-down"></i></div>
    <a href="index.jsp" title="Go to Home" class="nav-link">Home</a>
    <a href="cart.jsp" title="View Cart" class="nav-link">Cart</a>
    <a href="/profile.jsp" title="View Profile" class="nav-link">Profile</a>
  </div>

</div>
<h1 class="page-title">Checkout</h1>

<%
  double totalAmount = 0;
  try {
    List<CartItem> cartItems = CartDAO.getAllCartItems();
    for (CartItem item : cartItems) {
      totalAmount += item.getTotalPrice();
    }
  } catch (SQLException e) {
    System.out.println("Error calculating total amount: " + e.getMessage());
  }
%>

<div class="form-container">
  <form name="orderForm" action="OrderServlet" method="post" onsubmit="return validateForm()">
    <h3>Total Amount: Rs. <%= totalAmount %></h3>
    <input type="hidden" name="totalPrice" value="<%= totalAmount %>">
    <label>Name
      <input type="text" name="name" placeholder="Full Name" required>
    </label>
    <label>Contact Number
      <input type="text" name="phone" placeholder="1234567890" required>
    </label>
    <label>Address
      <input type="text" name="address" placeholder="Address" required>
    </label>
    <label>Email
      <input type="email" name="email" placeholder="someone@gmail.com" required>
    </label>
    <label>Postal Code
      <input type="text" name="postalCode" placeholder="12345" required>
    </label>
    <label>Preferred Delivery Time (HH:MM)
      <input type="text" name="preferredDeliveryTime" placeholder="14:30">
    </label>
    <button type="submit" class="btn">Place Order (Cash on Delivery)</button>
  </form>
</div>

<h3 class="page-title">Order Details</h3>
<table class="order-list">
  <tr>
    <th>Order ID</th>
    <th>Name</th>
    <th>Phone</th>
    <th>Address</th>
    <th>Email</th>
    <th>Postal Code</th>
    <th>Special Instructions</th>
    <th>Preferred Delivery Time</th>
    <th>Total Price</th>
    <th>Actions</th>
  </tr>
  <%
    try {
      List<Order> orders = OrderDAO.getAllOrders();
      for (Order order : orders) {
  %>
  <tr>
    <td><%= order.getOrderId() %></td>
    <td><%= order.getName() %></td>
    <td><%= order.getPhone() %></td>
    <td><%= order.getAddress() %></td>
    <td><%= order.getEmail() %></td>
    <td><%= order.getPostalCode() %></td>
    <td><%= order.getSpecialInstructions() %></td>
    <td><%= order.getPreferredDeliveryTime() %></td>
    <td>Rs. <%= order.getTotalPrice() %></td>
    <td class="action-buttons">
      <form action="UpdateOrderServlet" method="get" style="display:inline;">
        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
        <button type="submit">Edit</button>
      </form>
      <form action="DeleteOrderServlet" method="post" style="display:inline;">
        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
        <button type="submit">Delete</button>
      </form>
    </td>
  </tr>
  <%
      }
    } catch (SQLException e) {
      System.out.println("Error fetching orders: " + e.getMessage());
    }
  %>
</table>

<div class="footer">
  <div class="footer-content">
    <div class="footer-section">
      <h3>ShopFinity</h3>
      <p>Best online store for all your needs. Safe & trusted.</p>
    </div>
    <div class="footer-section">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="./index.jsp">Home</a></li>
        <li><a href="#">Register</a></li>
        <li><a href="#">Login</a></li>
      </ul>
    </div>
    <div class="footer-section">
      <h4>Contact</h4>
      <p>Email: info@shopfinity.com</p>
      <p>Phone: +94 77 123 4567</p>
      <p>Address: Colombo, Sri Lanka</p>
    </div>
  </div>
  <div class="footer-bottom">
    &copy; 2025 ShopFinity. All Rights Reserved.
  </div>
</div>

</body>
</html>
