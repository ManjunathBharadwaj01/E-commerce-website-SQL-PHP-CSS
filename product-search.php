<?php include('partials-front/menu.php'); ?>


    <!-- product sEARCH Section Starts Here -->
    <section class="product-search text-center">
        <div class="container">
        <?php 

            //Get the Search Keyword
            // $search = $_POST['search'];
            $search = mysqli_real_escape_string($conn, $_POST['search']);

        ?>
            
            <h2>Products on Your Search <a href="#" class="text-white">"<?php echo $search; ?>"</a></h2>

        </div>
    </section>
    <!-- product sEARCH Section Ends Here -->



    <!-- product MEnu Section Starts Here -->
    <section class="product-menu">
        <div class="container">
            <h2 class="text-center">Product Menu</h2>

            <?php 

                //SQL Query to Get Products based on search keyword
                //$search = burger '; DROP database name;
                // "SELECT * FROM tbl_Product WHERE title LIKE '%burger'%' OR description LIKE '%burger%'";
                $sql = "SELECT * FROM tbl_product WHERE title LIKE '%$search%' OR description LIKE '%$search%'";

                //Execute the Query
                $res = mysqli_query($conn, $sql);

                //Count Rows
                $count = mysqli_num_rows($res);

                //Check whether product available of not
                if($count>0)
                {
                    //product Available
                    while($row=mysqli_fetch_assoc($res))
                    {
                        //Get the details
                        $id = $row['id'];
                        $title = $row['title'];
                        $price = $row['price'];
                        $description = $row['description'];
                        $image_name = $row['image_name'];
                        ?>

                        <div class="product-menu-box">
                            <div class="product-menu-img">
                                <?php 
                                    // Check whether image name is available or not
                                    if($image_name=="")
                                    {
                                        //Image not Available
                                        echo "<div class='error'>Image not Available.</div>";
                                    }
                                    else
                                    {
                                        //Image Available
                                        ?>
                                        <img src="<?php echo SITEURL; ?>images/product/<?php echo $image_name; ?>" alt="Laptop/Mobile" class="img-responsive img-curve">
                                        <?php 

                                    }
                                ?>
                                
                            </div>

                            <div class="product-menu-desc">
                                <h4><?php echo $title; ?></h4>
                                <p class="product-price">Rs<?php echo $price; ?></p>
                                <p class="product-detail">
                                    <?php echo $description; ?>
                                </p>
                                <br>

                                <a href="<?php echo SITEURL; ?>order.php?product_id=<?php echo $id; ?>" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>

                        <?php
                    }
                }
                else
                {
                    //product Not Available
                    echo "<div class='error'>Product not found.</div>";
                }
            
            ?>


            <div class="clearfix"></div>

            

        </div>

    </section>
    <!-- product Menu Section Ends Here -->

<?php include('partials-front/footer.php'); ?>
