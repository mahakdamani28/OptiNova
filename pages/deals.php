<?php 
include("../includes/header.php"); 
include("../db.php"); 
// Fetch products marked as deals
$query = "SELECT * FROM products WHERE is_deal = 1 ORDER BY created_at DESC";
$result = mysqli_query($conn, $query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Deals | OptiNova</title>
  <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body>
<button class="back-btn" onclick="goBack()">← Back</button>
<!-- Top Banner -->
<div class="deal-banner">
  <img src="../images/indeximgs/banners/b1.jpg" alt="Top Deals Banner">
</div>
<div class="deals-container">
  <h2>🔥 Best Deals on Eyewear 🔥</h2>
  <!-- Two Side-by-Side Banners -->
  <div class="double-banner">
    <div class="banner-box">
      <img src="../images/indeximgs/banners/b4.avif" alt="sale">
    </div>
    <div class="banner-box">
      <img src="../images/indeximgs/banners/b5.jpg" alt="model">
    </div></div>
<div class="product-grid">
    <?php 
    $count = 0;
    while($row = mysqli_fetch_assoc($result)) { 
        $count++; 
        $price = number_format((float)$row['price'], 2, '.', '');
        $discount_price = !empty($row['discount_price']) ? number_format((float)$row['discount_price'], 2, '.', '') : null;
    ?>
      <div class="product-card">
        <img src="/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['name']); ?>">
        <h4><?php echo htmlspecialchars($row['name']); ?></h4>
        <p><?php echo htmlspecialchars($row['description']); ?></p>
<p class="price">
  <?php if (!empty($row['discount_price']) && $row['discount_price'] > 0) { ?>
    <span class="old-price" style="text-decoration:line-through; color:red;">
      ₹<?php echo $price; ?>
    </span>
    <span class="new-price" style="font-weight:bold; margin-left:6px;">
      ₹<?php echo $discount_price; ?>
    </span>
  <?php } else { ?>
    ₹<?php echo $price; ?>
  <?php } ?>
</p>
<form action="cart.php" method="POST">
    <input type="hidden" name="product_id" value="<?php echo (int)$row['id']; ?>">
    <input type="hidden" name="product_name" value="<?php echo htmlspecialchars($row['name']); ?>">
    <input type="hidden" name="product_price" 
           value="<?php echo (!empty($row['discount_price']) && $row['discount_price'] > 0) 
                          ? $discount_price 
                          : $price; ?>">
    <input type="hidden" name="product_image" value="<?php echo htmlspecialchars($row['image']); ?>">
    <input type="hidden" name="quantity" value="1">
    <button type="submit" name="add_to_cart" class="buy-now-btn">Buy Now</button>
</form></div>
<?php 
if($count % 9 == 0) { ?>
<div class="banner mid-banner">
  <img src="../images/indeximgs/banners/b2.jpg" alt="Special Offer">
</div>
<?php } ?>
<?php } ?>
</div></div>
<!-- Bottom Banner -->
<div class="deal-banner">
  <img src="../images/indeximgs/banners/b3.jpg" alt="Bottom Deals Banner">
</div>
<?php include("../includes/footer.php"); ?>
<script>
function goBack() {
  window.history.back();
}
</script>
</body>
</html>
