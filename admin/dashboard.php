<?php require("header.php"); ?>
<?php
$total_user_sql = "SELECT COUNT(id) as totalUsers FROM `users` where u_type_id='3'";
$result = $conn->query($total_user_sql);
$urow = mysqli_fetch_assoc($result);

$total_attr_sql = "SELECT COUNT(id) as totalAttributes FROM `attribute`";
$result = $conn->query($total_attr_sql);
$arow = mysqli_fetch_assoc($result);

$total_cat_sql = "SELECT COUNT(id) as totalCategories FROM `category`";
$result = $conn->query($total_cat_sql);
$crow = mysqli_fetch_assoc($result);

$total_pro_sql = "SELECT COUNT(id) as totalProducts FROM `product`";
$result = $conn->query($total_pro_sql);
$prow = mysqli_fetch_assoc($result);

$total_var_sql = "SELECT COUNT(id) as totalVariants FROM `variants`";
$result = $conn->query($total_var_sql);
$vrow = mysqli_fetch_assoc($result);
?>

<main id="main" class="main">

  <div class="pagetitle">
    <h1>Dashboard</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item active">Dashboard</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section dashboard">
    <div class="row">

      <!-- Left side columns -->
      <div class="col-lg-12">
        <div class="row">
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Customers</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-people"></i>
                  </div>
                  <div class="ps-3">
                    <h6><?php echo $urow['totalUsers']; ?></h6>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Products</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-basket"></i>
                  </div>
                  <div class="ps-3">
                    <h6><?php echo $prow['totalProducts']; ?></h6>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Orders</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-shop-window"></i>
                  </div>
                  <div class="ps-3">
                    <h6>0</h6>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Categories</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-menu-down"></i>
                  </div>
                  <div class="ps-3">
                    <h6><?php echo $crow['totalCategories']; ?></h6>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Variants</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-funnel"></i>
                  </div>
                  <div class="ps-3">
                    <h6><?php echo $vrow['totalVariants']; ?></h6>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="col-md-3">
            <div class="card info-card sales-card">
              <div class="card-body">
                <h5 class="card-title">Attributes</h5>
                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-list-stars"></i>
                  </div>
                  <div class="ps-3">
                    <h6><?php echo $arow['totalAttributes']; ?></h6>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div><!-- End Left side columns -->

    </div>
  </section>

</main><!-- End #main -->
<?php include("footer.php"); ?>