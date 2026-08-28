<?php
session_start();
include '../db.php';

if (isset($_POST['wishlist_id'])) {
    $wishlist_id = (int) $_POST['wishlist_id'];
    $user_id = $_SESSION['user_id'];

    $sql = "DELETE FROM wishlist WHERE id='$wishlist_id' AND user_id='$user_id'";
    if (mysqli_query($conn, $sql)) {
        header("Location: wishlist.php?removed=1");
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>
