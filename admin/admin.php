<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include "../db.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT password FROM admin WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($hashed_password);

    if ($stmt->fetch()) {
        if (password_verify($password, $hashed_password)) {
            $_SESSION['admin_logged_in'] = true;
            header("Location: adashboard.php");
            exit;
        }
    }

    $error = "Invalid username or password";
}
?>

<form method="POST">
  <h2>Admin Login</h2>
  <input type="text" name="username" placeholder="Username" required>
  <input type="password" name="password" placeholder="Password" required>
  <button type="submit">Login</button>
  <?php if (isset($error)) echo "<p>$error</p>"; ?>
</form>
