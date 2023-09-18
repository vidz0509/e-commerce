<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_products'])) {

    $is_uploaded = false;

    if (isset($_FILES["file_upload"]["name"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "../products/images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {

            $is_uploaded = true;

            echo "<h3>  Image uploaded successfully!</h3>";
        } else {

            echo "<h3>  Failed to upload image!</h3>";
        }
    }

    $p_name =  $_POST['p_name'];

    $stock = $_POST['stock'];

    $price = $_POST['price'];

    $pdt_desc = $_POST['pdt_desc'];

    $current_user_id = $_SESSION['id'];

    if ($is_uploaded == true) {
        $sql = "insert into product (p_name,price,stock,p_description,p_image,created_at,created_at,is_active) values('$p_name','$price','$stock','$pdt_desc','$categories','$variants','$attributes','$folder',$current_user_id,now(),true)";
    } else {
        $sql = "insert into product (p_name,price,stock,p_description,created_by,created_at,is_active) values('$p_name','$price','$stock','$pdt_desc','$current_user_id',now(),true)";
    }
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
                <li class="breadcrumb-item"><a href="/e-commerce/admin/products/all.php">Products</a></li>
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

                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Product Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="p_name" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Product Description</label>
                                <div class="col-sm-10">
                                    <textarea class="tinymce-editor" name="pdt_desc"></textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Stock</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stock" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Category</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="category" id="category">
                                        <option value="">-- Select Variant --</option>
                                        <?php
                                        $query = "SELECT *  from category";
                                        if ($var_result = $conn->query($query)) {
                                            $i = 0;
                                            while ($var_row = $var_result->fetch_assoc()) {
                                        ?>
                                                <option value="<?php echo $var_row['id']; ?>" <?php if ($var_row['id'] == $row['id']) echo "selected"; ?>><?php echo $var_row['category_name']; ?></option>
                                        <?php
                                                $i++;
                                            }
                                            $var_result->free();
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Variants</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="variants" id="variants">
                                        <option value="">-- Select Variant --</option>
                                        <?php
                                        $query = "SELECT *  from variants";
                                        if ($var_result = $conn->query($query)) {
                                            $i = 0;
                                            while ($var_row = $var_result->fetch_assoc()) {
                                        ?>
                                                <option value="<?php echo $var_row['id']; ?>" <?php if ($var_row['id'] == $row['id']) echo "selected"; ?>><?php echo $var_row['var_name']; ?></option>
                                        <?php
                                                $i++;
                                            }
                                            $var_result->free();
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Attribute</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="attribute" id="attribute">
                                        <option value="">-- Select Variant --</option>
                                        <?php
                                        $query = "SELECT *  from attribute";
                                        if ($var_result = $conn->query($query)) {
                                            $i = 0;
                                            while ($var_row = $var_result->fetch_assoc()) {
                                        ?>
                                                <option value="<?php echo $var_row['id']; ?>" <?php if ($var_row['id'] == $row['id']) echo "selected"; ?>><?php echo $var_row['attribute_name']; ?></option>
                                        <?php
                                                $i++;
                                            }
                                            $var_result->free();
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Product Image</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="add_products" class="btn btn-primary">Add Product</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main><!-- End #main -->
<?php include("../footer.php"); ?>
<script type="text/jaavscript">
    $(document).ready(function(){
        $(document).on("change",".section #variants",function(){
            var variant = $(this).val();
            console.log(variant);
        });
    });
</script>