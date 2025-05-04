<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shopfinity.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 800px;
        }
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Edit Product</h2>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% Product product = (Product) request.getAttribute("product"); %>
        <% if (product != null) { %>
            <form action="UpdateProductServlet" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="id" value="<%= product.getId() %>">
                
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" class="form-control" id="name" name="name" 
                           value="<%= product.getName() %>" required>
                </div>

                <div class="form-group">
                    <label for="modelNumber">Product Model Number:</label>
                    <input type="text" class="form-control" id="modelNumber" name="modelNumber" 
                           value="<%= product.getModelNumber() %>" required>
                </div>

                <div class="form-group">
                    <label for="picture">Product Picture (URL or Path):</label>
                    <input type="text" class="form-control" id="picture" name="picture" 
                           value="<%= product.getPicture() != null ? product.getPicture() : "" %>">
                </div>

                <div class="form-group">
                    <label for="price">Product Price:</label>
                    <input type="number" class="form-control" id="price" name="price" 
                           value="<%= product.getPrice() %>" step="0.01" required>
                </div>

                <div class="form-group">
                    <label for="description">Product Description:</label>
                    <textarea class="form-control" id="description" name="description" 
                              rows="3" required><%= product.getDescription() %></textarea>
                </div>

                <div class="form-group">
                    <label for="quantity">Product Quantity:</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" 
                           value="<%= product.getQuantity() %>" required>
                </div>

                <div class="form-group mt-3">
                    <button type="submit" class="btn btn-primary">Update Product</button>
                    <a href="view-products.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        <% } else { %>
            <div class="alert alert-danger">
                Product not found!
            </div>
            <a href="view-products.jsp" class="btn btn-primary">Back to Product List</a>
        <% } %>
    </div>

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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 