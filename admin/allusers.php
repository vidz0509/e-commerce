<?php
require('config.php');
require('header.php');
?>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>All Users</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href="/e-commerce/admin/dashboard.php">Home</a></li>
                <li class="breadcrumb-item active">Users</li>
            </ol>
        </nav>
    </div>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-bordered datatable" id="table_id">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>User Type</th>
                                        <th>Created on</th>
                                        <th>Active</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $query = "SELECT u.id,u.u_name,u.u_profile,u.email,u.created_at,u.is_active,ut.type_name from users as u,user_type as ut where ut.id = u.u_type_id order by id DESC ";

                                    if ($result = $conn->query($query)) {
                                        $i = 0;
                                        while ($row = $result->fetch_assoc()) {
                                            $i++;
                                    ?>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td>
                                                    <?php
                                                    if ($row['u_profile'] == "")
                                                        echo "-";
                                                    else { ?>
                                                        <img src=" <?php echo $row['u_profile']; ?>">
                                                    <?php
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo $row['u_name']; ?></td>
                                                <td><?php echo $row['email']; ?></td>
                                                <td><?php echo $row['type_name']; ?></td>
                                                <td><?php echo Date('d-m-y h:i A', strtotime($row['created_at'])); ?></td>
                                                <td><?php if ($row['is_active'] == true) : ?>
                                                        <p class="text text-success">Active</p>
                                                    <?php else : ?>
                                                        <p class="text text-danger">Diactived</p>
                                                    <?php endif; ?>
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
<?php require('footer.php'); ?>