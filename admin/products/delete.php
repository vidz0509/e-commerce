<?php
require('../config.php');
$id = $_GET['id'];
$query = "delete from products where id=$id";
echo $query;
$result = mysqli_query($conn, $query);
header("location:p_table.php");