<?php
require("config.php");
require("header.php");
$id = $_GET['id'];
$sql = "SELECT p.id,p.category_id,p.attribute_id,p.variants_id,p.p_name,p.p_image,p.p_description,p.price,p.stock,c.category_name,v.var_name,a.attribute_name from product as p,variants as v,attribute as a,category as c where p.id = " . $id . " and p.category_id = c.id and p.variants_id = v.id and p.attribute_id = a.id";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

?>


<!-- Breadcrumb Start --><?php  ?>
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="index.php">Home</a>
                <a class="breadcrumb-item text-dark" href="shop.php">Shop</a>
                <span class="breadcrumb-item active">Product</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Detail Start -->
<div class="container-fluid pb-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 mb-30">
            <div id="product-carousel single-product" class="carousel" data-ride="carousel">
                <div class="carousel-inner bg-light">
                    <div class="carousel-item active text-center">
                        <img class="" src="/e-commerce/admin/products/<?php echo $row['p_image']; ?>" alt="Image">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-7 h-auto mb-30">
            <div class="h-100 bg-light p-30">
                <h3><?php echo $row['p_name']; ?></h3>
                <div class="d-flex mb-3">
                </div>
                <h3 class="font-weight-semi-bold mb-4"><?php echo '₹' . $row['price']; ?></h3>
                <p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est nonumy elitr erat diam stet sit
                    clita ea. Sanc ipsum et, labore clita lorem magna duo dolor no sea
                    Nonumy</p>

                <div class="d-flex mb-3">
                    <strong class="text-dark mr-3"><?php echo $row['var_name'] ?> :</strong>
                    <label for="size-1"><?php echo $row['attribute_name'] ?></label>
                </div>

                <div class="d-flex mb-3">
                    <strong class="text-dark mr-3">Category :</strong>
                    <label for="size-1"><?php echo $row['category_name'] ?></label>
                </div>

                <form method="post" class="product-cart-action">
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn text-white custom-dark-btn btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="qty form-control bg-secondary border-0 text-center" value="1" name="product_qty">
                            <input type="hidden" value=<?php echo $row['category_id']; ?>>
                            <input type="hidden" value=<?php echo $row['variants_id']; ?>>
                            <input type="hidden" value=<?php echo $row['attribute_id']; ?>>
                            <input type="hidden" value=<?php echo $row['id']; ?>>
                            <div class="input-group-btn">
                                <button class="btn text-white custom-dark-btn btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex mb-4">
                        <button class="btn text-white custom-dark-btn px-3 add-to-cart" data-product="<?php echo $row['id']; ?>">
                            <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                        </button>
                        <input type="hidden" value="<?php echo $row['price']; ?>" name="product_price" />
                        <input type="hidden" value="<?php echo $row['p_name']; ?>" name="product_name" />
                        <input type="hidden" value="/products/<?php echo $row['p_image']; ?>" name="product_image" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also
            Like</span></h2>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <div class="product-item bg-light">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="img/product-1.jpg" alt="">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">Product Name Goes Here</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>$123.00</h5>
                            <h6 class="text-muted ml-2"><del>$123.00</del></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->

<?php require("footer.php"); ?>