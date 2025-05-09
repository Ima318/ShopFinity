<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
    <link rel="stylesheet" type="text/css" href="css/add-product.css">
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
    <h2>Add New Product</h2>
    <form action="AddProductServlet" method="post" onsubmit="return validateForm()">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="modelNumber">Product Model Number:</label>
        <input type="text" id="modelNumber" name="modelNumber" required>

        <label for="picture">Product Picture (URL or Path):</label>
        <input type="text" id="picture" name="picture">

        <label for="price">Product Price:</label>
        <input type="number" id="price" name="price" >

        <label for="description">Product Description:</label>
        <textarea id="description" name="description" ></textarea>

        <label for="quantity">Product Quantity:</label>
        <input type="number" id="quantity" name="quantity" >

        <input type="submit" name="submit" value="Add Product">
    </form>
</div>

</body>
</html>
