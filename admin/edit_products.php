<?php
include("auth.php");
include("../db.php");

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM products WHERE id=$id");
$product = $result->fetch_assoc();

if (isset($_POST['update_product'])) {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $category = $_POST['category'];

    $image = $product['image'];

    if (!empty($_FILES["image"]["name"])) {
        $target_dir = "../images/" . $category . "/";
        $image_name = basename($_FILES["image"]["name"]);
        $target_file = $target_dir . $image_name;

        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            $image = "images/" . $category . "/" . $image_name;
        }
    }

    $stmt = $conn->prepare("UPDATE products SET name=?, description=?, price=?, category=?, image=? WHERE id=?");
    $stmt->bind_param("ssdssi", $name, $description, $price, $category, $image_path, $id);
    $stmt->execute();

    header("Location: manage_products.php");
}
?>
<!DOCTYPE html>
<html>
<head><title>Edit Product</title></head>
<body>
<h2>Edit Product</h2>
<form method="POST" enctype="multipart/form-data">
    <input type="text" name="name" value="<?= $product['name']; ?>" required><br>
    <textarea name="description"><?= $product['description']; ?></textarea><br>
    <input type="number" step="0.01" name="price" value="<?= $product['price']; ?>" required><br>
    
    <select name="category" required>
        <option value="eyeglasses" <?= $product['category']=="Kids Sunglasses"?"selected":""; ?>>Eyeglasses</option>
        <option value="sunglasses" <?= $product['category']=="Men Sunglasses"?"selected":""; ?>>Sunglasses</option>
        <option value="lens" <?= $product['category']=="lens"?"selected":""; ?>>Lens</option>
    </select><br>
    <input type="file" name="image"><br>
    <img src="/<?= $product['image']; ?>" width="100"><br>
    <button type="submit" name="update_product">Update Product</button>
</form>
</body>
</html>