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
</head>
<body>
<h2>Update Order</h2>
<form action="UpdateOrderServlet" method="post">
  <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
  Name: <input type="text" name="name" value="<%= order.getName() %>" required><br>
  Phone: <input type="text" name="phone" value="<%= order.getPhone() %>" required><br>
  Address: <input type="text" name="address" value="<%= order.getAddress() %>" required><br>
  Email: <input type="email" name="email" value="<%= order.getEmail() %>" required><br>

  <!-- New Fields -->
  Postal Code: <input type="text" name="postalCode" value="<%= order.getPostalCode() %>" required><br>
  Special Instructions: <input type="text" name="specialInstructions" value="<%= order.getSpecialInstructions() %>"><br>
  Preferred Delivery Time: <input type="text" name="preferredDeliveryTime" value="<%= order.getPreferredDeliveryTime() %>"><br>

  Total Price: <input type="number" name="totalPrice" value="<%= order.getTotalPrice() %>" required><br>
  <button type="submit">Update Order</button>
</form>
</body>
</html>

