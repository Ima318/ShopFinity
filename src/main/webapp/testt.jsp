<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Product</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container">
  <header>
    <h1>Add New Product</h1>
    <p>Complete the form below to add a new product to your inventory</p>
  </header>

  <main>
    <form id="add-product-form">
      <div class="form-group">
        <label for="product-name">Product Name*</label>
        <input type="text" id="product-name" name="product-name" required>
      </div>

      <div class="form-group">
        <label for="product-description">Product Description*</label>
        <textarea id="product-description" name="product-description" rows="4" required></textarea>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="product-price">Price ($)*</label>
          <input type="number" id="product-price" name="product-price" min="0.01" step="0.01" required>
        </div>

        <div class="form-group">
          <label for="product-stock">Stock Quantity*</label>
          <input type="number" id="product-stock" name="product-stock" min="1" required>
        </div>
      </div>

      <div class="form-group">
        <label for="product-category">Category*</label>
        <select id="product-category" name="product-category" required>
          <option value="">Select a category</option>
          <option value="electronics">Electronics</option>
          <option value="clothing">Clothing</option>
          <option value="home">Home & Kitchen</option>
          <option value="books">Books</option>
          <option value="toys">Toys & Games</option>
          <option value="other">Other</option>
        </select>
      </div>

      <div class="form-group">
        <label for="product-image">Product Image*</label>
        <div class="file-input-container">
          <input type="file" id="product-image" name="product-image" accept="image/*" required>
          <div class="file-input-placeholder">
            <span>Choose file or drag & drop</span>
          </div>
        </div>
        <div id="image-preview" class="hidden">
          <img id="preview-img" src="/placeholder.svg" alt="Image preview">
          <button type="button" id="remove-image">Remove</button>
        </div>
      </div>

      <div class="form-group">
        <label for="product-tags">Tags (comma separated)</label>
        <input type="text" id="product-tags" name="product-tags" placeholder="e.g., new, sale, featured">
      </div>

      <div class="form-actions">
        <button type="reset" class="btn-secondary">Reset Form</button>
        <button type="submit" class="btn-primary">Add Product</button>
      </div>
    </form>
  </main>

  <footer>
    <p>&copy; 2025 Your Company. All rights reserved.</p>
  </footer>
</div>

<script>
  // Simple image preview functionality
  const fileInput = document.getElementById('product-image');
  const imagePreview = document.getElementById('image-preview');
  const previewImg = document.getElementById('preview-img');
  const removeButton = document.getElementById('remove-image');

  fileInput.addEventListener('change', function() {
    if (this.files && this.files[0]) {
      const reader = new FileReader();

      reader.onload = function(e) {
        previewImg.src = e.target.result;
        imagePreview.classList.remove('hidden');
      }

      reader.readAsDataURL(this.files[0]);
    }
  });

  removeButton.addEventListener('click', function() {
    fileInput.value = '';
    imagePreview.classList.add('hidden');
    previewImg.src = '';
  });
</script>
</body>
</html>