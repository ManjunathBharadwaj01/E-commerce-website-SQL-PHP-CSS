<?php include('config/constants.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Important to make website responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Website</title>

    <!-- Link our CSS file -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <style>
        h3 { color:#000000}
        h3 { text-align: center}
    </style>
    <!-- Navbar Section Starts Here -->
    <section class="navbar">
        <div class="container">
            <div class="logo">
                <a href=<?php echo SITEURL; ?> title="Logo">
                    <img src="images/logo.jpg" alt="E-commerce Logo" class="img-responsive">
                </a>
            </div>

            <div class="menu text-right">
                <ul>
                    <li>
                        <a href=<?php echo SITEURL;?> >Home</a>
                    </li>
                    <li>
                    <a href="<?php echo SITEURL; ?>categories.php">Categories</a>
                    </li>
                    <li>
                    <a href="<?php echo SITEURL; ?>products.php">Products</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>

            <div class="clearfix"></div>
        </div>
    </section>
    <!-- Navbar Section Ends Here -->