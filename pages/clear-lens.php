<?php include "../includes/header.php"; ?>
<button class="back-btn" onclick="goBack()">← Back</button>
<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<section class="men-sunglasses container">
  <h2>Clear lens</h2>
  <div class="product-grid">
    <div class="product-grid">
     <?php
        include '../db.php'; 

        $category = 'Clear Lens'; 
        $sql = "SELECT * FROM products WHERE category = '$category'";
        $result = mysqli_query($conn, $sql);
        $wishlist_items = [];
        if (isset($_SESSION['user_id'])) {
            $user_id = $_SESSION['user_id'];
            $w_result = $conn->query("SELECT product_id FROM wishlist WHERE user_id = $user_id");
            while ($row_w = $w_result->fetch_assoc()) {
                $wishlist_items[] = $row_w['product_id'];
            }
        }

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $id = $row['id'];
                $name = $row['name'];
                $price = $row['price'];
                $image = $row['image'];
                $desc = $row['description'];
                ?>
                
                <div class="product-card">
                    <img src="/<?php echo $image; ?>" alt="<?php echo $name; ?>">
                    <div class="icon-container">
                         <i class="<?php echo in_array($id, $wishlist_items) ? 'fa-solid fa-heart' : 'fa-regular fa-heart'; ?> wishlist-icon" 
                           style="cursor:pointer; font-size:18px;" 
                           data-id="<?php echo $id; ?>" 
                           data-name="<?php echo htmlspecialchars($name); ?>" 
                           data-price="<?php echo $price; ?>" 
                           data-image="<?php echo $image; ?>">
                        </i>

                      <button type="button" class="bag-button"
  onclick="addToCart(<?= $row['id']; ?>, '<?= $row['name']; ?>', <?= $row['price']; ?>, '<?= $row['image']; ?>')">
  <i class="fa-solid fa-bag-shopping bag-icon"></i>
</button>
                    </div>
                    <h4><?php echo $name; ?></h4>
                    <p><?php echo $desc; ?></p>
                    <p>₹<?php echo $price; ?></p>

                    <!-- Buy Now Button -->
                    <form action="cart.php" method="POST">
                        <input type="hidden" name="product_id" value="<?php echo $id; ?>">
                        <input type="hidden" name="product_name" value="<?php echo htmlspecialchars($name); ?>">
                        <input type="hidden" name="product_price" value="<?php echo $price; ?>">
                        <input type="hidden" name="product_image" value="<?php echo $image; ?>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" name="add_to_cart" class="buy-now-btn">Buy Now</button>
                    </form>
                </div>

                <?php
            }
        } else {
            echo "<p>No products found.</p>";
        }
        ?>  
</div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    $(".wishlist-icon").on("click", function(e){
        e.preventDefault(); 
        var icon = $(this);
        var id = icon.data("id");
        var name = icon.data("name");
        var price = icon.data("price");
        var image = icon.data("image");

        $.ajax({
            url: "add_to_wishlist.php", 
            type: "POST",
            data: { id: id, name: name, price: price, image: image },
            success: function(response){
                alert(response);
                
                // Toggle heart icon
                if(icon.hasClass("fa-regular")){
                    icon.removeClass("fa-regular").addClass("fa-solid");
                } else {
                    icon.removeClass("fa-solid").addClass("fa-regular");
                }
            }
        });
    });
});
</script>
<script>
function addToCart(id, name, price, image) {
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "cart_ajax.php", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("✅ " + name + " added to cart!");
        }
    };
    xhr.send("product_id=" + id + "&product_name=" + encodeURIComponent(name) + "&product_price=" + price + "&product_image=" + encodeURIComponent(image) + "&quantity=1");
}
</script>
<?php include "../includes/footer.php"; ?>