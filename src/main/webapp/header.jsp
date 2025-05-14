<!-- header.jsp -->
<style>
  body { margin: 0; font-family: Arial, sans-serif; }
  .navbar { display: flex; align-items: center; justify-content: space-between;
    background: #370852;
    background: linear-gradient(90deg, rgba(55, 8, 82, 1) 0%, rgba(137, 20, 196, 1) 79%, rgba(237, 83, 204, 1) 100%);
  ; padding: 10px 20px; color: white; }
  .logo { font-size: 30px; font-weight: bold;height: 70px }
  .logo span { color: #ffdb4d; }
  .search-box { display: flex; align-items: center; background-color: white; border-radius: 20px; }
  .search-box input { border: none; padding: 8px 15px; border-radius: 20px 0 0 20px; outline: none; width: 300px; }
  .search-box button { background-color: #ffffff; border: none; padding: 8px 12px; border-radius: 0 20px 20px 0; cursor: pointer; }
  .search-box button i { color: #4b2a7b; }
  .nav-icons { display: flex; gap: 20px; align-items: center; }
  .nav-icons i { font-size: 20px; cursor: pointer; }
  .nav-icons .language { margin-right: 5px;}
</style>

<div class="navbar">
  <div class="logo">Shop<span>F</span>inity</div>
  <div class="search-box">
    <input type="text" placeholder="SEARCH THE ENTIRE STORE...">
    <button><i class="fas fa-search"></i></button>
  </div>
  <div class="nav-icons">
    <div class="language">Eng <i class="fas fa-chevron-down"></i></div>
    <a href="index.jsp" title="Go to Home" class="nav-link">Home</a>
    <a href="cart.jsp" title="View Cart" class="nav-link">Cart</a>
    <a href="profile.jsp" title="View Profile" class="nav-link">Profile</a>
  </div>
</div>
