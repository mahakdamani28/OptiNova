<?php
session_start();
if (!isset($_SESSION['username'])) 
    {
    header("Location: /login.php");
    exit();
}
include "includes/header.php";
?>
<button class="back-btn" onclick="goBack()">← Back</button>
<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js"></script>
<div class="dashboard-container">
   <h1>Welcome, <?php echo ucfirst($_SESSION['username']); ?> 👋</h1>
    <p class="subtitle">Your OptiNova control panel</p>
    <div class="dashboard-grid">
        <a href="pages/orders.php" class="dash-card">
            <i class="fa-solid fa-box"></i>
            <h3>My Orders</h3>
            <p>View and manage your orders</p>
        </a>
        
        <a href="pages/profile.php" class="dash-card">
            <i class="fa-solid fa-user"></i>
            <h3>Profile</h3>
            <p>Update your details</p>
        </a>

        <a href="pages/wishlist.php" class="dash-card">
            <i class="fa-regular fa-heart"></i>
            <h3>Wishlist</h3>
            <p>Your saved products</p>
        </a>

        <a href="logout.php" class="dash-card logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            <h3>Logout</h3>
            <p>End your session</p>
        </a>
    </div></div>
<?php include "includes/footer.php"; ?>