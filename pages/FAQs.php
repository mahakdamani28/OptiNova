<?php
include "../includes/header.php";
?>
<button class="back-btn" onclick="goBack()">← Back</button>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQs - Optinova</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f9f9f9;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 80%;
      max-width: 900px;
      margin: 40px auto;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      padding: 30px;
    }
    .container h1 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 20px;
      font-size: 30px;
    }
    .faq {
      margin-bottom: 15px;
    }
    .faq button {
      width: 100%;
      background: #2c3e50;
      color: #fff;
      border: none;
      outline: none;
      padding: 15px;
      font-size: 16px;
      text-align: left;
      cursor: pointer;
      border-radius: 6px;
      transition: background 0.3s ease;
    }
    .faq button:hover {
      background: #34495e;
    }
    .faq-content {
      display: none;
      padding: 15px;
      background: #ecf0f1;
      border-radius: 0 0 6px 6px;
      margin-top: -6px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Frequently Asked Questions</h1>
    <?php
    $faqs = $faqs = [
  [
    "question" => "What types of eyewear does Optinova sell?",
    "answer" => "We offer prescription eyeglasses, sunglasses, contact lenses, and a wide range of accessories and cleaning solutions."
  ],
  [
    "question" => "Can I add my prescription to sunglasses?",
    "answer" => "Yes, we provide prescription lenses for most of our sunglass frames. Simply upload your prescription during checkout."
  ],
  [
    "question" => "Do you offer blue light filter lenses?",
    "answer" => "Absolutely! Blue light filter lenses are available for both prescription and non-prescription eyewear."
  ],
  [
    "question" => "How long does delivery take?",
    "answer" => "Standard delivery takes 5–7 business days, while prescription eyewear may take 7–10 business days depending on lens customization."
  ],
  [
    "question" => "What is your return policy?",
    "answer" => "We accept returns within 14 days of delivery as long as the product is unused and in original condition. Prescription lenses may not be refundable."
  ],
  [
    "question" => "Do you provide warranty on frames and lenses?",
    "answer" => "Yes, all products come with a 6-month manufacturer warranty against defects."
  ],
  [
    "question" => "How do I clean my glasses properly?",
    "answer" => "Use our Optinova cleaning solution with a microfiber cloth. Avoid using paper towels or clothing as they may scratch your lenses."
  ],
  [
    "question" => "Do you offer home eye testing services?",
    "answer" => "Yes, in select locations we provide at-home eye check-ups. You can schedule an appointment through our website."
  ],
  [
    "question" => "Can I track my order?",
    "answer" => "Of course! Once your order is shipped, you will receive a tracking link via email and SMS."
  ],
  [
    "question" => "Do you ship internationally?",
    "answer" => "Yes, we ship to multiple countries. International shipping times and charges vary depending on your location."
  ],
  [
    "question" => "Can I use my insurance for eyewear purchases?",
    "answer" => "Yes, we accept most vision insurance providers. You can upload your insurance details at checkout or contact our support for help."
  ],
];
   
    foreach ($faqs as $index => $faq) {
      echo '<div class="faq">';
      echo '<button onclick="toggleFAQ(' . $index . ')">' . $faq["question"] . '</button>';
      echo '<div class="faq-content" id="faq-' . $index . '">' . $faq["answer"] . '</div>';
      echo '</div>';
    }
    ?>
  </div>
  <script>
    function toggleFAQ(id) {
      const content = document.getElementById("faq-" + id);
      content.style.display = (content.style.display === "block") ? "none" : "block";
    }
  </script>
  <?php include("../includes/footer.php"); ?>
</body>
</html>
