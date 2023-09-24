<?php require("../config.php");
include("../header.php");

$id = $_GET['id'];

if (isset($_POST['edit'])) {

    $current_user_id = $_SESSION['id'];

    $cat_name =  mysqli_real_escape_string($conn,$_POST['cat_name']);

    $cat_desc =  mysqli_real_escape_string($conn,$_POST['category_description']);

    if (isset($_FILES["file_upload"]) && $_FILES["file_upload"]["name"] != "") {

        $filename = $_FILES["file_upload"]["name"];

        $tempname = $_FILES["file_upload"]["tmp_name"];

        $folder = "images/" . $filename;

        if (move_uploaded_file($tempname, $folder)) {
            $cat_query = "Update category Set category_name='$cat_name', category_description='$cat_desc', image='$folder',updated_by = $current_user_id,updated_at = now() where id='$id'";
            // echo "<h3>  Image uploaded successfully!</h3>";
        } else {
            echo '<div class="alert alert-danger">Failed to upload image!</div>';
        }
    } else {
        $cat_query = "Update category Set category_name='$cat_name', category_description='$cat_desc',updated_by = $current_user_id,updated_at = now() where id='$id'";
    }

    if (mysqli_query($conn, $cat_query)) {
        $message = '<div class="alert alert-success">Category updated successfully!</div>';
    } else {
        $message = '<div class="alert alert-danger">Something went wrong.' . $sql . '</div>';
    }
}
$sql = "SELECT * FROM category where id = " . $id;
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);
?>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Categories</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item"><a href="/e-commerce/admin/categories/all.php">Categories</a></li>
                <li class="breadcrumb-item">Edit Categories</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-10">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Edit Category</h5>

                        <?php if (isset($message)) : ?>
                            <?php echo $message; ?>
                        <?php endif; ?>

                        <form method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">Category Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="cat_name" value="<?php echo $row['category_name']; ?>" class="form-control" required />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">Category Description</label>
                                <div class="col-sm-10">
                                    <textarea class="tinymce-editor" name="cat_desc"><?php echo $row['category_description']; ?></textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Category Image</label>
                                <div class="col-sm-10">
                                    <img src="/e-commerce/admin/categories/<?php echo $row['image']; ?>">
                                    <input class="form-control" name="file_upload" type="file" id="formFile" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-6">
                                    <button type="submit" name="edit" class="btn btn-primary">edit Category</button>
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