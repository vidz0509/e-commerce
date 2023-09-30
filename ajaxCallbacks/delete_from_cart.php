<?php
require('../config.php');
if (session_id() === "") session_start();
ob_start();
$json = array();
$json['success'] = false;
$id = $_POST['cart_key'];
if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
    unset($_SESSION['cart'][$id]);
    $json['success'] = true;
} else if (isset($_SESSION['id']) && $_SESSION['id'] != '') {
    $query = "delete from cart where id=$id";
    $json['content'] = ob_get_clean();
    if (mysqli_query($conn, $query)) {
        $json['success'] = true;
    }
}
echo json_encode($json);
exit;
