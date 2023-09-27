<?php
require("config.php");
require("header.php");
?>


<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <span class="breadcrumb-item active">About Us</span>
            </nav>
        </div>
    </div>
</div>


<div class="container-fluid">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">About Us</span></h2>
    <div class="row">
        <div class="col-lg-5 mb-5">
            <div class="bg-light p-30 mb-30">
                <img style="width: 100%; height: 300px;" src="./sizeshoeshop_640x360.jpg" abindex="0"></img>
            </div>
            <div class="bg-light p-30 mb-3">
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>brocode@gmail.com</p>
                <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+1 9510935250</p>
            </div>
        </div>
    </div>
</div>

<?php require("footer.php"); ?>