<?php
session_start();
include '../db.php';
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}
// MOVE FROM WISHLIST TO CART
if (isset($_POST['move_to_cart'])) {
    $id = intval($_POST['product_id']);
    $name = trim($_POST['product_name']);
    $price = floatval($_POST['product_price']);
    $image = trim($_POST['product_image']);
    $qty = isset($_POST['quantity']) ? max(1, intval($_POST['quantity'])) : 1;
    if (isset($_SESSION['cart'][$id])) {
        $_SESSION['cart'][$id]['quantity'] += $qty;
    } else {
        $_SESSION['cart'][$id] = [
            'name' => $name,
            'price' => $price,
            'image' => $image,
            'quantity' => $qty
        ];
    }
    if (!empty($_POST['wishlist_id'])) {
        $wishlist_id = intval($_POST['wishlist_id']);
        $conn->query("DELETE FROM wishlist WHERE id = $wishlist_id");
    }
    header("Location: cart.php");
    exit;
}
// ADD TO CART
if (isset($_POST['add_to_cart'])) {
    $id = intval($_POST['product_id']);
    $name = trim($_POST['product_name']);
    $price = floatval($_POST['product_price']);
    $image = trim($_POST['product_image']);
    $qty = isset($_POST['quantity']) ? max(1, intval($_POST['quantity'])) : 1;
    
    if (isset($_SESSION['cart'][$id])) {
        $_SESSION['cart'][$id]['quantity'] += $qty;
    } else {
        $_SESSION['cart'][$id] = [
            'name' => $name,
            'price' => $price,
            'image' => $image,
            'quantity' => $qty
        ];
    }
header("Location:cart.php");
exit;
}
// REMOVE ITEM
if (isset($_GET['remove'])) {
    $id = intval($_GET['remove']);
    unset($_SESSION['cart'][$id]);
    header("Location: cart.php");
    exit;
}
// UPDATE CART QUANTITIES
if (isset($_POST['update_cart'])) {
    if (!empty($_POST['quantity']) && is_array($_POST['quantity'])) {
        foreach ($_POST['quantity'] as $id => $qty) {
            $id = intval($id);
            $qty = intval($qty);
            if ($qty > 0) {
                if (isset($_SESSION['cart'][$id])) {
                    $_SESSION['cart'][$id]['quantity'] = $qty;
                }
            } else {
                unset($_SESSION['cart'][$id]);
            }
        }
    }
    header("Location: cart.php");
    exit;
}
?>
<?php include '../includes/header.php'; ?>
<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<div class="container" style="padding:40px;">
    <h2 style="margin-bottom:20px;">My Cart</h2>
    <?php if (!empty($_SESSION['cart'])): ?>
    <form method="post">
        <table class="orders-table" style="width:100%; border-collapse:collapse;">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price (₹)</th>
                    <th>Quantity</th>
                    <th>Subtotal (₹)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $total = 0;
                foreach ($_SESSION['cart'] as $id => $item):
                    $quantity = isset($item['quantity']) ? intval($item['quantity']) : 1;
                    $subtotal = $item['price'] * $quantity;
                    $total += $subtotal;
                ?>
                <tr>
                    <td>
                        <?php if (!empty($item['image'])): ?>
                            <img src="/<?= htmlspecialchars($item['image']); ?>" 
                            alt="<?= htmlspecialchars($item['name']); ?>" 
                            style="width:50px; height:auto; vertical-align:middle; margin-right:8px;">
                            <?php endif; ?>
                            <?= htmlspecialchars($item['name']); ?>
                    </td>
                    <td><?= number_format($item['price'], 2); ?></td>
                    <td>
                        <input type="number" 
                        name="quantity[<?= $id; ?>]" 
                        value="<?= $quantity; ?>" 
                        min="1" 
                        style="width:60px;">
                    </td>
                    <td><?= number_format($subtotal, 2); ?></td>
                    <td>
                        <a href="cart.php?remove=<?= $id; ?>" 
                        class="btn remove-btn" 
                        style="background:crimson; padding:5px 10px; color:white; text-decoration:none;" 
                        onclick="return confirm('Remove this item?')">
                        Remove
                        </a></td></tr>
                <?php endforeach; ?>
                <tr>
                    <th colspan="3" style="text-align:right;">Total:</th>
                    <th colspan="2">₹<?= number_format($total, 2); ?></th>
                </tr>
            </tbody>
        </table>
<div style="margin-top:20px; display:flex; gap:10px;">
<!-- Update Cart Button -->
 <button type="submit" name="update_cart" 
 class="btn update-btn-dark">
 Update Cart
</button>
<!-- Proceed to Checkout Button -->
<?php if (isset($_SESSION['user_id'])): ?>
<!-- Logged in: go to checkout -->
<button type="button" 
class="btn update-btn-dark"
onclick="window.location.href='checkout.php?total=<?= $total; ?>'">
Proceed to Checkout (₹<?= number_format($total, 2); ?>)
</button>
<?php else: ?>
    <!-- Not logged in: redirect to login -->
     <button type="button" 
     class="btn update-btn-dark" 
     style="background:#222; color:#fff; padding:12px 15px; border:none; cursor:pointer; flex:1; text-align:center; border-radius:4px;"
     onclick="alert('⚠️ Please login to proceed to checkout!'); window.location.href='/login.php';">
     Proceed to Checkout (₹<?= number_format($total, 2); ?>)
    </button>
    <?php endif; ?>
</div>
<button class="back-btn" onclick="goBack()">← Back</button>
</form>
<?php else: ?>
    <p>Your cart is empty. <a href="../index.php">Go Shopping</a></p>
<?php endif; ?>
</div>
<?php include '../includes/footer.php'; ?>
