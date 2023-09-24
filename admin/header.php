<?php

session_start();
require("config.php");

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Dashboard - NiceAdmin</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link href="/e-commerce/admin/assets/img/favicon.png" rel="icon">
    <link href="/e-commerce/admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <link href="https:/fonts.gstatic.com" rel="preconnect">
    <link href="https:/fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link href="/e-commerce/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/e-commerce/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <link href="/e-commerce/admin/assets/css/style.css" rel="stylesheet">
    <style>
        .action-btn {
            font-size: 20px;
            margin: 0 5px;
        }
        .sidebar-nav .nav-link i{ font-size: 20px; }
        .action-btn-wrap {
            display: flex;
            justify-content: center;
            /* width: 50%; */
        }

        .datatable td {
            font-size: 14px;
        }

        .td-img {
            max-width: 80px;
            border-radius: 50%;
        }

        .logo img {
            max-height: 50px;
        }

        .btn-primary {
            background-color: #001F3F;
            border-color: #001F3F;
        }

        .btn-primary:hover {
            background-color: transparent;
            color: #001F3F;
            border-color: #001F3F;
        }

        .datatable-table {
            border-collapse: collapse;
            margin-top: 30px;
        }

        .datatable-table img {
            max-width: 80px;
            min-height: 50px;
            object-fit: cover
        }

        .datatable-table>tbody>tr>td {
            vertical-align: middle;
            text-align: center;
        }

        .datatable-table>thead>tr>th {
            text-align: center;
        }

        .datatable-selector {
            padding: 10px 5px;
            width: 80px;
            text-align: center;
            border-radius: 3px;
            margin-right: 10px
        }

        .datatable-input {
            border-radius: 3px;
            border-width: 1px;
        }

        .datatable-dropdown label {
            font-size: 14px;
            text-transform: capitalize;
        }

        .datatable-info {
            font-size: 14px;
        }

        @media (min-width: 1200px) {
            #footer {
                /* margin: auto; */
            }
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>

</head>

<body>

    <header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
            <a href="/e-commerce/admin/dashboard.php" class="logo d-flex align-items-center">
                <img src="/e-commerce/img/logo-color.png" alt="">
            </a>
        </div>

        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">

                <li class="nav-item d-block d-lg-none">
                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                        <i class="bi bi-search"></i>
                    </a>
                </li>

                <li class="nav-item dropdown pe-3">

                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                        <?php
                        $sql = "SELECT u.id,u.u_name,u.email,u.phone_no,u.u_profile,u.is_active,ut.type_name FROM users as u,user_type as ut where u.id = " . $_SESSION['id'];
                        $result = $conn->query($sql);
                        $row = mysqli_fetch_assoc($result);
                        ?>

                        <img src="/e-commerce/admin/<?php echo $row['u_profile']; ?>" alt="Profile" class="rounded-circle">

                        <span class="d-none d-md-block dropdown-toggle ps-2">
                            <?php echo $row['u_name']; ?> </span>

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                        <li class="dropdown-header">
                            <h6><?php echo $row['u_name']; ?></h6>
                            <span><?php echo $row['type_name']; ?></span>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="/e-commerce/admin/user_profile.php">
                                <i class="bi bi-person"></i>
                                <span>My Profile</span>
                            </a>
                        </li>

                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center" href="/e-commerce/admin/logout.php">
                                <i class="bi bi-box-arrow-right"></i>
                                <span>Sign Out</span>
                            </a>
                        </li>

                    </ul>
                </li>

            </ul>
        </nav>

    </header>
    <aside id="sidebar" class="sidebar">

        <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#" aria-expanded="false">
                    <i class="bi bi-menu-down"></i>
                    <span>Categories</span>
                    <i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="/e-commerce/admin/categories/all.php">
                            <i class="bi bi-circle"></i><span>All categories</span>
                        </a>
                    </li>
                    <li>
                        <a href="/e-commerce/admin/categories/create.php">
                            <i class="bi bi-circle"></i><span>Add New</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#variants-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-funnel"></i><span>Variants</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="variants-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="/e-commerce/admin/variants/all.php">
                            <i class="bi bi-circle"></i><span>All Variants</span>
                        </a>
                    </li>
                    <li>
                        <a href="/e-commerce/admin/variants/create.php">
                            <i class="bi bi-circle"></i><span>Add new</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#attributes-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-list-stars"></i><span>Attributes</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="attributes-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="/e-commerce/admin/attributes/all.php">
                            <i class="bi bi-circle"></i><span>All Attributes</span>
                        </a>
                    </li>
                    <li>
                        <a href="/e-commerce/admin/attributes/create.php">
                            <i class="bi bi-circle"></i><span>Add new</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#products-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-basket"></i><span>Products</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="products-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="/e-commerce/admin/products/all.php">
                            <i class="bi bi-circle"></i><span>All Products</span>
                        </a>
                    </li>
                    <li>
                        <a href="/e-commerce/admin/products/create.php">
                            <i class="bi bi-circle"></i><span>Add new</span>
                        </a>
                    </li>
                </ul>
            </li>

        </ul>

    </aside>