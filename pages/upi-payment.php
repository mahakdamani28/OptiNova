<?php
session_start();
include '../db.php';

/* Safety check */
if (!isset($_SESSION['total_amount'])) {
    header("Location: /pages/cart.php");
    exit;
}

$total_amount = $_SESSION['total_amount'];
?>
<?php include "../includes/header.php"; ?>

<div class="payment-container">
    <h2>Scan & Pay via UPI</h2>

    <p>
        Total Amount:
        <strong>₹<?= number_format($total_amount, 2); ?></strong>
    </p>

    <div class="qr-box">
        <img src="../images/indeximgs/scanner.jpg" alt="UPI QR Code">
    </div>

    <p>
        Use any UPI app (Google Pay, PhonePe, Paytm) to scan and complete the payment.
    </p>

    <form action="thankyou.php" method="POST">
        <input type="hidden" name="order_id" value="<?= $_SESSION['order_id'] ?? ''; ?>">
        <button type="submit" class="paid-btn">I Have Paid</button>
    </form>
</div>

<button class="back-btn" onclick="goBack()">← Back</button>

<?php include "../includes/footer.php"; ?>