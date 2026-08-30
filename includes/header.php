<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OptiNova.com</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <script src="/assets/js/script.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
  <header class="main-header">
  <div class="nav-container">
    <!-- Logo -->
    <div class="logo">
      <img src="/images/indeximgs/logo.jpg" alt="OptiNova Logo">
      <span>OptiNova</span>
    </div>
    <!-- Navigation Links -->
     <nav class="nav-links">
      <ul>
        <li class="search-li">
          <div class="nav-search">
            <input type="text" placeholder="What are you looking for?" class="search-input" id="searchBox">
            <i class="fa-solid fa-magnifying-glass"></i>
            <!-- Dropdown -->
            <div class="search-dropdown" id="searchDropdown">
              <h4>Trending Search</h4>
              <ul>
                <li><a href="\OptiNova\pages\round-eyeglasses.php">Round Eyeglasses</a></li>
                <li><a href="\OptiNova\pages\square-eyeglasses.php">Square Eyeglasses</a></li>
                <li><a href="\OptiNova\pages\browline-eyeglasses.php">Browline Eyeglasses</a></li>
                <li><a href="\OptiNova\pages\cateye-eyeglasses.php">Cateye Eyeglasses</a></li>
                <li><a href="\OptiNova\pages\men-sunglasses.php">Men Sunglasses</a></li>
                <li><a href="\OptiNova\pages\women-sunglasses.php">Women Sunglasses</a></li>
                <li><a href="\OptiNova\pages\kids-sunglasses.php">Kids Sunglasses</a></li>
                <li><a href="\OptiNova\pages\clear-lens.php">Clear Contact Lenses</a></li>
                <li><a href="\OptiNova\pages\color-lens.php">Color Contact Lenses</a></li>
                <li><a href="\OptiNova\pages\accessories&solu-lens.php">Solutions & Accessories</a></li>
                <li><a href="\OptiNova\pages\appointment.php">Eye Appointment</a></li>
              </ul>
            </div>
          </div>
        </li>
        <li><a href="/index.php"><i class="fa-solid fa-house"></i> Home</a></li>
        <li><a href="/pages/wishlist.php"><i class="fa-regular fa-heart"></i> Wishlist</a></li>
        <li><a href="/pages/deals.php"><i class="fa-solid fa-fire-flame-curved"></i>Today's deals</a></li>
        <li><a href="/pages/contact.php"><i class="fa-solid fa-phone"></i> Contact us</a></li>
      </ul>
    </nav>
    <!-- Cart & Login -->
    <div class="nav-right">
      <a href="/login.php"><i class="fa-solid fa-right-to-bracket"></i> Login</a> | <a href="/pages/cart.php"><i class="fa-solid fa-cart-shopping"></i> Cart</a>
    </div>
    <div  id="user">
      <a href="/dashboard.php"><i class="fa-solid fa-user"></i></a>
  </div>
  <style>
  .search-input {
    transition: opacity 0.4s ease-in-out;
  }
</style>

</header>   