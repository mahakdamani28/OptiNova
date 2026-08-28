
<link rel="stylesheet" href="/OptiNova/assets/css/styles.css">
<script src="/OptiNova/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" crossorigin="anonymous" />
<?php
include "db.php";
session_start();
$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? "");
    $email    = trim($_POST['email'] ?? "");
    $pass     = $_POST['password'] ?? "";
    $age      = intval($_POST['age'] ?? 0);
    $gender   = $_POST['gender'] ?? "";

    if (empty($username) || empty($email) || empty($pass) || empty($age) || empty($gender)) {
        $error = "All fields are required.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email address.";
    } elseif ($age < 10 || $age > 100) {
        $error = "Please enter a valid age.";
    }elseif (strlen($pass) < 6 || !preg_match('/\d/', $pass)) {
    $error = "Password must be at least 6 characters long and contain at least one number.";
} else {
        $check = $conn->prepare("SELECT id FROM users WHERE email = ?");
        $check->bind_param("s", $email);
        $check->execute();
        $check->store_result();

        if ($check->num_rows > 0) {
            $error = "Email already registered.";
        } else {
            $hashed = password_hash($pass, PASSWORD_DEFAULT);

            $stmt = $conn->prepare(
                "INSERT INTO users (username, email, password, age, gender) VALUES (?, ?, ?, ?, ?)"
            );
            $stmt->bind_param("sssis", $username, $email, $hashed, $age, $gender);

            if ($stmt->execute()) {
                $_SESSION['user_id'] = $conn->insert_id;
                $_SESSION['username'] = $username;
                $_SESSION['email'] = $email;

                header("Location: /OptiNova/dashboard.php");
                exit();
            } else {
                $error = "Database error. Please try again.";
            }
            $stmt->close();
        }
        $check->close();
    }
}
?>

<?php include 'includes/header.php'; ?>
<button class="back-btn" onclick="goBack()">← Back</button>
<div class="login-container">
  <h2>Create Account</h2>

  <?php if($error) echo "<p class='error-msg'>$error</p>"; ?>

  <form method="post" class="login-form" autocomplete="off">
    <input type="text" name="username" placeholder="Full name" required>

    <input type="email" name="email" placeholder="Email address" required>

    <input type="number" name="age" placeholder="Age" min="10" max="100" required>

    <select name="gender" required>
        <option value="">Select Gender</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>

    <input type="password" name="password" placeholder="Password" required>
<small class="password-hint">
  Password must be at least 6 characters and include 1 number.
</small>

    <button type="submit">Sign Up</button>

    <p class="signup-link">
      Already have an account? <a href="login.php">Login</a>
    </p>
  </form>
</div>

<?php include "includes/footer.php"; ?>
