<?php include "../includes/header.php"; ?>
<button class="back-btn" onclick="goBack()">← Back</button>
<link rel="stylesheet" href="/OptiNova/assets/css/styles.css">
<script src="/OptiNova/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<?php
include "../db.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $phone = htmlspecialchars($_POST['phone']);
    $date = htmlspecialchars($_POST['date']);
    $time = htmlspecialchars($_POST['time']);
    $message = htmlspecialchars($_POST['message']);
    $sql = "INSERT INTO appointments (name, email, phone, date, time, message) 
            VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $name, $email, $phone, $date, $time, $message);
    
    if ($stmt->execute()) {
        echo "<script>localStorage.setItem('appointmentConfirmed', 'true');</script>";
        echo "<script>window.location.href='appointment.php';</script>";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
    exit;
}
?>
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $phone = htmlspecialchars($_POST['phone']);
    $date = htmlspecialchars($_POST['date']);
    $time = htmlspecialchars($_POST['time']);
    $message = htmlspecialchars($_POST['message']);
    
    echo "<script>localStorage.setItem('appointmentConfirmed', 'true');</script>";
    echo "<script>window.location.href='appointment.php';</script>";
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
</head>
<body>
<div class="page-wrapper">
    <div class="appointment-container">
        <h2>Book Your Appointment</h2>
        <form method="POST" action="">
            <label for="name">Full Name</label>
            <input type="text" name="name" id="name" placeholder="Enter Name" required>

            <label for="email">Email Address</label>
            <input type="email" name="email" id="email" placeholder="Enter email" required>

            <label for="phone">Phone Number</label>
            <input type="tel" name="phone" id="phone" placeholder="Enter Your Number" required>

            <label for="date">Preferred Date</label>
            <input type="date" name="date" id="date" required>

            <label for="time">Preferred Time</label>
            <input type="time" name="time" id="time" required>

            <label for="message">Additional Notes</label>
            <textarea name="message" id="message" rows="4" placeholder="Any specific requirements?"></textarea>

            <button type="submit">Confirm Now</button>
        </form>
    </div>
</div>
<?php include "../includes/footer.php"; ?>
</body>
</html>