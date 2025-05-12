<%@ page import="com.shopfinity.dao.ReadProductDAO" %>
<%@ page import="com.shopfinity.model.Product" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Product Details</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/product_details.css"/>

  <style>
    body { margin: 0; font-family: Arial, sans-serif; }
    .navbar { display: flex; align-items: center; justify-content: space-between; background-color: #4b2a7b
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
<main class="product-page">
  <%
    int productId = Integer.parseInt(request.getParameter("id"));
    ReadProductDAO productDAO = new ReadProductDAO();
    Product product = null;

    try {
      product = productDAO.getProductById(productId);
    } catch (SQLException e) {
      System.out.println("<p>Error fetching product details: " + e.getMessage() + "</p>");
    }

    if (product != null) {
  %>
  <div class="image-section">
    <img src="images/<%= product.getPicture() %>" alt="<%= product.getName() %>" class="product-image"/>
  </div>
  <div class="details-section">
    <p class="brand">Brand: <a href="#">ShopFinity</a></p>
    <h1><%= product.getName() %></h1>
    <p class="model-number">Model Number: <%= product.getModelNumber() %></p>
    <p class="price">Price: Rs. <%= product.getPrice() %></p>
    <p class="description"><%= product.getDescription() %></p>
    <p class="stock-status"><%= product.getQuantity() > 0 ? "✅ In Stock" : "❌ Out of Stock" %></p>
    <form action="addToCart" method="POST">
      <input type="hidden" name="id" value="<%= product.getId() %>" />
      <button type="submit" class="add-to-cart">🛒 Add to Cart</button>
    </form>


  </div>
  <%
  } else {
  %>
  <p>Product not found!</p>
  <% } %>
</main>

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
