<?php
include "auth.php";
include "../db.php";
// Delete user
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM users WHERE id=$id");
    header("Location: manage_users.php");
}
// Fetch users
$result = $conn->query("SELECT * FROM users");
?>
<h1>Manage Users</h1>
<table order="1" cellpadding="10">
<tr>
    <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Action</th>
</tr>
<?php while ($row = $result->fetch_assoc()) { ?>
<tr>
    <td><?= $row['id'] ?></td>
    <td><?= $row['full_name'] ?></td>
    <td><?= $row['email'] ?></td>
    <td><?= $row['phone'] ?></td>
    <td><?= $row['address'] ?></td>
    <td>
        <a href="manage_users.php?delete=<?= $row['id'] ?>" onclick="return confirm('Delete this user?')">🗑️ Delete</a>
    </td>
</tr>
<?php } ?>
</table>