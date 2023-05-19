<?php require('config.php');
include('header.php');

$id = $_GET['id'];

if (isset($_POST['edit_user'])) {

    $fname =  $_POST['fname'];

    $utype =  $_POST['utype'];

    $country =  $_POST['country'];

    $address =  $_POST['address'];

    $phoneno =  $_POST['phoneno'];

    $email =  $_POST['email'];

    $current_user_id = $_SESSION['id'];

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = './user_images/' . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $user_query = "Update users Set fname='$fname', user_type='$utype',country='$country',address='$address',phoneno='$phoneno',
            email='$email',u_image='$folder',updated_on = now(),last_login = now() where id=" . $_SESSION['id'];
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    } else {
        $user_query = "Update users Set fname='$fname', user_type='$utype',country='$country',address='$address',phoneno='$phoneno',
        email='$email',updated_on = now(),last_login = now() where id=" . $_SESSION['id'];
    }
    echo $user_query;

    if (mysqli_query($conn, $user_query)) {
        $message = '<div class="alert alert-success">User updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}

$sql = "SELECT * FROM users where id = " . $_SESSION['id'];
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

?>

<?php

if (isset($_POST['edit_pass'])) {

    $curpass =  $_POST['curpassword'];

    $newpass =  $_POST['newpassword'];

    $renewpass =  $_POST['renewpassword'];

    if ($curpass === $_SESSION['password']) {
        if ($newpass === $renewpass) {
            $pass_query = "Update users set password = '$newpass' where id = " . $_SESSION['id'];
        } else {
            echo "password didn't match";
        }

        echo $pass_query;

        if (mysqli_query($conn, $pass_query)) {
            $message = '<div class="alert alert-success">Password updated successfully!</div>';
        } else {
            $message = '<div class="alert alert-danger">Your Password is Not Matched.' . $sql . '</div>';
        }
    }
}

$sql = "SELECT * FROM users where id = " . $_SESSION['id'];
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Profile</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item">Users</li>
                <li class="breadcrumb-item active">Profile</li>
            </ol>
        </nav>
    </div>

    <?php if (isset($message)) : ?>
        <div class="alert alert-success"><?php echo $message; ?></div>
    <?php endif; ?>

    <section class="section profile">
        <div class="row">
            <div class="col-xl-4">

                <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                        <img src="<?php echo $row['u_image']; ?>" alt="Profile" class="rounded-circle">
                        <h2><?php echo $_SESSION['uname']; ?></h2>
                        <h3><?php echo $_SESSION['utype']; ?></h3>

                    </div>
                </div>

            </div>

            <div class="col-xl-8">

                <div class="card">
                    <div class="card-body pt-3">

                        <ul class="nav nav-tabs nav-tabs-bordered">

                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                            </li>

                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                            </li>

                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                            </li>

                        </ul>


                        <div class="tab-content pt-2">

                            <div class="tab-pane fade show active profile-overview" id="profile-overview">

                                <form method="post" enctype="multipart/form-data">

                                    <h5 class="card-title">Profile Details</h5>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label ">First Name</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['fname']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">User Type</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['utype']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Country</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['country']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Address</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['address']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Phone</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['phoneno']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Email</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $_SESSION['email']; ?></div>
                                    </div>

                                </form>

                            </div>

                            <div class="tab-pane fade profile-edit pt-3" id="profile-edit">


                                <form method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                        <div class="col-md-8 col-lg-9">
                                            <img src="<?php echo $row['u_image']; ?>" alt="Profile">
                                            <input class="form-control" name="file_upload" type="file" id="formFile" />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="fname" type="text" class="form-control" id="fullName" value="<?php echo $row['fname']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Job" class="col-md-4 col-lg-3 col-form-label">User Type</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="utype" type="text" class="form-control" id="Job" value="<?php echo $row['user_type']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="country" type="text" class="form-control" id="Country" value="<?php echo $row['country']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="address" type="text" class="form-control" id="Address" value="<?php echo $row['address']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="phoneno" type="text" class="form-control" id="Phone" value="<?php echo $row['phoneno']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="email" type="email" class="form-control" id="Email" value="<?php echo $row['email']; ?>">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" name="edit_user" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form>

                            </div>

                            <div class="tab-pane fade pt-3" id="profile-change-password">

                                <form method="post" enctype="multipart/form-data">

                                    <div class="row mb-3">
                                        <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="curpassword" type="password" class="form-control" id="currentPassword">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="newpassword" type="password" class="form-control" id="newPassword">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" name="edit_pass" class="btn btn-primary">Change Password</button>
                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>

</main>

<?php include('footer.php'); ?>