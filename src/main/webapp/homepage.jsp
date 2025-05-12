<%@ page import="com.register.model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Homepage - Products</title>
</head>
<body>
<h1>Homepage - Product List</h1>

<c:forEach var="product" items="${products}">
    <div>
        <img src="${product.picture}" alt="${product.name}" />
        <h2>${product.name}</h2>
        <p>Price: $${product.price}</p>
        <p><a href="productDetail?id=${product.id}">View Details</a></p>
    </div>
</c:forEach>
</body>
</html>
