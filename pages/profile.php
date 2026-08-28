<?php
session_start();
include('../db.php'); 

// Ensure user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch user details safely
$sql = "SELECT username, email, phone, address, profile_img FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc() ?: [
    'username' => '',
    'email'    => '',
    'phone'    => '',
    'address'  => '',
    'profile_img' => ''
];
// Handle profile update
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $email    = trim($_POST['email'] ?? '');
    $phone    = trim($_POST['phone'] ?? '');
    $address  = trim($_POST['address'] ?? '');

    $profile_img = $user['profile_img'];
    // Handle image upload
    if (!empty($_FILES['profile_img']['name']) && $_FILES['profile_img']['error'] === 0) {
        $allowed_types = ['image/jpeg', 'image/png', 'image/jpg'];
        if (in_array($_FILES['profile_img']['type'], $allowed_types)) {
            $target_dir = "../uploads/";
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }
            $img_name = time() . "_" . basename($_FILES['profile_img']['name']);
            $target_file = $target_dir . $img_name;

            if (move_uploaded_file($_FILES['profile_img']['tmp_name'], $target_file)) {
                $profile_img = "uploads/" . $img_name;
            }
        }
    }
    $update_sql = "UPDATE users SET username=?, email=?, phone=?, address=?, profile_img=? WHERE id=?";
    $update_stmt = $conn->prepare($update_sql);
    $update_stmt->bind_param("sssssi", $username, $email, $phone, $address, $profile_img, $user_id);

    if ($update_stmt->execute()) {
        $_SESSION['success'] = "Profile updated successfully!";
    } else {
        $_SESSION['error'] = "Failed to update profile.";
    }
    header("Location: profile.php");
    exit();
}
?>
<?php include "../includes/header.php"; ?>
<link rel="stylesheet" href="/OptiNova/assets/css/styles.css">
<script src="/OptiNova/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" crossorigin="anonymous" />

<div class="profile-container">
    <h2>My Profile</h2>

    <?php if (!empty($_SESSION['success'])): ?>
        <p class="success"><?= htmlspecialchars($_SESSION['success']); unset($_SESSION['success']); ?></p>
    <?php endif; ?>

    <?php if (!empty($_SESSION['error'])): ?>
        <p class="error"><?= htmlspecialchars($_SESSION['error']); unset($_SESSION['error']); ?></p>
    <?php endif; ?>

    <form action="" method="POST" enctype="multipart/form-data" class="profile-form">
        <div class="profile-pic">
            <img src="../<?= !empty($user['profile_img']) ? htmlspecialchars($user['profile_img']) : 'images/indeximgs/avatar.jpg'; ?>" alt="Profile Picture">
            <input type="file" name="profile_img" accept="image/*">
        </div>

        <label>Full Name</label>
        <input type="text" name="username" value="<?= htmlspecialchars($user['username']); ?>" required>

        <label>Email</label>
        <input type="email" name="email" value="<?= htmlspecialchars($user['email']); ?>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<?php echo htmlspecialchars($user['phone'] ?? '', ENT_QUOTES); ?>">

        <label>Address</label>
        <input type="text" name="address" value="<?php echo htmlspecialchars($user['address'] ?? '', ENT_QUOTES); ?>">

        <button type="submit">Save Changes</button>
    </form>
</div>
<button class="back-btn" onclick="goBack()">← Back</button>

<?php include('../includes/footer.php'); ?>
