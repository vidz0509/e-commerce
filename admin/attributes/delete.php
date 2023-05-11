<?php
require('../config.php');
$id = $_GET['id'];
$query = "delete from attributes where id=$id";
echo $query;
$result = mysqli_query($conn, $query);
header("location:cat_table.php");
