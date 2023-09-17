<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_variants'])) {

    $is_uploaded = false;

    if (isset($_FILES["file_upload"]["name"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "../variants/images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {

            $is_uploaded = true;

            echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo "<h3>  Failed to upload image!</h3>";
        }
    }


    $var_name =  $_POST['var_name'];

    $current_user_id = $_SESSION['id'];

    if ($is_uploaded == true)
    {
        $sql = "insert into variants (var_name,var_image,created_by,created_at,is_active) values('$var_name','$folder',$current_user_id,now(),true)"; 
    }
    else{
        $sql = "insert into variants (var_name,created_by,created_at,is_active) values('$var_name','$current_user_id',now(),true)";
    }
        

    if (mysqli_query($conn, $sql)) {
        $message = 'Variants added successfully!';
    } else {
        $message = 'Something went wrong.' . $sql;
    }
}
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Variants</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/variants/all.php">Variants</a></li>
                <li class="breadcrumb-item active">Add New</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Variant</h5>

                        <?php if (isset($message)) : ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>

                        <!-- General Form Elements -->
                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Variant Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="var_name" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Variant Image</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="add_variants" class="btn btn-primary">Add Variant</button>
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