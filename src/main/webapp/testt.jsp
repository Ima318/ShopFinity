<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Product</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
  <h1>Add New Product</h1>

  <form id="product-form">
    <div class="form-group">
      <label for="name">Product Name:</label>
      <input type="text" id="name" name="name">
    </div>

    <div class="form-group">
      <label for="price">Price:</label>
      <input type="number" id="price" name="price" step="0.01">
    </div>

    <div class="form-group">
      <label for="description">Description:</label>
      <textarea id="description" name="description" rows="3"></textarea>
    </div>

    <div class="form-group">
      <label for="category">Category:</label>
      <select id="category" name="category">
        <option value="">Select category</option>
        <option value="electronics">Electronics</option>
        <option value="clothing">Clothing</option>
        <option value="food">Food</option>
      </select>
    </div>

    <div class="form-group">
      <label for="image">Product Image:</label>
      <input type="file" id="image" name="image">
    </div>

    <div class="form-actions">
      <button type="reset">Reset</button>
      <button type="submit">Add Product</button>
    </div>
  </form>
</div>
</body>
</html>