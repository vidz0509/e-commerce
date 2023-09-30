<?php
require('../config.php');
require('../header.php');
?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>All Variants</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item active">Varinats</li>
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
                                <a href="/e-commerce/admin/variants/create.php" class="btn btn-primary">Add New Variant</a>
                            </div>

                            <table class="table table-bordered datatable" id="table_id">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>variant Name</th>
                                        <th>Created on</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT id,var_name,created_at from variants ORDER BY id DESC";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        /* fetch associative array */
                                        while ($row = $result->fetch_assoc()) {
                                            $i++;

                                    ?>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                </td>
                                                <td><?php echo $row['var_name']; ?></td>
                                                <td><?php echo date('d-m-y h:i A', strtotime($row['created_at'])); ?></td>
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