<?php
require("config.php");
require("header.php");

$user_sql = "SELECT * from users where id = " . $_SESSION['id'];
$user_result = $conn->query($user_sql);
$user_data = mysqli_fetch_assoc($user_result);

$total_amount = 0;
// var_dump($_SESSION['cart']);
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item)
        $total_amount += $item['total_amount'];
} else if (isset($_SESSION['id']) && $_SESSION['id'] != "") {
    $total_query = "SELECT  sum(amount) as amount from cart where user_id=" . $_SESSION['id'];
    $total_result = $conn->query($total_query);
    $cart_row = mysqli_fetch_assoc($total_result);
    $total_amount = $cart_row['amount'];
}

?>


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/e-commerce/">Home</a>
                <a class="breadcrumb-item text-dark" href="/e-commerce/shop.php">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
    <form method="post" class="order-form">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label>Full Name</label>
                            <input class="form-control" id="fullname" type="text" placeholder="First name" value="<?php echo $user_data['u_name']; ?>" readonly>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" id="emailid" type="text" placeholder="abc@email.com" value="<?php echo $user_data['email']; ?>" readonly>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" id="phone" type="text" placeholder="+91 9909409153" value="<?php echo $user_data['phone_no']; ?>" readonly>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" id="address" type="text" placeholder="Address">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <input class="form-control" id="country" type="text" placeholder="Country">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" id="city" type="text" placeholder="Surat">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <input class="form-control" id="state" type="text" placeholder="Gujrat">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP Code</label>
                            <input class="form-control" id="zipcode" placeholder="394130">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6>₹<?php echo $total_amount; ?></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Free</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>₹<?php echo $total_amount; ?></h5>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                    <div class="bg-light p-30">
                        <input type="hidden" id="final_amount" value="<?php echo $total_amount; ?>" />
                        <button id="place_order" type="submit" class="btn btn-block btn-primary text-light font-weight-bold py-3">Place Order</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Checkout End -->

<?php require("footer.php"); ?>