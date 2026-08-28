<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['product_id']);
    $name = $_POST['product_name'];
    $price = floatval($_POST['product_price']);
    $image = $_POST['product_image'];
    $qty = intval($_POST['quantity']);
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }
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
     echo "success"; 
}
?>
