<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_products'])) {

    $p_name =  $_POST['p_name'];

    $stock = $_POST['stock'];

    $variants = $_POST['variants'];

    $attributes = $_POST['attributes'];

    $current_user_id = $_SESSION['id'];

    $sql = "insert into products (pdt_name,stock,variants,attribute,created_by,created_on,is_active) values('$p_name','$stock','$variants','$attributes',$current_user_id,now(),true)";

    if (mysqli_query($conn, $sql)) {
        $message = 'Product added successfully!';
    } else {
        $message = 'Something went wrong.' . $sql;
    }
}
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Products</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item">Products</li>
                <li class="breadcrumb-item active">Add New</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Products</h5>

                        <?php if (isset($message)) : ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>

                        <!-- General Form Elements -->
                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Product Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="p_name" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Product Stock</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stock" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Variants</label>
                                <div class="col-sm-10">
                                    <input type="text" name="variants" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Attributes</label>
                                <div class="col-sm-10">
                                    <input type="text" name="attributes" class="form-control" required />
                                </div>
                            </div>


                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="add_products" class="btn btn-primary">Add Products</button>
                                </div>
                            </div>

                        </form><!-- End General Form Elements -->

                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->
<?php include("../footer.php"); ?>