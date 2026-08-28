<?php
include("../db.php");
include("auth.php"); 

if (isset($_POST['update_status'])) {
    $order_id = intval($_POST['order_id']);
    $status   = $_POST['status'];

    $stmt = $conn->prepare("UPDATE orders SET status = ? WHERE id = ?");
    $stmt->bind_param("si", $status, $order_id);
    $stmt->execute();
    $stmt->close();

    header("Location: manage_orders.php?msg=updated");
    exit();
}

$query = "SELECT o.id AS order_id, o.order_date, o.status, o.total_amount,
           u.full_name, u.email
    FROM orders o
    JOIN users u ON o.user_id = u.id
    ORDER BY o.order_date DESC
";
$orders = $conn->query($query);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
<style>
    body { font-family: Arial, sans-serif; background:#f4f4f4; }
    h2 { text-align: center; margin:20px 0; }
    table { width: 95%; margin:20px auto; border-collapse:collapse; background:#fff; box-shadow:0 2px 8px rgba(0,0,0,0.1);}
    th, td { padding:12px; border:1px solid #ddd; text-align:center; }
    th { background:#333; color:#fff; }
    select { padding:5px; }
    button { padding:6px 10px; background:#222; color:#fff; border:none; border-radius:4px; cursor:pointer; }
    button:hover { background:#444; }
    .sub-table { margin:10px auto; width:90%; border:1px solid #ccc; }
    .sub-table th { background:#eee; color:#000; }
</style>
</head>
<body>
<h2>Manage Orders</h2>
<?php if ($orders && $orders->num_rows > 0) { ?>
<table>
    <tr>
        <th>Order ID</th>
        <th>User</th>
        <th>Email</th>
        <th>Date</th>
        <th>Total Amount (₹)</th>
        <th>Status</th>
        <th>Items</th>
        <th>Action</th>
    </tr>
<?php while ($row = $orders->fetch_assoc()) { ?>
    <tr>
        <td><?php echo $row['order_id']; ?></td>
        <td><?php echo htmlspecialchars($row['full_name']); ?></td>
        <td><?php echo htmlspecialchars($row['email']); ?></td>
        <td><?php echo date("d M Y, h:i A", strtotime($row['order_date'])); ?></td>
        <td><?php echo number_format($row['total_amount'], 2); ?></td>
        <td><?php echo $row['status']; ?></td>
        <td>
            <table class="sub-table">
                <tr><th>Product</th><th>Price</th><th>Qty</th></tr>
                <?php
                $oid = $row['order_id'];
                $items = $conn->query("SELECT p.name, oi.price, oi.quantity
                            FROM order_items oi
                            JOIN products p ON oi.product_id = p.id
                            WHERE oi.order_id = $oid");
                            while ($item = $items->fetch_assoc()) {
                                echo "<tr>
                                <td>".htmlspecialchars($item['name'])."</td>
                                <td>₹".number_format($item['price'], 2)."</td>
                                <td>".$item['quantity']."</td>
                                </tr>";
                            }
                ?>
                </table>
            </td>
            <td>
                <form method="post" style="display:flex; flex-direction:column; gap:6px;">
                    <input type="hidden" name="order_id" value="<?php echo $row['order_id']; ?>">
                    <select name="status">
                        <option value="Pending"    <?php if ($row['status']=="Pending") echo "selected"; ?>>Pending</option>
                        <option value="Dispatched" <?php if ($row['status']=="Dispatched") echo "selected"; ?>>Dispatched</option>
                        <option value="Completed"  <?php if ($row['status']=="Completed") echo "selected"; ?>>Completed</option>
                        <option value="Cancelled"  <?php if ($row['status']=="Cancelled") echo "selected"; ?>>Cancelled</option>
                    </select>
                    <button type="submit" name="update_status">Update</button>
                </form>
            </td>
        </tr>
        <?php } ?>
    </table>
<?php } else { ?>
    <p style="text-align:center;">No orders found.</p>
<?php } ?>
</body>
</html>