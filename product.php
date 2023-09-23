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
            <div id="product-carousel" class="carousel" data-ride="carousel">
                <div class="carousel-inner bg-light">
                    <div class="carousel-item active">
                        <img class="w-600 h-100" src="/e-commerce/admin/<?php echo $row['p_image']; ?>" alt="Image">
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

                <form method="post">
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn text-white custom-dark-btn btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>

                            <input type="number" class="form-control bg-secondary border-0 text-center" value="1">
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
                        <button class="btn text-white custom-dark-btn px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To
                            Cart</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row px-xl-5">
    <div class="col">
        <div class="bg-light p-30">
            <div class="nav nav-tabs mb-4">
                <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a>
                <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                    <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam
                        invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod
                        consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam.
                        Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos
                        dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod
                        nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt
                        tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                    <p>Dolore magna est eirmod sanctus dolor, amet diam et eirmod et ipsum. Amet dolore tempor
                        consetetur sed lorem dolor sit lorem tempor. Gubergren amet amet labore sadipscing clita
                        clita diam clita. Sea amet et sed ipsum lorem elitr et, amet et labore voluptua sit rebum.
                        Ea erat sed et diam takimata sed justo. Magna takimata justo et amet magna et.</p>
                </div>
                <div class="tab-pane fade" id="tab-pane-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="mb-4">1 review for "Product Name"</h4>
                            <div class="media mb-4">
                                <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <div class="media-body">
                                    <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                    <div class="text-primary mb-2">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                    <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum
                                        et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="mb-4">Leave a review</h4>
                            <small>Your email address will not be published. Required fields are marked *</small>
                            <div class="d-flex my-3">
                                <p class="mb-0 mr-2">Your Rating * :</p>
                                <div class="text-primary">
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                            </div>
                            <form>
                                <div class="form-group">
                                    <label for="message">Your Review *</label>
                                    <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your Name *</label>
                                    <input type="text" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Your Email *</label>
                                    <input type="email" class="form-control" id="email">
                                </div>
                                <div class="form-group mb-0">
                                    <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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