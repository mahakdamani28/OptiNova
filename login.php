<?php 
ob_start();
session_start();
 include 'includes/header.php';?> 
 <button class="back-btn" onclick="goBack()">← Back</button>
<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<?php
include "db.php";
$error = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? "");
    $pass  = $_POST['password'] ?? "";

    if (empty($email) || empty($pass)) {
        $error = "All fields are required.";
    } else {
        $stmt = $conn->prepare("SELECT id, username, email, password FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $res = $stmt->get_result();

        if ($res && $res->num_rows === 1) {
            $user = $res->fetch_assoc();
            if (password_verify($pass, $user['password'])) {
                // successful login
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                header("Location:/dashboard.php");
                exit;
            } else {
                $error = "Incorrect password.";
            }
        } else {
            $error = "No account found with that email.";
        }
        $stmt->close();
    }
}
?>
<div class="login-container">
  <h2>Login to OptiNova</h2>
  <?php if($error) echo "<p class='error-msg'>$error</p>"; ?>

  <form method="post" class="login-form" autocomplete="off">
    <input type="email" name="email" placeholder="Email address" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
    <p class="signup-link">Don't have an account? <a href="/register.php">Sign up</a></p>
  </form>
</div>
<?php include "includes/footer.php"; ?>
<?php ob_end_flush(); ?>
