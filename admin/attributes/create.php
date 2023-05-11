<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_attributes'])) {

    $filename = $_FILES["file_upload"]["name"];

    $tempname = $_FILES["file_upload"]["tmp_name"];

    $folder = "../attributes/images/" . $filename;

    if (move_uploaded_file($tempname, $folder)) {

        echo "<h3>  Image uploaded successfully!</h3>";
    } else {

        echo "<h3>  Failed to upload image!</h3>";  
    }

    $attribute_name =  $_POST['attribute_name'];

    $price = $_POST['price'];

    $variants = $_POST['variants'];

    $current_user_id = $_SESSION['id'];

    $sql = "insert into attributes (attribute_name,variants_id,att_image,price,created_by,created_on,is_active) values('$attribute_name','$variants','$folder','$price',$current_user_id,now(),true)";

    if (mysqli_query($conn, $sql)) {
        $message = 'Attribute added successfully!';
    } else {
        $message = 'Something went wrong.' . $sql;
    }
}
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Attributes dd</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../dashboard.php">Home</a></li>
                <li class="breadcrumb-item">Attributes</li>
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
                                <select class="col-sm-10" name="variants" id="variants">
                                    <?php
                                    $query = "SELECT *  from variants";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        /* fetch associative array */
                                        while ($row = $result->fetch_assoc()) {
                                           ?> <option value="<?php echo $row['id']; ?>"><?php echo $row['var_name']; ?></option><?php
                                            $i++;
                                        }
                                        $result->free();
                                    }
                                    ?>
                                </select>
                            </div>


                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">File Upload</label>
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