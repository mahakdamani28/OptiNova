<?php
include "../db.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $message = trim($_POST['message']);

    if (empty($name) || empty($email) || empty($message)) {
        echo "All fields are required!";
        exit;
    }

    $stmt = mysqli_prepare(
        $conn,
        "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)"
    );

    mysqli_stmt_bind_param($stmt, "sss", $name, $email, $message);
    mysqli_stmt_execute($stmt);

    if (mysqli_stmt_affected_rows($stmt) > 0) {
        header("Location: contact.php?success=1");
        exit;
    } else {
        echo "Something went wrong. Please try again.";
    }

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
}
?>
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    if (empty($name) || empty($email) || empty($message)) {
        echo "All fields are required!";
        exit;
    }

    // Example: save message to database OR email
    // For now, simple success response

    echo "<h2>Thank you, $name!</h2>";
    echo "<p>Your message has been sent successfully.</p>";
    echo "<a href='contact.php'>Go back</a>";

} else {
    header("Location: contact.php");
    exit;
}
?>
