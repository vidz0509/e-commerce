
<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "e-commerce";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (mysqli_connect_errno()) {
	echo "failed";
	exit();
}
