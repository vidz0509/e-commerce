<?php
require('../config.php');
$id = $_GET['id'];
$query = "delete from attribute where id=$id";
echo $query;
$result = mysqli_query($conn, $query);
header("location:all.php");
