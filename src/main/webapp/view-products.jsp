<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shopfinity.model.Product" %>
<%@ page import="com.shopfinity.util.ProductDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-image {
            max-width: 100px;
            max-height: 100px;
            object-fit: contain;
        }
        .action-buttons {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Product List</h2>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <div class="mb-3">
            <a href="add_product.jsp" class="btn btn-primary">Add New Product</a>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Model Number</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    try {
                        List<Product> products = ProductDBUtil.getAllProducts();
                        for (Product product : products) {
                    %>
                        <tr>
                            <td><%= product.getId() %></td>
                            <td>
                                <% if (product.getPicture() != null && !product.getPicture().isEmpty()) { %>
                                    <img src="<%= product.getPicture() %>" alt="Product Image" class="product-image">
                                <% } else { %>
                                    <span class="text-muted">No image</span>
                                <% } %>
                            </td>
                            <td><%= product.getName() %></td>
                            <td><%= product.getModelNumber() %></td>
                            <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                            <td><%= product.getQuantity() %></td>
                            <td><%= product.getDescription() %></td>
                            <td class="action-buttons">
                                <a href="EditProductServlet?id=<%= product.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                                <a href="DeleteProductServlet?id=<%= product.getId() %>" 
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                            </td>
                        </tr>
                    <% 
                        }
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='8' class='text-danger'>Error loading products: " + e.getMessage() + "</td></tr>");
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 