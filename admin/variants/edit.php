<?php require("../config.php");
include("../header.php");
$message = '';
$id = $_GET['id'];

if (isset($_POST['edit'])) {
    $current_user_id = $_SESSION['id'];

    $var_name =  $_POST['var_name'];

    if(isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != ""){

        $filename = $_FILES["file_upload"]["name"];
    
        $tempname = $_FILES["file_upload"]["tmp_name"];
    
        $folder = "../variants/images/" . $filename;
        
        if (move_uploaded_file($tempname, $folder)) {
            $var_query = "Update variants Set var_name='$var_name',var_image='$folder',updated_by = $current_user_id,updated_on = now() where id='$id'";
            // echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    }else{
        $var_query = "Update variants Set var_name='$var_name',updated_by = $current_user_id,updated_on = now() where id='$id'";
    }

    if (mysqli_query($conn, $var_query)) {
        $message = '<div class="alert alert-success">Category updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql.'</div>';
    }
}
$sql = "SELECT * FROM variants where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Variants</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/variants/all.php">Variants</a></li>
                <li class="breadcrumb-item">Edit Variants</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Edit Variants</h5>

                        <?php if (isset($message)) : ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <form method="post" enctype="multipart/form-data">

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Variant Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="var_name" value="<?php echo $row['var_name']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">File Upload</label>
                                <div class="col-sm-10">
                                    <img height="120" width="120" src=" <?php echo $row['var_image']; ?>">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="edit" class="btn btn-primary">Edit Category</button>
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