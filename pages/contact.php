<?php include '../includes/header.php'; ?>
<button class="back-btn" onclick="goBack()">← Back</button>
<link rel="stylesheet" href="/assets/css/styles.css">
<script src="/assets/js/script.js" defer></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<section class="contact-page">
  <?php if (isset($_GET['success'])): ?>
  <div class="success-msg">
      ✅ Message sent successfully!
  </div>
<?php endif; ?>

  <div class="contact-header">
    <h1>Contact Us</h1>
    <p>We’d love to hear from you! Fill out the form below or reach us directly via our contact details.</p>
  </div>

  <div class="contact-container">
    <!-- Contact Form -->
    <div class="contact-form">
      <form action="send_message.php" method="POST">
        <div class="form-group">
          <label for="name">Full Name</label>
          <input type="text" name="name" id="name" required>
        </div>

        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" name="email" id="email" required>
        </div>

        <div class="form-group">
          <label for="message">Your Message</label>
          <textarea name="message" id="message" rows="5" required></textarea>
        </div>

        <button type="submit" class="btn-submit">Send Message</button>
      </form>
    </div>

    <!-- Contact Info -->
    <div class="contact-info">
      <h3>Get in Touch</h3>
      <p><i class="fa-solid fa-location-dot"></i> OptiNova HQ, Nagpur, Maharashtra, India</p>
      <p><i class="fa-solid fa-phone"></i> +91 98765 43210</p>
      <p><i class="fa-solid fa-envelope"></i> optinova83@gmail.com</p>

      <h3>Follow Us</h3>
      <div class="social-links">
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-twitter"></i></a>
      </div>
    </div>
  </div>
</section>
<?php include '../includes/footer.php'; ?>
