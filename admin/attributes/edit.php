<?php require("../config.php");
include("../header.php");

$id = $_GET['id'];

if (isset($_POST['edit'])) {
    $current_user_id = $_SESSION['id'];

    $attribute_name =  $_POST['attribute_name'];

    $price =  $_POST['price'];

    $variants =  $_POST['variants'];

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "../attributes/images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $att_query = "Update attribute Set attribute_name='$attribute_name',category_id = '$category_id',attribute_image='$folder',updated_by = $current_user_id,updated_at = now(),is_active = true where id='$id'";
            // echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    } else {
        $att_query = "Update attribute Set attribute_name='$attribute_name',category_id = '$category_id',updated_by = $current_user_id,updated_at = now(),is_active = true where id='$id'";
    }

    if (mysqli_query($conn, $att_query)) {
        $message = '<div class="alert alert-success">Attribute updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}
$sql = "SELECT * FROM attribute where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Attributes</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/attributes/all.php">Attributes</a></li>
                <li class="breadcrumb-item">Edit Attributes</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Attribute</h5>

                        <?php if (isset($message)) : ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Attribute Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="attribute_name" value="<?php echo $row['attribute_name']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Price</label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" value="<?php echo $row['price']; ?>" class="form-control" required />
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
                                                <option value="<?php echo $var_row['id']; ?>" <?php if ($var_row['id'] == $row['variants_id']) echo "selected"; ?>><?php echo $var_row['var_name']; ?></option>
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
                                <label class="col-sm-2 col-form-label">Attribute Image</label>
                                <div class="col-sm-10">
                                    <?php
                                    if (!is_null($row['att_image'])) {
                                    ?>
                                        <img height="120" width="120" src=" <?php echo $row['att_image']; ?>">
                                    <?php
                                    }
                                    ?>
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="edit" class="btn btn-primary">edit Attribute</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<?php include("../footer.php"); ?>