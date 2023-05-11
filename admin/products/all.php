<?php
require('../config.php');
require('../header.php');
?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>All Products</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item active">Products</li>
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
                                <a href="../cateories/create.php" class="btn btn-success" style="float: right; margin-left: 15px;">Add New</a>
                                <!-- <input type="submit" class="btn btn-primary" value="Export as CSV" style="float: right;"> -->
                            </div>

                            <table class="table table-bordered" id="table_id">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Product Name</th>
                                        <th>Stock</th>
                                        <th>Variants</th>
                                        <th>Attributes</th>
                                        <th>Created on</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT id,pdt_name,stock,variants,attribute,created_on from products";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        /* fetch associative array */
                                        while ($row = $result->fetch_assoc()) {
                                            $i++;
                                    ?>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td><?php echo $row['pdt_name']; ?></td>
                                                <td><?php echo $row['stock']; ?></td>
                                                <td><?php echo $row['variants']; ?></td>
                                                <td><?php echo $row['attribute']; ?></td>
                                                <td><?php echo date('d-m-Y', strtotime($row['created_on'])); ?></td>
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