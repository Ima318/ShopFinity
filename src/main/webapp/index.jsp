<%@ page import="com.shopfinity.dao.ReadProductDAO" %>
<%@ page import="com.shopfinity.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShopFinity - Home</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; }
        .navbar { display: flex; align-items: center; justify-content: space-between;
            background: #370852;
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

<!--<div class="header">
    <h1>ShopFinity</h1>
</div>-->

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



<div class="banner">

    <div class="banner-text">
        <h1 style="font-size: 55px;">Welcome  </h1><br>
        <h1 style="font-size: 55px;">to ShopFinity</h1>
        <p>Your one-stop destination for all your shopping needs. From daily essentials to luxury products,
            we bring you the best deals, fast delivery, and trusted service.
            Start your seamless shopping experience with us today!</p>
    </div>

    <div class="banner-image">
        <img src="./Images/s1.jpg" alt="Shopping Banner">
    </div>
</div>

<div class="products-section">
    <h2>All Products</h2>
    <div class="product-grid">
        <%
            ReadProductDAO productDAO = new ReadProductDAO();
            List<Product> products = null;

            try {
                products = productDAO.getAllProducts();
            } catch (SQLException e) {
                System.out.println("<p>Error fetching products: " + e.getMessage() + "</p>");
            }

            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="product-card">
            <!-- Clickable link to product details page -->
            <a href="product_details.jsp?id=<%= product.getId() %>" style="text-decoration: none; color: inherit;">
                <img src="images/<%= product.getPicture() %>" alt="<%= product.getName() %>" />
                <h3><%= product.getName() %></h3>
                <p>Model: <%= product.getModelNumber() %></p>
                <p>Price: Rs. <%= product.getPrice() %></p>
                <p>Stock: <%= product.getQuantity() %> pcs</p>
            </a>
        </div>
        <%
            }
        } else {
        %>
        <p>No products available at the moment.</p>
        <% } %>
    </div>
</div>
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
