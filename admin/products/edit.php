<?php require("../config.php");
include("../header.php");

$id = $_GET['id'];

if (isset($_POST['edit'])) {
    $current_user_id = $_SESSION['id'];

    $p_name =  $_POST['p_name'];

    $stock =  $_POST['stock'];

    $variants =  $_POST['variants'];

    $attributes =  $_POST['attributes'];
    
        $ptd_query = "Update products Set pdt_name='$p_name',stock='$stock',variants='$variants',attribute='$attributes',updated_by = $current_user_id,updated_on = now(),is_active = true where id='$id'";

    if (mysqli_query($conn, $ptd_query)) {
        $message = '<div class="alert alert-success">Product updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}
$sql = "SELECT * FROM products where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
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
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Products</h5>

                        <?php if (isset($message)) : ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Products Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="p_name" value="<?php echo $row['pdt_name']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Stock</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stock" value="<?php echo $row['stock']; ?>" 
                                    class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Variants</label>
                                <div class="col-sm-10">
                                    <input type="text" name="variants" value="<?php echo $row['variants']; ?>" 
                                    class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Attributes</label>
                                <div class="col-sm-10">
                                    <input type="text" name="attributes" value="<?php echo $row['attribute']; ?>" 
                                    class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="edit" class="btn btn-primary">edit Products</button>
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