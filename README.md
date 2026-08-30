# 🕶️ OptiNova

OptiNova is a full-stack eyewear e-commerce website developed as a final-year BCCA project. It provides an online platform where users can explore eyewear products, manage their accounts, add products to their cart and wishlist, place orders, and access customer services.

The project also includes a dedicated admin panel for managing products, users, and orders.

---

## ✨ Features

### 👤 User Features

- User registration and login
- User dashboard and profile
- Browse eyeglasses by frame style:
  - Browline
  - Cat-eye
  - Round
  - Square
- Browse sunglasses:
  - Men's sunglasses
  - Women's sunglasses
  - Kids' sunglasses
- Browse contact lenses:
  - Color lenses
  - Transparent lenses
- Accessories and solutions
- Product browsing and selection
- Wishlist management
- Add products to cart
- Move wishlist items to cart
- Remove items from wishlist
- Checkout
- Order placement
- Order history
- UPI payment
- Appointment booking
- Shipping information
- Returns information
- FAQs
- Contact/message functionality
- Privacy Policy
- Terms & Conditions

---

## 🛠️ Admin Features

OptiNova includes a separate admin panel for managing the e-commerce platform.

- Admin authentication
- Admin dashboard
- Manage products
- Edit products
- Manage users
- Manage orders
- Admin logout

---

## 💻 Technologies Used

### Frontend

- HTML5
- CSS3
- JavaScript

### Backend

- PHP

### Database

- MySQL

### Development Environment

- WAMP Server
- Apache
- MySQL

### Version Control

- Git
- GitHub

---

## 📁 Project Structure

```text
OptiNova/
│
├── admin/
│   ├── adashboard.php
│   ├── admin.php
│   ├── alogout.php
│   ├── auth.php
│   ├── edit_products.php
│   ├── logout.php
│   ├── manage_orders.php
│   ├── manage_products.php
│   └── manage_users.php
│
├── assets/
│   ├── css/
│   │   └── styles.css
│   └── js/
│       └── script.js
│
├── images/
│   ├── eyeglasses/
│   ├── sunglasses/
│   ├── lens/
│   ├── solutionsncases/
│   └── indeximgs/
│
├── includes/
│   ├── header
│   └── footer
│
├── pages/
│   └── website pages
│
├── config.php
├── db.php
├── dashboard.php
├── index.php
├── login.php
├── logout.php
├── register.php
├── .gitignore
└── README.md
```

---

## 🗄️ Database

OptiNova uses MySQL as its database.

The application connects to MySQL through `db.php`, while the database configuration is stored separately in `config.php`.

For security, `config.php` is excluded from Git using `.gitignore`.

A database SQL file will be added to this repository so that the OptiNova database can be recreated when setting up the project.

---

## ⚙️ Running OptiNova Locally

### Prerequisites

- WAMP Server
- Git
- Web browser

### 1. Clone the repository

```bash
git clone https://github.com/mahakdamani28/OptiNova.git
```

### 2. Move the project

Place the project inside the WAMP `www` directory:

```text
C:\wamp64\www\OptiNova
```

### 3. Start WAMP

Start the following services:

- Apache
- MySQL

Make sure both services are running.

### 4. Create the database

Open **phpMyAdmin** and create a database named:

```text
optinova_db
```

Import the provided SQL database file into the database.

### 5. Configure the database

Create a local `config.php` file with your database credentials.

Example:

```php
<?php

return [
    'servername' => 'localhost',
    'username'   => 'root',
    'password'   => '',
    'dbname'     => 'optinova_db'
];
```

> **Important:** Do not commit your local `config.php` file to GitHub.

### 6. Open the website

Open the following URL in your browser:

```text
http://localhost/
```

---

## 📸 Screenshots

Screenshots of the OptiNova website will be added here.

### Homepage

_Add homepage screenshot here._

### Product Page

_Add product page screenshot here._

### Shopping Cart

_Add cart screenshot here._

### Admin Dashboard

_Add admin dashboard screenshot here._

---

## 🔐 Security

- Database configuration is separated from the main database connection file.
- Local database credentials are excluded from Git using `.gitignore`.
- User passwords are handled using password hashing and verification.
- Admin authentication uses PHP sessions.

---

## 🚀 Future Improvements

- Deploy the application to a production PHP/MySQL hosting environment
- Add online payment gateway integration
- Improve responsive design
- Add product search and advanced filtering
- Add email notifications
- Improve production security
- Add automated testing

---

## 🎓 Project Information

**Project:** OptiNova

**Type:** Final-Year BCCA Project

**Category:** E-commerce / Eyewear

**Backend:** PHP

**Database:** MySQL

**Frontend:** HTML, CSS, JavaScript

---

## 👩‍💻 Authors

**Mahak Damani**

GitHub: https://github.com/mahakdamani28

**Jiya Bavse**

GitHub: https://github.com/jiyabavse27

---

## 📄 License

This project was developed as an academic project.