<?php
include '../db.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$product_id = $_POST['product_id'];


$check = mysqli_query($conn, "SELECT * FROM cart WHERE user_id='$user_id' AND product_id='$product_id'");
if (mysqli_num_rows($check) > 0) {
    // update quantity
    mysqli_query($conn, "UPDATE cart SET quantity = quantity + 1 WHERE user_id='$user_id' AND product_id='$product_id'");
} else {
    // insert new
    mysqli_query($conn, "INSERT INTO cart (user_id, product_id, quantity) VALUES ('$user_id', '$product_id', 1)");
}

header("Location: cart.php");
exit();
?>
<?php
session_start();
include '../db.php';

// Make sure user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: ../pages/login.php");
    exit();
}
$user_id = $_SESSION['user_id'];

if (isset($_POST['wishlist_id']) && isset($_POST['product_id'])) {
    $wishlist_id = (int) $_POST['wishlist_id'];
    $product_id  = (int) $_POST['product_id'];

//  Check if already in cart
    $check = mysqli_query($conn, "SELECT * FROM cart WHERE user_id='$user_id' AND product_id='$product_id'");
    if (mysqli_num_rows($check) > 0) {
// Already in cart → just remove from wishlist
        mysqli_query($conn, "DELETE FROM wishlist WHERE id='$wishlist_id' AND user_id='$user_id'");
        header("Location: wishlist.php?moved=already");
        exit();
    }
//  Get product details from products table
    $product = mysqli_query($conn, "SELECT name, price, image FROM products WHERE id='$product_id'");
    if ($row = mysqli_fetch_assoc($product)) {
        $name  = mysqli_real_escape_string($conn, $row['name']);
        $price = (float) $row['price'];
        $image = mysqli_real_escape_string($conn, $row['image']);
//  Insert into cart with product details
        $insert = mysqli_query($conn, "
            INSERT INTO cart (user_id, product_id, name, price, image, quantity) 
            VALUES ('$user_id', '$product_id', '$name', '$price', '$image', 1)
        ");

        if ($insert) {
// Remove from wishlist after success
            mysqli_query($conn, "DELETE FROM wishlist WHERE id='$wishlist_id' AND user_id='$user_id'");
            header("Location: wishlist.php?moved=success");
            exit();
        } else {
            echo "Error inserting into cart: " . mysqli_error($conn);
        }
    } else {
        echo "Product not found!";
    }
}
?>
