<?php require("config.php");
require("session.php");

if (isset($_POST['registration'])) {

    $is_uploaded = false;

    if (isset($_FILES["file_upload"]["name"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "./user_images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {

            $is_uploaded = true;

            echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo "<h3>  Failed to upload image!</h3>";
        }
    }

    $uname =  $_POST['uname'];

    $email =  $_POST['email'];

    $pass =  $_POST['password'];

    $cpass =  $_POST['c_pass'];

    $phoneno =  $_POST['phoneno'];

    $u_type_id = 2;

    if ($is_uploaded == true) {
        $sql = "insert into users (u_name,email,u_profile,password,phone_no,u_type_id,created_at,created_by,updated_at,updated_by,is_active) values ('$uname','$email','$folder','$pass','$phoneno','$u_type_id',now(),'$last_id',now(),'$last_id',true)";
    } else {
        $sql = "insert into users (u_name,email,password,phone_no,u_type_id,created_at,created_by,updated_at,updated_by,is_active) values ('$uname','$email','$pass','$phoneno','$u_type_id',now(),'$last_id',now(),'$last_id',true)";
    }

    echo $sql;

    if ($pass === $cpass) {
        mysqli_query($conn, $sql);
        $last_id = mysqli_insert_id($conn);
        // var_dump($row);
        $_SESSION['email'] = $email;
        $_SESSION['id'] = $last_id;
        $_SESSION['uname'] = $uname;
        $_SESSION['password'] = $pass;
        $_SESSION['utype'] = $utype;
        $_SESSION['phoneno'] = $phoneno;
        header("location:dashboard.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Registration</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="index.php" class="logo d-flex align-items-center w-auto">
                                    <img src="assets/img/logo.png" alt="">
                                    <span class="d-none d-lg-block">NiceAdmin</span>
                                </a>
                            </div><!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                        <p class="text-center small">Enter your personal details to create account</p>
                                    </div>

                                    <form method="post" enctype="multipart/form-data" class="row g-3 needs-validation" novalidate>

                                        <!-- <div class="col-12">
                                            <label class="form-label">User Image</label>
                                            <div class="col-12">
                                                <input class="form-control" name="file_upload" type="file" id="formFile" />
                                            </div>
                                        </div> -->

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">User Name</label>
                                            <input type="text" name="uname" class="form-control" id="uname" required>
                                            <div class="invalid-feedback">Please, enter your User name!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourEmail" class="form-label">Your Email</label>
                                            <input type="email" name="email" class="form-control" id="email" required>
                                            <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" id="pass" required>
                                            <div class="invalid-feedback">Please, enter your Password!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Confirm Password</label>
                                            <input type="password" name="c_pass" class="form-control" id="c_pass" required>
                                            <div class="invalid-feedback">Please, enter your Password Again!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Phone No.</label>
                                            <input type="text" name="phoneno" class="form-control" id="phoneno" required>
                                            <div class="invalid-feedback">Please, enter your Phone no!</div>
                                        </div>

                                        <!-- <div class="col-12">
                                            <label for="yourName" class="form-label">User Type</label>
                                            <select name="utype" class="form-control" id="utype" required>
                                                <option value="User">User</option>
                                                <option value="Admin">Admin</option>
                                                <option value="Vendor">Vendor</option>
                                            </select>
                                        </div> -->

                                        <div class="col-12">
                                            <button name="registration" class="btn btn-primary w-100" type="submit">Create Account</button>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Already have an account? <a href="index.php">Log in</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                <!-- All the links in the footer should remain intact. -->
                                <!-- You can delete the links only if you purchased the pro version. -->
                                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                                Designed by <a href="https://bootstrapmade.com/">Virag Bavadiya</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>

        </div>
    </main><!-- End #main -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>