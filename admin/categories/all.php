<?php
require('../config.php');
require('../header.php');
require('../functions.php');
?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>All Categories</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item active">Categories</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div style="margin-bottom: 45px;">
                                <a href="/e-commerce/admin/categories/create.php" class="btn btn-success" style="float: right; margin-left: 15px;">Add New</a>
                                <!-- <input type="submit" class="btn btn-primary" value="Export as CSV" style="float: right;"> -->
                            </div>

                            <table class="table table-bordered" id="table_id">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Category Name</th>
                                        <th>Category Description</th>
                                        <th>Created on</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT id,cat_name,image,cat_description,created_on from categories ORDER BY id DESC";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        /* fetch associative array */
                                        while ($row = $result->fetch_assoc()) {
                                            $i++;
                                            ?>

                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td>
                                                    <?php
                                                    if ($row['image'] == "")
                                                        echo "-";
                                                    else { ?>
                                                        <img height="120" width="120" src=" <?php echo $row['image']; ?>">
                                                    <?php
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo $row['cat_name']; ?></td>
                                                <td><?php echo limit_description($row['cat_description'],200); ?></td>
                                                <td><?php echo date('M-Y', strtotime($row['created_on'])); ?></td>
                                                <td>
                                                    <a class="btn btn-info" href="edit.php?id=<?php echo $row["id"]; ?>"><i class="fa fa-edit"></i></a>
                                                    <a class="btn btn-danger" href="delete.php?id=<?php echo $row["id"]; ?>"><i class="fa fa-trash-o"></i></a>
                                                </td>
                                            </tr>
                                    <?php
                                        }
                                        $result->free();
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
    <?php require('../footer.php'); ?>