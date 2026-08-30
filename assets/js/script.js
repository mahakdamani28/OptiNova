document.addEventListener("DOMContentLoaded", function () {
  // ===== Modal Functions =====
  function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.style.display = "block";
  }

  function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) modal.style.display = "none";
  }

  // Modal triggers
  document.getElementById("openEyeglassSlider")?.addEventListener("click", () => openModal("shapeModal"));
  document.getElementById("openSunglassSlider")?.addEventListener("click", () => openModal("genderModal"));
  document.getElementById("openLensesSlider")?.addEventListener("click", () => openModal("typeModal"));

  document.querySelectorAll('.close').forEach(btn => {
    btn.addEventListener('click', function () {
      const id = this.dataset.modal;
      const modal = id ? document.getElementById(id) : this.closest('.modal');
      if (modal) modal.style.display = 'none';
    });
  });

  // Close modal when clicking outside
  window.onclick = function (event) {
    document.querySelectorAll(".modal").forEach(modal => {
      if (event.target === modal) modal.style.display = "none";
    });
  };

  // ===== Heart icon toggle =====
  document.querySelectorAll('.wishlist-icon').forEach(icon => {
    icon.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      this.classList.toggle('fa-regular');
      this.classList.toggle('fa-solid');
    });
  });

  // ===== Bag icon toggle =====
  document.querySelectorAll('.bag-icon').forEach(icon => {
    icon.addEventListener('click', function (event) {
      event.preventDefault();
      event.stopPropagation();
      this.classList.toggle('active-bag');
    });
  });

  // ===== Buy Now button redirect =====
  document.querySelectorAll('.buy-now-btn').forEach(button => {
    button.addEventListener('click', function () {
      let productId = this.getAttribute('data-product-id');
      window.location.href = `cart.php?id=${productId}`;
    });
  });

  // ===== Appointment Alert =====
  if (localStorage.getItem("appointmentConfirmed") === "true") {
    alert("Your appointment has been confirmed");
    localStorage.removeItem("appointmentConfirmed");
  }

  // ===== Hero Slider =====
  let slides = document.querySelectorAll(".slide");
  let dots = document.querySelectorAll(".dot");
  let index = 0;

  function showSlide(n) {
    slides.forEach((slide, i) => {
      slide.classList.toggle("active", i === n);
      dots[i].classList.toggle("active", i === n);
    });
  }

  function nextSlide() {
    index = (index + 1) % slides.length;
    showSlide(index);
  }

  dots.forEach((dot, i) => {
    dot.addEventListener("click", () => {
      index = i;
      showSlide(index);
    });
  });

  if (slides.length > 0) {
    showSlide(index);
    setInterval(nextSlide, 3000);
  }

  // ===== Promo Sliders (multiple) =====
  document.querySelectorAll(".promo-banner").forEach((banner) => {
    let promoSlides = banner.querySelectorAll(".promo-slide");
    let promoDots = banner.querySelectorAll(".promo-dot");
    let promoIndex = 0;

    function showPromoSlide(n) {
      promoSlides.forEach((slide, i) => {
        slide.classList.toggle("active", i === n);
        promoDots[i].classList.toggle("active", i === n);
      });
    }

    function nextPromoSlide() {
      promoIndex = (promoIndex + 1) % promoSlides.length;
      showPromoSlide(promoIndex);
    }

    if (promoSlides.length > 0) {
      showPromoSlide(promoIndex);
      setInterval(nextPromoSlide, 2000);

      promoDots.forEach((dot, i) => {
        dot.addEventListener("click", () => {
          promoIndex = i;
          showPromoSlide(promoIndex);
        });
      });
    }
  });

  // ===== Search Box Dropdown and Placeholder Loop =====
  const searchBox = document.getElementById("searchBox");
  const dropdown = document.getElementById("searchDropdown");

  // Show dropdown on focus
  searchBox.addEventListener("focus", () => {
    dropdown.style.display = "block";
  });

  // Hide dropdown when clicking outside
  document.addEventListener("click", (e) => {
    if (!e.target.closest(".nav-search")) {
      dropdown.style.display = "none";
    }
  });

  // Fill input when clicking on a suggestion
  document.querySelectorAll("#searchDropdown li").forEach(item => {
    item.addEventListener("click", () => {
      searchBox.value = item.textContent;
      dropdown.style.display = "none";
    });
  });

  // Placeholder rotation
  const placeholders = [
    "Round Eyeglasses",
    "Square Eyeglasses",
    "Browline Eyeglasses",
    "Cateye Eyeglasses",
    "Men Sunglasses",
    "Women Sunglasses",
    "Kids Sunglasses",
    "Clear Contact Lenses",
    "Color Contact Lenses",
    "Solutions & Accessories",
    "Eye Appointment"
  ];

  let phIndex = 0;
  let interval;

  function startLoop() {
    interval = setInterval(() => {
      searchBox.style.opacity = 0;
      setTimeout(() => {
        searchBox.placeholder = placeholders[phIndex];
        searchBox.style.opacity = 1;
        phIndex = (phIndex + 1) % placeholders.length;
      }, 400);
    }, 2000);
  }

  // Start rotating
  startLoop();

  // Pause rotation when typing
  searchBox.addEventListener("focus", () => clearInterval(interval));
  searchBox.addEventListener("blur", startLoop);
});

/* ===== Back Button Function ===== */
function goBack() {
  if (window.history.length > 1) {
    window.history.back();
  } else {
    window.location.href = "/index.php";
  }
}

/* ===== Add to Cart Function ===== */
function addToCart(id, name, price, image) {
  fetch("cart_ajax.php", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `product_id=${id}&product_name=${encodeURIComponent(name)}&product_price=${price}&product_image=${encodeURIComponent(image)}&quantity=1`
  })
    .then(res => res.text())
    .then(data => {
      if (data.trim() === "success") {
        alert("Item added to cart!");
        let button = document.querySelector(`button[onclick*="${id}"] .bag-icon`);
        if (button) button.classList.add("added-to-cart");
      }
    })
    .catch(err => console.error(err));
}