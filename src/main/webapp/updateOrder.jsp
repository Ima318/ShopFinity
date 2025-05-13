<%--
  Created by IntelliJ IDEA.
  User: Tharini
  Date: 5/10/2025
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.register.model.Order" %>
<%
  Order order = (Order) request.getAttribute("order");
%>

<html>
<head>
  <title>Update Order</title>
  <link rel="stylesheet" href="./css/update_order.css">


</head>
<body>

<div class="container">
  <h2>Update Order Form</h2>
  <form action="UpdateOrderServlet" method="post" class="update-form">
    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= order.getName() %>" required>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" value="<%= order.getPhone() %>" required>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="<%= order.getAddress() %>" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= order.getEmail() %>" required>

    <!-- New Fields -->
    <label for="postalCode">Postal Code:</label>
    <input type="text" id="postalCode" name="postalCode" value="<%= order.getPostalCode() %>" required>

    <label for="specialInstructions">Special Instructions:</label>
    <input type="text" id="specialInstructions" name="specialInstructions" value="<%= order.getSpecialInstructions() %>">

    <label for="preferredDeliveryTime">Preferred Delivery Time:</label>
    <input type="text" id="preferredDeliveryTime" name="preferredDeliveryTime" value="<%= order.getPreferredDeliveryTime() %>">

    <label for="totalPrice">Total Price:</label>
    <input type="number" id="totalPrice" name="totalPrice" value="<%= order.getTotalPrice() %>" required>

    <button type="submit" class="submit-btn">Update Order</button>
  </form>
</div>
</body>
</html>
