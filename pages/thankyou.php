<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<?php
session_start();
$order_id = isset($_SESSION['order_id']) ? $_SESSION['order_id'] : null;
$total_amount = isset($_SESSION['total_amount']) ? $_SESSION['total_amount'] : null;
?>
<?php include "../includes/header.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thank You - OptiNova</title>
  <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body>
  <div class="thankyou-container">
    <div class="card">
      <h1>🎉 Thank You!</h1>
      <p>Your order has been placed successfully.</p>
      
      <?php if($total_amount): ?>
        <p><strong>Order ID:</strong> <?php echo $order_id; ?></p>
        <p><strong>Total Amount:</strong> ₹<?php echo $total_amount; ?></p>
      <?php endif; ?>
      <p>We’ll notify you once your order is shipped.</p>
      <a href="../index.php" class="btn">Continue Shopping</a>
      <a href="orders.php" class="btn">My Orders</a>
    </div>
  </div>
  <?php include '../includes/footer.php'; ?>
</body>
</html>
