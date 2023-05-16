<?php require("config.php");
require("session.php");

if (isset($_POST['registration'])) {

    $uname =  $_POST['uname'];

    $fname =  $_POST['fname'];

    $lname =  $_POST['lname'];

    $email =  $_POST['email'];

    $pass =  $_POST['pass'];

    $cpass =  $_POST['c_pass'];

    $phoneno =  $_POST['phoneno'];

    $address =  $_POST['address'];

    $country =  $_POST['country'];

    $utype = 'assistant';

    $sql = "insert into users (uname,fname,lname,email,password,phoneno,address,country,created_on,updated_on,last_login,user_type,is_active) values ('$uname','$fname','$lname','$email','$pass','$phoneno','$address','$country',now(),now(),now(),'$utype',true)";

    if ($pass === $cpass) {
        mysqli_query($conn, $sql);
        $last_id = mysqli_insert_id($conn);
        // var_dump($row);
        $_SESSION['email'] = $email;
        $_SESSION['id'] = $last_id;
        $_SESSION['uname'] = $uname;
        $_SESSION['fname'] = $fname;
        $_SESSION['utype'] = $utype;
        $_SESSION['address'] = $address;
        $_SESSION['country'] = $country;
        $_SESSION['phoneno'] = $phoneno;
        header("location:dashboard.php");
    }
} else {
    echo "Your password didn't match";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pages / Register - NiceAdmin Bootstrap Template</title>
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
                                <a href="index.html" class="logo d-flex align-items-center w-auto">
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

                                    <form method="post" class="row g-3 needs-validation" novalidate>
                                        <div class="col-12">
                                            <label for="yourName" class="form-label">User Name</label>
                                            <input type="text" name="uname" class="form-control" id="uname" required>
                                            <div class="invalid-feedback">Please, enter your User name!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">First Name</label>
                                            <input type="text" name="fname" class="form-control" id="fname" required>
                                            <div class="invalid-feedback">Please, enter your First name!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Last Name</label>
                                            <input type="text" name="lname" class="form-control" id="lname" required>
                                            <div class="invalid-feedback">Please, enter your Last name!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourEmail" class="form-label">Your Email</label>
                                            <input type="email" name="email" class="form-control" id="email" required>
                                            <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Password</label>
                                            <input type="password" name="pass" class="form-control" id="pass" required>
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

                                        <div class="col-12">
                                            <label for="inputEmail" class="form-label">Address</label>
                                            <div class="col-sm-12">
                                                <textarea class="form-control" name="address"></textarea>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Country</label>
                                            <input type="text" name="country" class="form-control" id="country" required>
                                            <div class="invalid-feedback">Please, enter your Country!</div>
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