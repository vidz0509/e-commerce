<?php
require('../config.php');
require('../header.php');
?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>All Attributes</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item active">Attributes</li>
            </ol>
        </nav>
    </div>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div style="margin-bottom: 45px;">
                                <a href="/e-commerce/admin/attributes/create.php" class="btn btn-success" style="float: right; margin-left: 15px;">Add New</a>
                                <!-- <input type="submit" class="btn btn-primary" value="Export as CSV" style="float: right;"> -->
                            </div>

                            <table class="table table-bordered datatable" id="table_id">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Attribute Name</th>
                                        <th>Created on</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT id,attribute_name,attribute_image,created_at from attribute ORDER BY id DESC";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        while ($row = $result->fetch_assoc()) {
                                            $i++;
                                    ?>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td>
                                                    <?php
                                                    if ($row['attribute_image'] == "")
                                                        echo "-";
                                                    else { ?>
                                                        <img src=" <?php echo $row['attribute_image']; ?>">
                                                    <?php
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo $row['attribute_name']; ?></td>
                                                <td><?php echo Date('d-m-y h:i A', strtotime($row['created_at'])); ?></td>
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