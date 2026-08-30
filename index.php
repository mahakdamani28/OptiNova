<?php include "includes/header.php"; ?>
<link rel="stylesheet" href="assets/css/styles.css">
<script src="assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<br>
    <!-- Hero Banner -->
   <section class="hero">
    <div class="hero-banner">
        <img src="images/indeximgs/banner.jpg" alt="Stylish Eyewear">
        <div class="hero-overlay">
            <h1>Trendy Eyewear for Every Mood</h1>
            <p>Frames That Define You.</p>
            <p>1000+ Styles | UV Protected | Try at Home</p>
        </div>
    </div>
</section>
<!-- Categories -->
<section class="categories container">
  <h2 class="hero-heading">Shop by Category</h2>
  <div class="category-grid">
    <div class="category-item" id="eyeglasses-category">
      <img src="images/indeximgs/eyeglasses.jpg" alt="Eyeglasses" id="openEyeglassSlider" style="cursor:pointer;">
      <h3>Eyeglasses👓</h3>
    </div>
    <div class="category-item" id="sunglasses-category">
      <img src="images/indeximgs/sunglasses.jpg" alt="Sunglasses" id="openSunglassSlider" style="cursor:pointer;">
      <h3>Sunglasses🕶</h3>
    </div>
    <div class="category-item" id="lenses-category">
      <img src="images/indeximgs/lens.jpg" alt="Lenses" id="openLensesSlider" style="cursor:pointer;">
        <h3>Lenses👀</h3>
    </div>
  </div>
</section>   
<!-- Eyeglass Shape Modal -->
<div id="shapeModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('shapeModal')">&times;</span>
    <h2> Eyeglasses👓</h2>
    <div class="sale-banner">END OF SEASON SALE</div>
    <div class="shapes-grid">
      <div class="shape-card">
         <a href="pages/cateye-eyeglasses.php" class="shape-card">
        <img src="images/indeximgs/cateyemodal.jpg" alt="Cat-Eye">
        <p>Cat-Eye</p></a></div>
      <div class="shape-card">
         <a href="pages/round-eyeglasses.php" class="shape-card">
        <img src="images/indeximgs/roundmodal.jpg" alt="Round">
        <p>Round</p></a></div>
      <div class="shape-card">
        <a href="pages/square-eyeglasses.php" class="shape-card">
        <img src="images/indeximgs/squaremodal.jpg" alt="Square">
        <p>Square</p></a></div>
      <div class="shape-card">
        <a href="pages/browline-eyeglasses.php" class="shape-card">
        <img src="images/indeximgs/browlinemodal.jpg" alt="Browline">
        <p>Browline</p></a></div>
    </div></div></div></div>
<!-- Sunglasses categories -->
 <div id="genderModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('genderModal')">&times;</span>
    <h2> Sunglasses🕶</h2>
    <div class="sale-banner">END OF SEASON SALE</div>
    <div class="shapes-grid">
      <div class="shape-card">
        <a href="pages/men-sunglasses.php" class="category-link">
          <img src="images/sunglasses/men/menmodal.jpg" alt="Men">
        <p>Men</p></a></div>
      <div class="shape-card">
        <a href="pages/women-sunglasses.php" class="category-link">
        <img src="images/sunglasses/women/womenmodal.jpg" alt="women">
        <p>Women</p></a></div>
      <div class="shape-card">
        <a href="pages/kids-sunglasses.php" class="category-link">
        <img src="images/sunglasses/kids/kidsmodal.jpg" alt="Kids">
        <p>Kids</p></a></div>
      </div></div></div>  
<!-- lenses categories -->
 <div id="typeModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('typeModal')">&times;</span>
    <h2>Lenses👀</h2>
    <div class="sale-banner">END OF SEASON SALE</div>
    <div class="shapes-grid">
      <div class="shape-card">
        <a href="pages/clear-lens.php" class="category-link">
        <img src="images/lens/transparent/modalllens.jpg" alt="Clear">
        <p>Clear</p></a></div>
      <div class="shape-card">
        <a href="pages/color-lens.php" class="category-link">
        <img src="images/lens/color/colormodal.jpg" alt="Color">
        <p>Color</p></a></div>
      <div class="shape-card">
        <a href="pages/accessories&solu-lens.php" class="category-link">
        <img src="images/solutionsncases/solutionmodal.jpg" alt="Accessories">
        <p>Solution & Accessories</p></a></div>
    </div></div> </div>  

    <div class="banner-slider">
  <div class="slides">
    <div class="slide">
      <img src="images/indeximgs/banner3.jpg" alt="Banner 1">
    </div>
    <div class="slide">
      <img src="images/indeximgs/banner4.jpg" alt="Banner 2">
    </div>
    <div class="slide">
      <img src="images/indeximgs/banner5.jpg" alt="Banner 3">
    </div>
  
  <div class="dots">
    <span class="dot active"></span>
    <span class="dot"></span>
    <span class="dot"></span>
  </div></div></div>

<br>
<br>
<section class="hero">
    <div class="hero-banner">
      <h2 class="hero-heading">Book An Appointment</h2>
     <img src="images/indeximgs/bookanapp.jpg" alt="Stylish Eyewear">
     <div class="hero-overlay">
    <h2>Book Your Appointment</h2>
    <p>Schedule your eye test in just a few clicks.</p>
    <button><a href="pages/appointment.php" class="book-btn">Book Now</a></button>
  </div></div></section>
<br>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Stylish Eyeglasses</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib28.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib29.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib30.jpg" alt="Banner 3">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib31.jpg" alt="Banner 4">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib32.jpg" alt="Banner 5">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib33.jpg" alt="Banner 6">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">RayBan Men Premium</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib1.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib4.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib3.jpg" alt="Banner 3">
    </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">RayBan Women Premium</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib20.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib21.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib22.jpg" alt="Banner 3">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib23.jpg" alt="Banner 4">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">RayBan Kids Premium</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib2.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib5.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib6.jpg" alt="Banner 3">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

   <div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Vincent Chase</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib7.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib8.jpg" alt="Banner 2">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
    </div></div></div>
 
<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Bausch + Lomb Exclusive</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib9.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib10.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib11.jpg" alt="Banner 3">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Aquacolor Color Lenses</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib13.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib14.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib12.jpg" alt="Banner 3">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Aqualens Clear Lenses</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib15.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib16.jpg" alt="Banner 2">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib17.jpg" alt="Banner 3">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Solutions</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib18.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib19.jpg" alt="Banner 2">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Lens Cases</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib26.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib27.jpg" alt="Banner 2">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<div class="promo-banner">
  <div class="promo-heading-wrap">
    <h2 class="promo-heading">Glass Cases</h2>
  </div>

  <div class="promo-slider">
    <div class="promo-slides">
      <div class="promo-slide active"> 
        <img src="images/indeximgs/banners/ib24.jpg" alt="Banner 1">
      </div>
      <div class="promo-slide">
        <img src="images/indeximgs/banners/ib25.jpg" alt="Banner 2">
      </div></div>

    <div class="promo-dots">
      <span class="promo-dot active"></span>
      <span class="promo-dot"></span>
    </div></div></div>

<?php include "includes/footer.php"; ?>