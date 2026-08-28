<?php
session_start();
include("../includes/header.php"); 
include("../db.php");  

// Check login
if (!isset($_SESSION['user_id'])) {
    echo "<p style='text-align:center;'>Please <a href='login.php'>login</a> to view your orders.</p>";
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch orders with items
$query = "
SELECT 
    o.id AS order_id, 
    o.order_date, 
    o.status, 
    oi.quantity, 
    oi.price, 
    p.name AS product_name
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.user_id = '$user_id'
ORDER BY o.order_date DESC
";

$result = $conn->query($query);
?>

<!DOCTYPE html>
<html>
<head><button class="back-btn" onclick="goBack()">← Back</button>
    <title>My Orders</title>
    <style>
        body { font-family: Arial, sans-serif; background: #fafafa; margin:0; padding:0; }
        h2 { text-align: center; margin: 20px 0; }
        table { width: 90%; margin: 20px auto; border-collapse: collapse; background: #fff; box-shadow: 0px 2px 8px rgba(0,0,0,0.1); }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }
        th { background: #f4f4f4; }
        .status { font-weight: bold; }
        .pending { color: orange; }
        .dispatched { color: blue; }
        .completed { color: green; }
        .cancelled { color: red; }
    </style>
</head>
<body>

<h2>My Orders</h2>

<table>
    <tr>
        <th>Order ID</th>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Date</th>
        <th>Status</th>
    </tr>
    <?php if ($result && $result->num_rows > 0) { ?>
        <?php while($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['order_id']; ?></td>
                <td><?php echo htmlspecialchars($row['product_name']); ?></td>
                <td>₹<?php echo number_format($row['price'], 2); ?></td>
                <td><?php echo $row['quantity']; ?></td>
                <td><?php echo date("d M Y, h:i A", strtotime($row['order_date'])); ?></td>
                <td class="status <?php echo strtolower($row['status']); ?>">
                    <?php 
                        echo $row['status']; 
                        if ($row['status'] == 'Dispatched') {
                            echo "<br><span style='font-size:14px;'>🚚 Your order has been dispatched!</span>";
                        } elseif ($row['status'] == 'Completed') {
                            echo "<br><span style='font-size:14px;'>✅ Your order has been delivered.</span>";
                        } elseif ($row['status'] == 'Cancelled') {
                            echo "<br><span style='font-size:14px;'>❌ Your order was cancelled.</span>";
                        } elseif ($row['status'] == 'Pending') {
                            echo "<br><span style='font-size:14px;'>⌛ Your order is being processed.</span>";
                        }
                    ?>
                </td>
            </tr>
        <?php } ?>
    <?php } else { ?>
        <tr><td colspan="6">You have no orders yet.</td></tr>
    <?php } ?>
</table>

<?php include("../includes/footer.php"); ?>

</body>
</html>
