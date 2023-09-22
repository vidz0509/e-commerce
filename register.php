<?php
require("config.php");
require("session.php");

if (isset($_POST['register'])) {

    $uname =  $_POST['uname'];

    $email =  $_POST['email'];

    $pass =  $_POST['password'];

    $cpass =  $_POST['cpass'];

    $phoneno =  $_POST['phoneno'];

    $u_type_id = 3;

    if ($is_uploaded == true) {
        $sql = "insert into users (u_name,email,u_profile,password,phone_no,u_type_id,created_at,updated_at,is_active) values ('$uname','$email','$folder','$pass','$phoneno','$u_type_id',now(),now(),true)";
    } else {
        $sql = "insert into users (u_name,email,password,phone_no,u_type_id,created_at,updated_at,is_active) values ('$uname','$email','$pass','$phoneno','$u_type_id',now(),now(),true)";
    }
    mysqli_query($conn, $sql);

    if ($pass === $cpass) {

        $last_id = mysqli_insert_id($conn);
        $_SESSION['id'] = $last_id;
        $update_user = "update users set created_by = $last_id, updated_by = $last_id where id= $last_id";
        mysqli_query($conn, $update_user);
        // var_dump($row);
        header("location:index.php");
     
    }
    else {
        $msg = "please enter your user id and password current password";
    }
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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>

    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <img heigh="100px" width="100px" src="/e-commerce/img/brocode_logo.jpg" alt="">
                            </div>

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Make An Account</h5>
                                        <p class="text-center small">Fill the below fields</p>
                                    </div>

                                    <form method="post" class="row g-3 needs-validation" validate>

                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Name</label>
                                            <div class="input-group has-validation">
                                                <input type="text" name="uname" class="form-control" id="yourUsername" required>
                                                <div class="invalid-feedback">Please enter your username.</div>
                                            </div>
                                        </div>


                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Email</label>
                                            <div class="input-group has-validation">
                                                <input type="email" name="email" class="form-control" id="yourUsername" required>
                                                <div class="invalid-feedback">Please enter your username.</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" id="pass" required>
                                            <div class="invalid-feedback">Please enter your password!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Confirm Password</label>
                                            <input type="password" name="cpass" class="form-control" id="pass" required>
                                            <div class="invalid-feedback">Please enter your password!</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Phone No.</label>
                                            <input type="phoneno" name="phoneno" class="form-control" id="phoneno" required>
                                            <div class="invalid-feedback">Please enter your password!</div>
                                        </div>

                                        <div class="col-12">
                                            <br><button name="register" class="btn btn-primary w-100" type="submit">Sign In</button>
                                        </div>

                                        <div class="col-12">
                                            <br>
                                            <p class="small mb-0">Don't have account? <a href="login.php">Already have an account</a></p>
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

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>

</html>