<?php
session_start();
include '../db.php';

// Initialize wishlist session if not exists
if (!isset($_SESSION['wishlist'])) {
    $_SESSION['wishlist'] = [];
}

// Handle Remove Item
if ($_SERVER['REQUEST_METHOD'] === "POST" && isset($_POST['remove_wishlist'])) {
    $wishlist_id = $_POST['wishlist_id'];
    if (isset($_SESSION['wishlist'][$wishlist_id])) {
        unset($_SESSION['wishlist'][$wishlist_id]);
    }
}

// Handle Move to Cart
if ($_SERVER['REQUEST_METHOD'] === "POST" && isset($_POST['move_to_cart'])) {
    $wishlist_id = $_POST['wishlist_id'];
    if (isset($_SESSION['wishlist'][$wishlist_id])) {
        $item = $_SESSION['wishlist'][$wishlist_id];
// Add to cart session
        $_SESSION['cart'][] = $item;

        unset($_SESSION['wishlist'][$wishlist_id]);
    }
}
include '../includes/header.php';
?>
<div class="container">
    <h2>My Wishlist ❤️</h2>
    <div class="product-grid">
        <?php if (!empty($_SESSION['wishlist'])) { ?>
            <?php foreach ($_SESSION['wishlist'] as $id => $row) { ?>
    <div class="product-card">
        <img src="/<?php echo $row['image']; ?>" alt="<?php echo $row['name']; ?>">
        <h4><?php echo $row['name']; ?></h4>
        <p>₹<?php echo number_format($row['price'], 2); ?></p>
<div class="wishlist-card">
<!-- Remove -->
 <form method="POST" style="display:inline;">
    <input type="hidden" name="wishlist_id" value="<?php echo $id; ?>">
    <button type="submit" name="remove_wishlist" class="wishlist-btn remove-btn">Remove ❌</button>
</form>
<!-- Move to Cart -->
<form method="POST" style="display:inline;">
    <input type="hidden" name="wishlist_id" value="<?php echo $id; ?>">
    <button type="submit" name="move_to_cart" class="wishlist-btn move-btn">Move to Cart</button>
</form>
</div>
</div>
<?php } ?>
<?php } else { ?>
    <p>Your wishlist is empty.</p>
    <?php } ?>
</div>
</div>
<button class="back-btn" onclick="goBack()">← Back</button>
<?php include '../includes/footer.php'; ?>
