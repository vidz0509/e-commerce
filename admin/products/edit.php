<?php require("../config.php");
include("../header.php");

$id = $_GET['id'];

if (isset($_POST['edit'])) {

    $current_user_id = $_SESSION['id'];

    $p_name =  mysqli_real_escape_string($conn, $_POST['p_name']);

    $price =  $_POST['price'];

    $stock =  $_POST['stock'];

    $p_description = mysqli_real_escape_string($conn, $_POST['p_description']);

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $pdt_query = "Update product Set p_name='$p_name',p_image='$folder',stock='$stock',price='$price',p_description='$p_description',updated_by = $current_user_id,updated_at = now(),is_active = true where id='$id'";
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    }

        $pdt_query = "Update product Set p_name='$p_name',stock='$stock',price='$price',p_description='$p_description',updated_by = $current_user_id,updated_at = now(),
    is_active = true where id='$id'";

        if (mysqli_query($conn, $pdt_query)) {
            $message = '<div class="alert alert-success">Product updated successfully!</div>';
        } else {
            $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
        }
    }
$sql = "SELECT * FROM product where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
// var_dump($row);
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Products</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/products/all.php">Products</a></li>
                <li class="breadcrumb-item">Edit Products</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Edit Products</h5>

                        <?php if (isset($message)) : ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Products Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="p_name" value="<?php echo $row['p_name']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Product Description</label>
                                <div class="col-sm-10">
                                    <textarea class="tinymce-editor" name="p_description"><?php echo $row['p_description']; ?></textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Stock</label>
                                <div class="col-sm-10">
                                    <input type="text" name="stock" value="<?php echo $row['stock']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" value="<?php echo $row['price']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Product Image</label>
                                <div class="col-sm-10">
                                    <img src="/e-commerce/admin/products/<?php echo $row['p_image']; ?>">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
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