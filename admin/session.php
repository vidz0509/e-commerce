<?php
    session_start();
    if(isset($_SESSION['id']) && $_SESSION['id'] == true){
        header('location:dashboard.php');
        exit;
    }
