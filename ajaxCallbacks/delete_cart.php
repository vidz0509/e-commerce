<?php
require('config.php');
$id = $_GET['id'];
$query = "delete from cart where id=$id";
echo $query;
$result = mysqli_query($conn, $query);
header("location:cart.php");
