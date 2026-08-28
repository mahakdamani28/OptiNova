<?php
include("auth.php"); // check admin login
include("../db.php");

// Add product
if (isset($_POST['add_product'])) {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $category = $_POST['category'];

    // Image upload
    $target_dir = "../images/" . $category . "/";
    $image_name = basename($_FILES["image"]["name"]);
    $target_file = $target_dir . $image_name;

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image = "images/" . $category . "/" . $image_name;

        $stmt = $conn->prepare("INSERT INTO products (name, description, price, category, image) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("ssdss", $name, $description, $price, $category, $image_path);
        $stmt->execute();
    }
}

// Delete product
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM products WHERE id=$id");
}

// Fetch products
$result = $conn->query("SELECT * FROM products");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
<h2>Manage Products</h2>
<!--Product Form -->
<form method="POST" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="Product Name" required><br>
    <textarea name="description" placeholder="Description"></textarea><br>
    <input type="number" step="0.01" name="price" placeholder="Price" required><br>
    
<select name="category" required>
    <option value="eyeglasses">Eyeglasses</option>
    <option value="sunglasses">Sunglasses</option>
    <option value="lens">Lens</option>
</select><br>
<input type="file" name="image" required><br>
<button type="submit" name="add_product">Add Product</button>
</form>
<hr>
<!-- Product List -->
<h3>Existing Products</h3>
<table order="1" cellpadding="10">
    <tr>
        <th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Image</th><th>Action</th>
    </tr>
    <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?= $row['id']; ?></td>
            <td><?= $row['name']; ?></td>
            <td><?= $row['category']; ?></td>
            <td>₹<?= $row['price']; ?></td>
            <td><img src="/<?= $row['image']; ?>" width="80"></td>
            <td>
                <a href="edit_products.php?id=<?= $row['id']; ?>">Edit</a> | 
                <a href="manage_products.php?delete=<?= $row['id']; ?>" onclick="return confirm('Delete this product?')">Delete</a>
            </td>
        </tr>
        <?php }
        ?>
</table>
</body>
</html>
