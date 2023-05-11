<?php require("../config.php");
include("../header.php");

$id = $_GET['id'];

if (isset($_POST['edit'])) {
    $current_user_id = $_SESSION['id'];

    $attribute_name =  $_POST['attribute_name'];

    $price =  $_POST['price'];

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "../attributes/images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $att_query = "Update attributes Set attribute_name='$attribute_name', price='$price', att_image='$folder',updated_by = $current_user_id,updated_on = now(),is_active = true where id='$id'";
            // echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    } else {
        $att_query = "Update attributes Set attribute_name='$attribute_name', price='$price',updated_by = $current_user_id,updated_on = now(),is_active = true where id='$id'";
    }

    if (mysqli_query($conn, $att_query)) {
        $message = '<div class="alert alert-success">Attribute updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}
$sql = "SELECT * FROM attributes where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Attributes</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item">Attributes</li>
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
                                    <input type="text" name="price" value="<?php echo $row['price']; ?>" 
                                    class="form-control" required />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">File Upload</label>
                                <div class="col-sm-10">
                                    <img height="120" width="120" src=" <?php echo $row['att_image']; ?>">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="edit" class="btn btn-primary">edit Attribute</button>
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