<?php
session_start();
include "../db.php";
// --- Handle form submission ---
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $full_name    = $_POST['full_name'];
    $email        = $_POST['email'];
    $phone        = $_POST['phone'];
    $address      = $_POST['address'];
    $payment      = $_POST['payment'];
    $total_amount = $_POST['total_amount'];

$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

$stmt = $conn->prepare("INSERT INTO orders 
        (user_id, full_name, email, phone, address, payment_method, total_amount, status, order_date) 
        VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending', NOW())");
    $stmt->bind_param("isssssd", $user_id, $full_name, $email, $phone, $address, $payment, $total_amount);

    if ($stmt->execute()) {
        $order_id = $stmt->insert_id; 
        $stmt->close();
foreach ($_SESSION['cart'] as $product_id => $item) {
    $quantity = $item['quantity'];
    $price    = $item['price'];
    $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiid", $order_id, $product_id, $quantity, $price);
    $stmt->execute();
}
// Clear cart after placing order
unset($_SESSION['cart']);
// Save total to session for UPI page
$_SESSION['order_id'] = $order_id;
$_SESSION['total_amount'] = $total_amount;
if ($payment === "upi") {
  header("Location: upi-payment.php");
  exit();
} else {
  header("Location: thankyou.php");
  exit();
        }
    } else {
        echo "<p class='error'>Error: " . $stmt->error . "</p>";
    }
}
?>
<?php include "../includes/header.php"; ?>
<link rel="stylesheet" href="/OptiNova/assets/css/styles.css">
<script src="/OptiNova/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" crossorigin="anonymous"/>
<body class="bg">
<button class="back-btn" onclick="goBack()">← Back</button>
<div class="checkout-wrapper">
  <div class="checkout-card">
    <h2 class="title">Checkout - OptiNova</h2>
    <form method="POST" action="">
      <input type="text"   name="full_name" placeholder="Full Name" required class="input">
      <input type="email"  name="email"     placeholder="Email Address" required class="input">
      <input type="text"   name="phone"     placeholder="Phone Number" required class="input">
      <textarea name="address" placeholder="Shipping Address" required class="textarea"></textarea>
      <!-- Payment -->
       <label class="radio">
        <input type="radio" name="payment" value="cod" required>
        <span>Cash on Delivery</span>
      </label>
      <label class="radio">
        <input type="radio" name="payment" value="upi" required>
        <span>UPI</span>
      </label>
      <!-- Cart Total -->
       <?php
        $total_amount = 0;
        if (!empty($_SESSION['cart'])) {
            foreach ($_SESSION['cart'] as $item) {
                $price = isset($item['price']) ? (float)$item['price'] : 0;
$quantity = isset($item['quantity']) ? (int)$item['quantity'] : 1;

$total_amount += $price * $quantity;

            }
        }
        ?>
        <p class="section-heading">Total Amount: <strong>₹<?= number_format($total_amount, 2) ?></strong></p>
        <input type="hidden" name="total_amount" value="<?= $total_amount ?>">

        <button type="submit" class="btn">Confirm Order</button>
      </form>
    </div>
  </div>
<?php include "../includes/footer.php"; ?>
</body>
