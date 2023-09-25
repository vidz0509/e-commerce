<?php
if (session_id() === "") session_start();
require('config.php');

$total = 0;
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    $total = count(($_SESSION['cart']));
} else if ($_SESSION['id'] && $_SESSION['id'] != "") {
    $cart_sql = "SELECT COUNT(id) as totalCartItems FROM `cart` where user_id=" . $_SESSION['id'];
    $cart_result = $conn->query($cart_sql);
    $cart_row = mysqli_fetch_assoc($cart_result);
    $total = $cart_row['totalCartItems'];
}
if (isset($_SESSION['id']) && $_SESSION['id'] != "") {
    $sql = "SELECT * from users where id = " . $_SESSION['id'];
    $result = $conn->query($sql);
    $row = mysqli_fetch_assoc($result);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Brocode - Carting</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/e-commerce/img/brocode_logo.jpg" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
        .site-logo {
            max-width: 200px;
        }

        .navbar-expand-lg .navbar-nav .nav-link {
            padding-right: 1.5rem;
            padding-left: 1.5rem;
        }

        .custom-dark-btn {
            background-color: #063f6c;
        }

        .shop-row .product-img img {
            max-width: 150px;
        }

        .img-wrap {
            max-height: 200px;
        }

        .loader {
            width: 48px;
            height: 48px;
            border: 5px solid #FFF;
            border-bottom-color: transparent;
            border-radius: 50%;
            display: inline-block;
            box-sizing: border-box;
            animation: rotation 1s linear infinite;
            top: 50%;
            position: absolute;
            left: 50%;
        }

        .loader-wrap {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(16, 16, 16, 0.26);
            z-index: 9;
            display: none;
        }

        .product-item {
            border: 1px solid #e4e4e4;
            border-radius: 5px;
            min-height: 320px;
        }

        .alertify-notifier .ajs-message.ajs-success,
        .alertify-notifier .ajs-message.ajs-error {
            color: #fff;
            font-size: 14px;
            width: 300px;
            right: 300px !important;
            text-align: center;
            padding: 10px;
        }

        @keyframes rotation {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>

<body>
    <!-- Topbar Start -->
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-white mb-30">
        <div class="row px-xl-5">
            <div class="col-lg-4 d-flex align-items-center">
                <a href="/e-commerce/">
                    <img src="/e-commerce/img/logo-color.png" class="site-logo" />
                </a>
            </div>
            <div class="col-lg-8">
                <nav class="navbar navbar-expand-lg bg-white navbar-white py-3 py-lg-0 px-0">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-3 site-nav">
                            <a href="index.php" class="nav-item nav-link text-dark">Home</a>
                            <a href="about.php" class="nav-item nav-link text-dark">About Us</a>
                            <a href="shop.php" class="nav-item nav-link text-dark">Shop</a>
                            <a href="contact.php" class="nav-item nav-link text-dark">Contact Us</a>
                            <?php
                            if (isset($_SESSION['id']) && $_SESSION['id'] != "") {
                            ?>
                                <a href="/e-commerce/my_account.php" class="nav-link nav-item text-dark">Account</a>
                            <?php } else { ?>
                                <a href="/e-commerce/login.php" class="nav-link nav-item text-dark">Login</a>
                            <?php }
                            ?>

                        </div>
                        <a href="cart.php" class="btn btn-lg">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span id="cart-text" class="badge text-primary border border-primary rounded-circle" style="padding-bottom: 2px;"><?php echo $total; ?></span>
                        </a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    </div>