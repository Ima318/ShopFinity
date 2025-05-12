<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shopfinity.dao.ProductDAOFactory" %>
<%@ page import="com.shopfinity.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f5f5f5;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .btn {
            display: inline-block;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            margin: 5px;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-edit {
            background-color: #2196F3;
            color: white;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .error {
            color: red;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<jsp:include page="/header.jsp"/>
    <div class="container">
        <h2>Product List</h2>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">${error}</div>
        <% } %>
        
        <a href="add_product.jsp" class="btn btn-primary">Add New Product</a>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Model Number</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    List<Product> products = ProductDAOFactory.getInstance().getReadDAO().getAllProducts();
                    for (Product product : products) {
                %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getModelNumber() %></td>
                        <td>$<%= String.format("%.2f", product.getPrice()) %></td>
                        <td><%= product.getQuantity() %></td>
                        <td>
                            <a href="EditProductServlet?id=<%= product.getId() %>" class="btn btn-edit">Edit</a>
                            <a href="DeleteProductServlet?id=<%= product.getId() %>" class="btn btn-delete" 
                               onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                        </td>
                    </tr>
                <% 
                    }
                } catch (Exception e) {
                %>
                    <tr>
                        <td colspan="6" class="error">Error loading products: <%= e.getMessage() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <jsp:include page="/footer.jsp"/>
</body>
</html> 