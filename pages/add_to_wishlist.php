<?php
session_start();
if (!isset($_SESSION['wishlist'])) {
    $_SESSION['wishlist'] = [];
}
if (isset($_POST['id'], $_POST['name'], $_POST['price'], $_POST['image'])) {
    $product_id = $_POST['id'];
    if (isset($_SESSION['wishlist'][$product_id])) {
        echo "Already in wishlist ❤️";
    } else {
        $_SESSION['wishlist'][$product_id] = [
            'id' => $product_id,
            'name' => $_POST['name'],
            'price' => $_POST['price'],
            'image' => $_POST['image']
        ];
        echo "Added to wishlist ✅";
    }
}
?>
