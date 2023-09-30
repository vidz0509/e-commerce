<?php
require("config.php");
require("header.php");

if (isset($_POST['update_cart'])) {
    if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
        unset($_SESSION['cart']);
        if (isset($_POST['cart_item'])) {
            foreach ($_POST['cart_item'] as $item) {
                $_SESSION['cart'][] = array(
                    'product_id' => $item['product_id'],
                    'product_name' => $item['product_name'],
                    'price' => $item['price'],
                    'product_image' => $item['product_image'],
                    'qty' => $item['qty'],
                    'total_amount' => $item['qty'] * $item['price'],
                );
            }
        }
    } elseif (isset($_SESSION['id']) && $_SESSION['id'] != "") {
        $user_id = $_SESSION['id'];
        if (isset($_POST['cart_item'])) {

            $delete_query = "delete from cart where user_id= " . $_SESSION['id'];
            $result = mysqli_query($conn, $delete_query);
            foreach ($_POST['cart_item'] as $item) {
                $product = $item['product_id'];
                $qty = $item['qty'];
                $price = $item['price'];
                $total = $price * $qty;
                $sql = "insert into cart (user_id,product_id,qty,amount) values ($user_id,'$product',$qty,$total)";
                if (mysqli_query($conn, $sql)) {
                }
            }
        }
    }
}
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
<?php if ($total > 0) : ?>
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <form method="post">
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
                                        <td class="align-middle quantity">
                                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-secondary btn-minus">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="qty form-control form-control-sm bg-secondary border-0 text-center" value="<?php echo $item['qty']; ?>" min="1" max="10" step="1" data-decimals="0" required name="cart_item[<?php echo $i; ?>][qty]" value="<?php echo isset($item['price']) ? $item['qty'] : ''; ?>">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-secondary btn-plus">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle"><?php echo '₹' . $item['qty'] * $item['price']; ?></td>
                                        <td class="align-middle">
                                            <button class="btn btn-sm btn-danger remove-cart-item" data-id="<?php echo $key; ?>">
                                                <i class="fa fa-times"></i>
                                            </button>
                                            <input type="hidden" name="cart_item[<?php echo $i; ?>][key]" value="<?php echo $i; ?>" />
                                            <input type="hidden" name="cart_item[<?php echo $i; ?>][price]" value="<?php echo $item['price']; ?>" />
                                            <input type="hidden" name="cart_item[<?php echo $i; ?>][product_id]" value="<?php echo $item['product_id']; ?>" />
                                            <input type="hidden" name="cart_item[<?php echo $i; ?>][product_image]" value="<?php echo $item['product_image']; ?>" />
                                            <input type="hidden" name="cart_item[<?php echo $i; ?>][product_name]" value="<?php echo $item['product_name']; ?>" />
                                        </td>
                                    </tr>
                                    <?php $i++; ?>
                                <?php endforeach; ?>
                            <?php elseif (isset($_SESSION['id']) && $_SESSION['id'] != "") : ?>
                                <?php $query = "SELECT c.id as cart_key,c.amount,c.qty,p.id,p.p_image,p.p_name,p.price FROM product as p,cart as c where c.product_id = p.id and c.user_id=" . $_SESSION['id']; ?>
                                <?php if ($result = $conn->query($query)) : ?>
                                    <?php $i = 0; ?>
                                    <?php while ($row = $result->fetch_assoc()) : ?>
                                        <tr>
                                            <td class="align-middle"><img alt="" style="width: 50px;" src="/e-commerce/admin/<?php echo $row['p_image']; ?>"></td>
                                            <td class="align-middle"><?php echo $row['p_name']; ?></td>
                                            <td class="align-middle"><?php echo '₹' . $row['qty'] * $row['price']; ?></td>
                                            <td class="align-middle quantity">
                                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-sm btn-secondary btn-minus">
                                                            <i class="fa fa-minus"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text" class="qty form-control form-control-sm bg-secondary border-0 text-center" value="<?php echo $row['qty']; ?>" name="cart_item[<?php echo $i; ?>][qty]">
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
                                                <input type="hidden" name="cart_item[<?php echo $i; ?>][key]" value="<?php echo $row['id']; ?>" />
                                                <input type="hidden" name="cart_item[<?php echo $i; ?>][price]" value="<?php echo $row['price']; ?>" />
                                                <input type="hidden" name="cart_item[<?php echo $i; ?>][product_id]" value="<?php echo $row['product_id']; ?>" />
                                                <input type="hidden" name="cart_item[<?php echo $i; ?>][product_image]" value="<?php echo $row['product_image']; ?>" />
                                                <input type="hidden" name="cart_item[<?php echo $i; ?>][product_name]" value="<?php echo $row['product_name']; ?>" />
                                            </td>
                                        </tr>
                                        <?php $i++; ?>
                                    <?php endwhile; ?>
                                <?php endif; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                    <div class="cart-bottom">
                        <button type="submit" name="update_cart" class="btn btn-block btn-secondary font-weight-bold my-2 py-2">
                            <span>UPDATE CART</span>
                            <i class="icon-refresh"></i>
                        </button>
                    </div>
                </form>
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
                        <div class="cart-bottom">
                            <a class="btn btn-block btn-secondary font-weight-bold my-3 py-2" href="/e-commerce/checkout.php">Proceed To Checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php else : ?>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="shop.php">Let's Get Some Items..</a>
            </div>
        </div>
    </div>
<?php endif; ?>
<!-- Cart End -->

<?php require("footer.php"); ?>