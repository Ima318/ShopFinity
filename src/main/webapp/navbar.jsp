<%--
  Created by IntelliJ IDEA.
  User: Tharini
  Date: 5/9/2025
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopFinity Navbar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /*body { margin: 0; font-family: Arial, sans-serif; }
        .navbar { display: flex; align-items: center; justify-content: space-between; background-color: #4b2a7b; padding: 10px 20px; color: white; }
        .logo { font-size: 30px; font-weight: bold; }
        .logo span { color: #ffdb4d; }
        .search-box { display: flex; align-items: center; background-color: white; border-radius: 20px; }
        .search-box input { border: none; padding: 8px 15px; border-radius: 20px 0 0 20px; outline: none; width: 300px; }
        .search-box button { background-color: #ffdb4d; border: none; padding: 8px 12px; border-radius: 0 20px 20px 0; cursor: pointer; }
        .search-box button i { color: #4b2a7b; }
        .nav-icons { display: flex; gap: 20px; align-items: center; }
        .nav-icons i { font-size: 20px; cursor: pointer; }
        .nav-icons .language { margin-right: 5px; }*/

        <style>
            /* Navbar Styles */
        body { margin: 0; font-family: Arial, sans-serif; }
        .navbar { display: flex; align-items: center; justify-content: space-between; background-color: #4b2a7b; padding: 10px 20px; color: white; }
        .logo { font-size: 30px; font-weight: bold; }
        .logo span { color: #ffdb4d; }
        .search-box { display: flex; align-items: center; background-color: white; border-radius: 20px; }
        .search-box input { border: none; padding: 8px 15px; border-radius: 20px 0 0 20px; outline: none; width: 300px; }
        .search-box button { background-color: #ffdb4d; border: none; padding: 8px 12px; border-radius: 0 20px 20px 0; cursor: pointer; }
        .search-box button i { color: #4b2a7b; }
        .nav-icons { display: flex; gap: 20px; align-items: center; }
        .nav-icons i { font-size: 20px; cursor: pointer; }
        .nav-icons .language { margin-right: 5px; }

        /* Footer */
        .footer {
            background-color: rgba(197, 205, 206, 0.74);
            color: white;
            padding: 40px 20px 10px;
        }
        .footer-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 40px;
        }
        .footer-section {
            flex: 1 1 200px;
        }
        .footer-section h4, .footer-section h3 {
            margin-bottom: 10px;
        }
        .footer-section ul {
            list-style: none;
            padding: 0;
        }
        .footer-section ul li {
            margin-bottom: 8px;
        }
        .footer-section ul li a {
            color: white;
            text-decoration: none;
        }
        .footer-section ul li a:hover {
            text-decoration: underline;
        }
        .footer-bottom {
            margin-top: 30px;
            text-align: center;
            border-top: 2px solid #d3aa04;
            padding-top: 15px;
            font-size: 14px;
        }
    </style>

    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">Shop<span>f</span>nity</div>
    <div class="search-box">
        <input type="text" placeholder="SEARCH THE ENTIRE STORE...">
        <button><i class="fas fa-search"></i></button>
    </div>
    <div class="nav-icons">
        <div class="language">Eng <i class="fas fa-chevron-down"></i></div>
        <i class="fas fa-shopping-cart"></i>
        <i class="fas fa-user"></i>
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
                <li><a href="#">Home</a></li>
                <li><a href="#">Shop</a></li>
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

