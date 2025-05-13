<%@ page import="com.register.dao.CartDAO" %>
<%@ page import="com.register.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Shopping Cart</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="./css/cart.css">
    <script>
        function updateQuantity(id, action) {
            fetch('UpdateCartServlet?id=' + id + '&action=' + action, {
                method: 'POST'
            }).then(() => {
                location.reload();
            });
        }

        function deleteItem(id) {
            if (confirm("Are you sure you want to remove this item from the cart?")) {
                fetch('DeleteFromCartServlet?id=' + id, {
                    method: 'POST'
                }).then(() => {
                    location.reload();
                });
            }
        }
    </script>
</head>

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
<link rel="stylesheet" type="text/css" href="./css/cart.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<body>

<div class="navbar">
    <div class="logo"><span>S</span>hop<span>F</span>inity</div>
    <div class="search-box">
        <input type="text" placeholder="SEARCH THE ENTIRE STORE...">
        <button><i class="fas fa-search"></i></button>
    </div>
    <div class="nav-icons">
        <div class="language">Eng <i class="fas fa-chevron-down"></i></div>
        <a href="homepage.jsp" title="Go to Home" class="nav-link">Home</a>
        <a href="cart.jsp" title="View Cart" class="nav-link">Cart</a>
        <a href="/profile.jsp" title="View Profile" class="nav-link">Profile</a>
    </div>

</div>
<h2>Your Cart</h2>
<div class="cart-container">
    <table class="cart-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Delete</th>
        </tr>
        <%
            try {
                List<CartItem> cartItems = CartDAO.getAllCartItems();
                if (cartItems.isEmpty()) {
        %>
        <tr>
            <td colspan="6" class="empty-cart">Your cart is empty.</td>
        </tr>
        <%
        } else {
            for (CartItem item : cartItems) {
        %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td>Rs. <%= item.getPrice() %></td>
            <td>
                <div class="quantity-controls">
                    <button onclick="updateQuantity(<%= item.getId() %>, 'decrement')">-</button>
                    <span><%= item.getQuantity() %></span>
                    <button onclick="updateQuantity(<%= item.getId() %>, 'increment')">+</button>
                </div>
            </td>
            <td class="total-price">Rs. <%= item.getTotalPrice() %></td>
            <td>
                <button class="delete-button" onclick="deleteItem(<%= item.getId() %>)">Delete</button>
            </td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                System.out.println("Error fetching cart items: " + e.getMessage());
            }
        %>
    </table>
</div>

<div class="checkout-container">
    <a href="./checkout.jsp" class="checkout-button">Proceed to Checkout</a>
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
                <li><a href="homepage.jsp">Home</a></li>
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
