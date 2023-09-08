<?php require('config.php');
include('header.php');

if (isset($_POST['edit_user'])) {

    $u_name =  $_POST['u_name'];

    $phoneno =  $_POST['phone_no'];

    $email =  $_POST['email'];

    $current_user_id = $_SESSION['id'];

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = './user_images/' . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $user_query = "Update users Set u_name='$u_name',phone_no='$phoneno',
            email='$email',u_profile='$folder',updated_at = now() where id=" . $_SESSION['id'];
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    } else {
        $user_query = "Update users Set u_name='$u_name',phone_no='$phoneno',
        email='$email',updated_at = now()where id=" . $_SESSION['id'];
    }
    echo $user_query;

    if (mysqli_query($conn, $user_query)) {
        $message = '<div class="alert alert-success">User updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}


if (isset($_POST['edit_pass'])) {

    $curpass =  $_POST['curpassword'];

    $newpass =  $_POST['newpassword'];

    $renewpass =  $_POST['renewpassword'];

    $userid = $_SESSION['id'];

    $sql =  "select * from users where id='$userid'";

    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    echo $row['password'];

    if ($curpass == $renewpass) {
        $message = '<div class="alert alert-secondary">Current password and new password cannot be same!</div>';
    } elseif ($curpass == trim($row['password'])) {
        if ($newpass === $renewpass) {
            $pass_query = "Update users set password = '$newpass' where id = " . $_SESSION['id'];
            if (mysqli_query($conn, $pass_query)) {
                $message = '<div class="alert alert-success">Password updated successfully!</div>';
            } else {
                $message = '<div class="alert alert-danger">Something went wrong!</div>';
            }
        } else {
            $message = '<div class="alert alert-danger">Your Password is Not Matched.</div>';
        }
    } else {
        $message = '<div class="alert alert-danger">Your Current Password is Incorrect!</div>';
    }
}

echo $sql;
$sql = "SELECT u.id,u.u_name,u.email,u.phone_no,u.u_profile,u.is_active,ut.type_name FROM users as u,user_type as ut where u.id = " . $_SESSION['id'];
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
        <?php echo $message; ?>
    <?php endif; ?>

    <section class="section profile">
        <div class="row">
            <div class="col-xl-4">

                <div class="card">
                    <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                        <img src="<?php echo $row['u_profile']; ?>" alt="Profile" class="rounded-circle">
                        <h2><?php echo $row['u_name']; ?></h2>
                        <h3><?php echo $row['type_name']; ?></h3>

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
                                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit
                                    Profile</button>
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
                                        <div class="col-lg-3 col-md-4 label ">User Name</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $row['u_name']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">User Type</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $row['type_name']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Phone</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $row['phone_no']; ?></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 label">Email</div>
                                        <div class="col-lg-9 col-md-8"><?php echo $row['email']; ?></div>
                                    </div>

                                </form>

                            </div>

                            <div class="tab-pane fade profile-edit pt-3" id="profile-edit">


                                
                            <form method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile
                                            Image</label>
                                        <div class="col-md-8 col-lg-9">
                                            <img src="<?php echo $row['u_profile']; ?>" alt="Profile">
                                            <input class="form-control" name="file_upload" type="file" id="formFile" />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="fullName" class="col-md-4 col-lg-3 col-form-label">User Name</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="u_name" type="text" class="form-control" id="username" value="<?php echo $row['u_name']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="phone_no" type="text" class="form-control" id="Phone" value="<?php echo $row['phone_no']; ?>">
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="email" type="email" class="form-control" id="Email" value="<?php echo $row['email']; ?>">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" name="edit_user" class="btn btn-primary">Save
                                            Changes</button>
                                    </div>
                                </form>

                            </div>

                            <div class="tab-pane fade pt-3" id="profile-change-password">

                                <form method="post" enctype="multipart/form-data">

                                    <div class="row mb-3">
                                        <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="curpassword" type="password" class="form-control" id="currentPassword" required>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="newpassword" type="password" class="form-control" id="newPassword" required>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New
                                            Password</label>
                                        <div class="col-md-8 col-lg-9">
                                            <input name="renewpassword" type="password" class="form-control" id="renewPassword" required>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" name="edit_pass" class="btn btn-primary">Change
                                            Password</button>
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