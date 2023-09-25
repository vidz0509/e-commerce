<?php
require("../config.php");
ob_start();
$json = array();
if (isset($_POST['attributes']))
    $attributes = $_POST['attributes'];
else
    $attributes = array();
if (!empty($attributes))
    $sql = "select * from product where attribute_id in( " . implode(',', $attributes) . " )";
else
    $sql = "select * from product";
?>
<?php if ($result = $conn->query($sql)) : ?>
    <?php while ($row = $result->fetch_assoc()) : ?>
        <div class="col-md-4">
            <div class="product-item bg-light mb-4 text-center">
                <div class="product-img position-relative overflow-hidden">
                    <div class="img-wrap">
                        <img class="img-fluid" src="/e-commerce/admin/<?php echo $row['p_image']; ?>" alt="<?php echo $row['p_name']; ?>">
                    </div>
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="/e-commerce/product.php?id=<?php echo $row["id"]; ?>"><?php echo $row['p_name']; ?></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>₹<?php echo $row['price']; ?></h5>
                    </div>
                </div>
            </div>
        </div>
    <?php endwhile; ?>
<?php endif; ?>
<?php
$json['content'] = ob_get_clean();
echo json_encode($json);
exit;
