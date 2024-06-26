<?php require("../config.php");
include("../header.php");
// require("session.php");

if (isset($_POST['add_category'])) {

    $is_uploaded = false;

    if (isset($_FILES["file_upload"]["name"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {

            $is_uploaded = true;

            echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo "<h3>  Failed to upload image!</h3>";
        }
    }

    $cat_name =  mysqli_real_escape_string($conn,$_POST['cat_name']);

    $cat_desc =  mysqli_real_escape_string($conn,$_POST['cat_desc']);

    $current_user_id = $_SESSION['id'];

    if ($is_uploaded == true) {
        $sql = "insert into category (category_name,image,category_description,created_by,created_at,updated_by,updated_at,is_active) values('$cat_name','$folder','$cat_desc','$current_user_id',now(),'$current_user_id',now(),true)";
    } else {
        $sql = "insert into category (category_name,category_description,created_by,created_at,updated_by,updated_at,is_active) values('$cat_name','$cat_desc',$current_user_id,now(),'$current_user_id',now(),true)";
    }

    if (mysqli_query($conn, $sql)) {
        $message = 'Category added successfully!';
    } else {
        $message = 'Something went wrong.' . $sql;
    }
}
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Categories</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/categories/all.php">Categories</a></li>
                <li class="breadcrumb-item active">Add New Category</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Add Category</h5>

                        <?php if (isset($message)) : ?>
                            <div class="alert alert-success"><?php echo $message; ?></div>
                        <?php endif; ?>

                        <!-- General Form Elements -->
                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Category Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="cat_name" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <textarea class="tinymce-editor" name="cat_desc"></textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Category Image</label>
                                <div class="col-sm-10">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="add_category" class="btn btn-primary">Add Category</button>
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