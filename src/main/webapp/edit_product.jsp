<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shopfinity.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            margin: 5px;
            border: none;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }
        .btn-secondary {
            background-color: #2196F3;
            color: white;
        }
        .error {
            color: red;
            margin: 10px 0;
        }
    </style>
    <script>
        function validateForm() {
            // Validate product model number
            var modelNumber = document.getElementById("modelNumber").value;
            var modelNumberPattern = /^[A-Z][A-Za-z0-9]*$/;
            if (!modelNumberPattern.test(modelNumber)) {
                alert("Product Model Number must start with a capital letter and include numbers.");
                return false;
            }

            // Validate product quantity
            var quantity = document.getElementById("quantity").value;
            if (quantity <= 0) {
                alert("Product Quantity must be greater than 0.");
                return false;
            }

            // Validate product price
            var price = document.getElementById("price").value;
            if (price <= 0) {
                alert("Product Price must be greater than 0.");
                return false;
            }

            // Validate product description
            var description = document.getElementById("description").value.trim();
            if (description === "") {
                alert("Product Description cannot be empty.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">${error}</div>
        <% } %>
        
        <% Product product = (Product) request.getAttribute("product"); %>
        <% if (product != null) { %>
            <form action="UpdateProductServlet" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" id="name" name="name" value="<%= product.getName() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="modelNumber">Product Model Number:</label>
                    <input type="text" id="modelNumber" name="modelNumber" value="<%= product.getModelNumber() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="picture">Product Picture (URL or Path):</label>
                    <input type="text" id="picture" name="picture" value="<%= product.getPicture() %>">
                </div>
                
                <div class="form-group">
                    <label for="price">Product Price:</label>
                    <input type="number" id="price" name="price" value="<%= product.getPrice() %>" step="0.01" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Product Description:</label>
                    <textarea id="description" name="description" rows="4" required><%= product.getDescription() %></textarea>
                </div>
                
                <div class="form-group">
                    <label for="quantity">Product Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="<%= product.getQuantity() %>" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Update Product</button>
                <a href="list_products.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        <% } else { %>
            <div class="error">Product not found</div>
            <a href="list_products.jsp" class="btn btn-secondary">Back to List</a>
        <% } %>
    </div>
</body>
</html> 