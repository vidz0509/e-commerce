<?php
if (session_id() === "")
    session_start();
require('../config.php');
$json = array();

$user_id =  $_SESSION['id'];
/* Update address */

$user_id = $_SESSION['id'];
$street_address = $_POST['address'];
$city = $_POST['city'];
$state = $_POST['state'];
$zipcode = $_POST['zipcode'];
$country = $_POST['country'];
$total_amount = $_POST['total_amount'];
$transaction_id = $_POST['transaction_id'];

$address_sql = "insert into billing_address (user_id,street_address,city,state,zipcode,country) values ('$user_id','$street_address','$city','$state','$zipcode','$country')";

if (mysqli_query($conn, $address_sql)) {

    /* Insert Order */

    $address_id = mysqli_insert_id($conn);

    $order_sql = "insert into orders (user_id,order_date,payment_status,total_amount,address_id,transaction_id) values ('$user_id',now(),'completed','$total_amount','$address_id','$transaction_id')";

    if (mysqli_query($conn, $order_sql)) {

        $order_id = mysqli_insert_id($conn);

        /* Insert Order Items */

        $cartQuery = "SELECT * from cart where user_id=" . $_SESSION['id'];

        if ($cart_result = $conn->query($cartQuery)) {

            while ($cart_row = $cart_result->fetch_assoc()) {

                $product_id = $cart_row['product_id'];
                $qty = $cart_row['qty'];
                $amount = $cart_row['amount'];

                $order_detail_sql = "insert into order_details(order_id,user_id,product_id,amount,qty) values ('$order_id','$user_id','$product_id','$amount','$qty')";

                mysqli_query($conn, $order_detail_sql);
            }
        }

        /* Empty Cart */

        $delete_query = "delete from cart where user_id= " . $_SESSION['id'];

        mysqli_query($conn, $delete_query);

        unset($_SESSION['cart']);

        $json['success'] = true;

        // var_dump($result);
    } else {
        $json['success'] = false;
    }
} else {
    $json['success'] = false;
}

echo json_encode($json);
exit;
