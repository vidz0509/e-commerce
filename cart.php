<?php
require("config.php");
require("header.php");

// var_dump($_SESSION['cart']);

?>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/e-commerce/">Home</a>
                <a class="breadcrumb-item text-dark" href="/e-commerce/shop.php">Shop</a>
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<?php if ((isset($_SESSION['id']) && $_SESSION['id'] != "") || (isset($_SESSION['cart']) && !empty($_SESSION['cart']))) : ?>
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Image</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <?php $subtotal = 0; ?>
                        <?php if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) : ?>
                            <?php $i = 0; ?>
                            <?php foreach ($_SESSION['cart'] as $key => $item) : ?>
                                <?php $subtotal += $item['total_amount']; ?>
                                <tr>
                                    <td class="align-middle"><img alt="" style="width: 50px;" src="/e-commerce/admin/<?php echo $item['product_image']; ?>"></td>
                                    <td class="align-middle"><?php echo $item['product_name']; ?></td>
                                    <td class="align-middle"><?php echo '₹' . $item['price']; ?></td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-secondary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="<?php echo $item['qty']; ?>" min="1" max="10" step="1" data-decimals="0" required name="qty[]">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-secondary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle"><?php echo '₹' . $item['price']; ?></td>
                                    <td class="align-middle">
                                        <button class="btn btn-sm btn-danger remove-cart-item" data-id="<?php echo $key; ?>">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </td>
                                </tr>
                                <?php $i++; ?>
                            <?php endforeach; ?>
                        <?php elseif (isset($_SESSION['id']) && $_SESSION['id'] != "") : ?>
                            <?php $query = "SELECT c.id as cart_key,c.amount,c.qty,p.id,p.p_image,p.p_name,p.price FROM product as p,cart as c where c.product_id = p.id and c.user_id=" . $_SESSION['id']; ?>
                            <?php if ($result = $conn->query($query)) : ?>
                                <?php while ($row = $result->fetch_assoc()) : ?>
                                    <tr>
                                        <td class="align-middle"><img alt="" style="width: 50px;" src="/e-commerce/admin/<?php echo $row['p_image']; ?>"></td>
                                        <td class="align-middle"><?php echo $row['p_name']; ?></td>
                                        <td class="align-middle"><?php echo '₹' . $row['price']; ?></td>
                                        <td class="align-middle">
                                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-secondary btn-minus">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-secondary btn-plus">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle"><?php echo '₹' . $row['price']; ?></td>
                                        <td class="align-middle">
                                            <button class="btn btn-sm btn-danger remove-cart-item" data-id="<?php echo $row['cart_key']; ?>">
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php endif; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4 pt-3">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6>₹<?php echo $subtotal; ?></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Free Shipping</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>₹<?php echo $subtotal; ?></h5>
                        </div>
                        <a class="btn btn-block btn-secondary font-weight-bold my-3 py-3" href="/e-commerce/checkout.php">Proceed To Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php else : ?>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>Nothing in cart..!!</p>
            </div>
        </div>
    </div>
<?php endif; ?>
<!-- Cart End -->

<?php require("footer.php"); ?>