<?php
require('../config.php');
if (session_id() === "") session_start();
ob_start();
$json = array();
$json['success'] = false;
$id = $_POST['cart_key'];
$query = "delete from cart where id=$id";
$json['content'] = ob_get_clean();
if(mysqli_query($conn, $query)){
    $json['success'] = true;
}
echo json_encode($json);
exit;