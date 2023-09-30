<?php
require("config.php");
require("header.php");
?>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/e-commerce/">Home</a>
                <span class="breadcrumb-item active">Products</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Start -->
<div class="container-fluid">
    <div class="loader-wrap">
        <span class="loader"></span>
    </div>
    <div class="row px-xl-5">
        <div class="col-lg-3 col-md-4">
            <form method="post" id="filterForm">
                <?php $var_sql = "SELECT * from variants limit 3"; ?>
                <?php if ($var_result = $conn->query($var_sql)) : ?>
                    <?php while ($var_row = $var_result->fetch_assoc()) : ?>
                        <div class="filter-item">
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by <?php echo $var_row['var_name']; ?></span></h5>
                            <div class="bg-light p-4 mb-30">
                                <!-- <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="checkbox" class="custom-control-input" checked>
                                    <label class="custom-control-label" for="price-all">All <?php echo $var_row['var_name']; ?></label>
                                </div> -->
                                <?php $attr_sql = "SELECT * from attribute where variants_id =" . $var_row['id']; ?>
                                <?php if ($attr_result = $conn->query($attr_sql)) : ?>
                                    <?php while ($attr_row = $attr_result->fetch_assoc()) : ?>
                                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                            <input type="checkbox" class="custom-control-input attr" id="attr-<?php echo $attr_row['id']; ?>" name="attribute[]" value="<?php echo $attr_row['id']; ?>">
                                            <label class="custom-control-label" for="attr-<?php echo $attr_row['id']; ?>"><?php echo $attr_row['attribute_name']; ?></label>
                                        </div>
                                    <?php endwhile; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endif; ?>
            </form>
        </div>
        <div class="col-lg-9 col-md-8">
            <div class="row pb-3 shop-row shop-list">
                <?php $sql = "SELECT * from product"; ?>
                <?php if ($result = $conn->query($sql)) : ?>
                    <?php while ($row = $result->fetch_assoc()) : ?>
                        <div class="col-md-4">
                            <div class="product-item bg-light mb-4 text-center">
                                <div class="product-img position-relative overflow-hidden">
                                    <div class="img-wrap">
                                        <img class="img-fluid" src="/e-commerce/admin/products/<?php echo $row['p_image']; ?>" alt="<?php echo $row['p_name']; ?>">
                                    </div>
                                    <div class="product-action product-cart-action">
                                        <button class="btn btn-outline-dark btn-square add-to-cart" data-product="<?php echo $row['id']; ?>">
                                            <i class="fa fa-shopping-cart"></i>
                                        </button>
                                        <input type="hidden" value="<?php echo $row['price']; ?>" name="product_price" />
                                        <input type="hidden" value="<?php echo $row['p_name']; ?>" name="product_name" />
                                        <input type="hidden" value="/products/<?php echo $row['p_image']; ?>" name="product_image" />
                                    </div>
                                </div>
                                <div class="text-center py-4 product-content">
                                    <a class="h6 text-decoration-none" href="/e-commerce/product.php?id=<?php echo $row["id"]; ?>"><?php echo $row['p_name']; ?></a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>₹<?php echo $row['price']; ?></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endif; ?>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>

<?php require("footer.php"); ?>