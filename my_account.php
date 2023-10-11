<?php
require("config.php");
require("header.php");

$message = "";

$msg = "";

if (isset($_POST['user_profile'])) {

    $userid = $_SESSION['id'];
    $sql =  "select * from users where id='$userid'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $user_name = $_POST['user_name'];
    $email = $_POST['email'];
    $phone_no = $_POST['phone_no'];
    $update_sql = "update users set u_name = '$user_name' , email = '$email' , phone_no = '$phone_no' , updated_at = now(), updated_by = " . $_SESSION['id'] . " where id = " . $_SESSION['id'];

    if (mysqli_query($conn, $update_sql)) {
        $message .= "<div class='alert alert-success'>Profile updated successfully..</div>";
    } else {
        $message .= "<div class='alert alert-danger'>Something went wrong. Please Check..!</div>";
    }
}
if (isset($_POST['change_password'])) {

    $userid = $_SESSION['id'];
    $sql =  "select * from users where id='$userid'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();

    $curpass =  $_POST['curpassword'];

    $newpass =  $_POST['newpassword'];

    $renewpass =  $_POST['renewpassword'];

    if ($curpass == $renewpass) {
        $msg = '<div class="alert alert-secondary">Current password and new password cannot be same!</div>';
    } elseif ($curpass == trim($row['password'])) {
        if ($newpass === $renewpass) {
            $pass_query = "Update users set password = '$newpass' where id = " . $_SESSION['id'];
            if (mysqli_query($conn, $pass_query)) {
                $msg = '<div class="alert alert-success">Password updated successfully!</div>';
            } else {
                $msg = '<div class="alert alert-danger">Something went wrong!</div>';
            }
        } else {
            $msg = '<div class="alert alert-danger">Your Password is Not Matched.</div>';
        }
    } else {
        $message = '<div class="alert alert-danger">Your Current Password is Incorrect!</div>';
    }
}
$sql = "SELECT * FROM users where id = " . $_SESSION['id'];
$result = $conn->query($sql);
$user_row = mysqli_fetch_assoc($result);

$order_sql = "select * from orders  where user_id = " . $_SESSION['id'];

?>
<style type="text/css">
    .table th, .table td{ line-height: 1.2; text-align: left; }
</style>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="index.php">Home</a>
                <span class="breadcrumb-item active">Account</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Contact Start -->
<div class="container-fluid">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">My Account</span></h2>
    <div class="row px-xl-5">
        <div class="col-md-3 bg-light">
            <ul class="tab-links p-30">
                <li class="active"><a href="#" class="link" data-id="my-account">Account Details</a></li>
                <li><a href="#" class="link" data-id="change-password">Change Password</a></li>
                <li><a href="#" class="link" data-id="orders">Orders</a></li>
                <li><a href="/e-commerce/logout.php">Sign Out</a></li>
            </ul>
        </div>
        <div class="col-md-9 bg-light">
            <div id="my-account" class="tab-content show contact-form p-30">
                <?php if ($message != "") : ?>
                    <?php echo $message; ?>
                <?php endif; ?>
                <form method="post" novalidate="novalidate">
                    <div class="control-group">
                        <label>Full Name *</label>
                        <input type="text" name="user_name" class="form-control" id="name" placeholder="Your Name" required="required" value="<?php echo $user_row['u_name']; ?>" data-validation-required-message="Please enter your name" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <label>Email Address *</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Your Email" required="required" value="<?php echo $user_row['email']; ?>" data-validation-required-message="Please enter your email" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <label>Phone no *</label>
                        <input type="tel" name="phone_no" class="form-control" id="subject" placeholder="Subject" required="required" value="<?php echo $user_row['phone_no']; ?>" data-validation-required-message="Please enter your phone no" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <button name="user_profile" class="btn text-white custom-dark-btn py-2 px-4" id="">Save Changes</button>
                    </div>
                </form>
            </div>
            <div id="change-password" class="tab-content contact-form p-30">
                <?php if ($msg != "") : ?>
                    <?php echo $msg; ?>
                <?php endif; ?>
                <form method="post" novalidate="novalidate">
                    <div class="control-group">
                        <label>Current Password *</label>
                        <input type="password" name="curpassword" class="form-control" id="name" placeholder="Your Name" required="required" data-validation-required-message="Please enter your current password" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <label>New Password *</label>
                        <input type="password" name="newpassword" class="form-control" id="email" placeholder="Your Email" required="required" data-validation-required-message="Please enter your new password" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <label>Re-Enter Password *</label>
                        <input type="password" name="renewpassword" class="form-control" id="subject" placeholder="Subject" required="required" data-validation-required-message="Please re-enter new password" />
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <button name="change_password" class="btn text-white custom-dark-btn py-2 px-4" type="submit" id="">Save Password</button>
                    </div>
                </form>
            </div>
            <div id="orders" class="tab-content contact-form p-30">
                <?php if ($order_result = $conn->query($order_sql)) : ?>
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Products</th>
                                <th>Order Date</th>
                                <th>Total Amount</th>
                                <th>Transaction ID</th>
                                <th>Payment Status</th>
                                <!-- <th>Address</th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i = 0; ?>
                            <?php while ($order_row = $order_result->fetch_assoc()) : ?>
                                <?php $order_items = "select od.product_id,p.p_name from order_details as od, product as p, orders as o where od.order_id = o.id and od.product_id = p.id and od.user_id ='" . $_SESSION['id'] . "' and od.order_id = '" . $order_row['id'] . "'";

                                ?>
                                <tr>
                                    <?php $i++; ?>
                                    <td>
                                        <?php echo $i; ?>
                                    </td>
                                    <td>
                                        <?php if ($item_result = $conn->query($order_items)) : ?>
                                            <?php while ($item_row = $item_result->fetch_assoc()) : ?>
                                                <p>
                                                    <a href="/e-commerce/product.php?id=<?php echo $item_row['product_id']; ?>">
                                                        <?php echo $item_row['p_name']; ?>
                                                    </a>
                                                </p>
                                            <?php endwhile; ?>
                                        <?php endif; ?>
                                    </td>

                                    <td>
                                        <?php echo date('d-m-Y', strtotime($order_row['order_date'])); ?>
                                    </td>
                                    <td>
                                        ₹
                                        <?php echo $order_row['total_amount']; ?>
                                    </td>
                                    <td>
                                        <?php echo $order_row['transaction_id']; ?>
                                    </td>
                                    <td class="text text-success" style="font-weight:700">
                                        <?php echo ucwords($order_row['payment_status']); ?>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Contact End -->

<?php require("footer.php"); ?>