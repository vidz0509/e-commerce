<?php
    session_start();
    if(isset($_SESSION['id']) && $_SESSION['id'] != "" ){
        header('location:dashboard.php');
        exit;
    }
