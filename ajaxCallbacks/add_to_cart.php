<?php
if (session_id() === "") session_start();
require("../config.php");

$json = array();
$json['success'] = false;
if (isset($_POST['product'])) {
    $product = $_POST['product'];
    $current_user_id = "";
    if (isset($_SESSION['id'])) {
        $current_user_id = $_SESSION['id'];
    }
    $qty = isset($product['qty']) ? $product['qty']  : 1;
    $product_id = $product['id'];
    $product_name = $product['name'];
    $product_image = $product['image'];
    $price = $product['price'];
    $total = (int)$price * $qty;
    if ($current_user_id != "") {
        $sql = "insert into cart (user_id,product_id,qty,amount) values ('$current_user_id','$product_id',$qty,$total)";
        if (mysqli_query($conn, $sql)) {

            $sql = "SELECT sum(qty) as totalCartItems FROM `cart` where user_id=" . $current_user_id;
            $result = $conn->query($sql);
            $row = mysqli_fetch_assoc($result);
            $total = $row['totalCartItems'];
            $json['success'] = true;
            $json['total'] = $total;
        } else {
            $json['success'] = false;
            $message = "<div class='alert alert-danger'>Something went wrong!</div>";
        }
    } else {
        $count = 0;
        $_SESSION['cart'][] = array(
            'product_id' => $product_id,
            'product_name' => $product_name,
            'price' => $price,
            'product_image' => $product_image,
            'qty' => $qty,
            'total_amount' => $total,
        );
        $json['success'] = true;
        foreach($_SESSION['cart'] as $item){
            $count += $item['qty'];
        }
        $json['total'] = $count;
    }
    echo json_encode($json);
    exit;
}
