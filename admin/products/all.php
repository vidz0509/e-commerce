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
    </div>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="my-4 d-flex justify-content-end">
                                <a href="/e-commerce/admin/products/create.php" class="btn btn-primary">Add New Product</a>
                            </div>
                            <table class="table table-bordered datatable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Stock</th>
                                        <th>Created on</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT id,p_name,p_image,stock,price,created_at from product ORDER BY id DESC";

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
                                                    if ($row['p_image'])
                                                        echo "<img class='td-img' src='/e-commerce/admin/" . $row['p_image'] . "'/>";
                                                    else
                                                        echo '-';
                                                    ?>
                                                </td>
                                                <td><?php echo $row['p_name']; ?></td>
                                                <td><?php echo $row['price']; ?></td>
                                                <td><?php echo $row['stock']; ?></td>
                                                <td><?php echo date('d-M-Y h:i A', strtotime($row['created_at'])); ?></td>
                                                <td>
                                                    <div class="action-btn-wrap">
                                                        <a class="text text-primary action-btn" href="edit.php?id=<?php echo $row["id"]; ?>"><i class="fa fa-edit"></i></a>
                                                        <a class="text text-danger action-btn" href="delete.php?id=<?php echo $row["id"]; ?>"><i class="fa fa-trash-o"></i></a>
                                                    </div>
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
</main>
<?php require('../footer.php'); ?>