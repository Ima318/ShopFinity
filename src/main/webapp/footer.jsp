<!-- footer.jsp -->
<style>
  .footer {
    background: linear-gradient(90deg, rgba(76, 42, 155, 1) 0%, rgba(154, 87, 199, 1) 79%, rgba(237, 83, 204, 1) 100%);
    color: white;
    padding: 40px 20px 10px;
    margin-top: auto; /* Pushes the footer to the bottom */
    width: 100%;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
  }

  .footer-content {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto;
  }

  .footer-section {
    flex: 1 1 200px;
    min-width: 200px;
  }

  .footer-section h3,
  .footer-section h4 {
    margin-bottom: 10px;
  }

  .footer-section ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .footer-section ul li {
    margin-bottom: 8px;
  }

  .footer-section ul li a {
    color: white;
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .footer-section ul li a:hover {
    text-decoration: underline;
    color: #d3aa04;
  }

  .footer-bottom {
    margin-top: 30px;
    text-align: center;
    border-top: 2px solid #d3aa04;
    padding-top: 15px;
    font-size: 14px;
    font-weight: 500;
  }
</style>

<div class="footer">
  <div class="footer-content">
    <div class="footer-section">
      <h3>ShopFinity</h3>
      <p>Best online store for all your needs. Safe &amp; trusted.</p>
    </div>
    <div class="footer-section">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="./index.jsp">Home</a></li>
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


