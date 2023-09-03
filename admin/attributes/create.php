<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_attributes'])) {

    $is_uploaded = false;

    if (isset($_FILES["file_upload"]["name"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "../attributes/images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {

            $is_uploaded = true;

            echo "<h3>  Image uploaded successfully!</h3>";
        } else {

            echo "<h3>  Failed to upload image!</h3>";
        }
    }

    $attribute_name =  $_POST['attribute_name'];

    $price = $_POST['price'];

    $current_user_id = $_SESSION['id'];

    $category_id = 1;

    if ($is_uploaded == true) {
        $sql = "insert into attribute (attribute_name,category_id,created_by,attribute_image,created_at,is_active) values('$attribute_name','$category_id','$current_user_id','$folder',now(),true)";
    } else {
        $sql = "insert into attribute (attribute_name,category_id,created_by,created_at,is_active) values('$attribute_name','$category_id', '$current_user_id',now(),true)";
    }

    if (mysqli_query($conn, $sql)) {
        $message = 'Attribute added successfully!';
    } else {
        $message = 'Something went wrong.' . $sql;
    }
}
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Attributes</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/attributes/all.php">Attributes</a></li>
                <li class="breadcrumb-item active">Add New</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Attributes</h5>

                        <?php if (isset($message)) : ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>

                        <!-- General Form Elements -->
                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Attribute Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="attribute_name" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Attribute Price</label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Variants</label>
                                <div class="col-sm-10">
                                    <select class="form-select" name="variants" id="variants">
                                        <?php
                                        $query = "SELECT *  from category";

                                        if ($result = $conn->query($query)) {
                                            $i = 0;
                                            /* fetch associative array */
                                            while ($row = $result->fetch_assoc()) {
                                        ?> <option value="<?php echo $row['id']; ?>"><?php echo $row['category_name']; ?></option>
                                        <?php
                                                $i++;
                                            }
                                            $result->free();
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Attribute Image</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="add_attributes" class="btn btn-primary">Add Attributes</button>
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