<?php include('partials-front/menu.php'); ?>
<?php 
    //CHeck whether id is passed or not
    if(isset($_GET['category_id']))
    {
        //Category id is set and get the id
        $category_id = $_GET['category_id'];
        // Get the CAtegory Title Based on Category ID
        $sql = "SELECT title FROM tbl_category WHERE id=$category_id";
        //Execute the Query
        $res = mysqli_query($conn, $sql);
        //Get the value from Database
        $row = mysqli_fetch_assoc($res);
        //Get the TItle
        $category_title = $row['title'];
    }
    else
    {
        //CAtegory not passed
        //Redirect to Home page
        header('location:'.SITEURL);
    }
?>


    <!-- product sEARCH Section Starts Here -->
    <section class="produt-search text-center">
        <div class="container">
            
            <h2>Products on <a href="#" class="text-black">"<?php echo $category_title; ?>"</a></h2>

        </div>
    </section>
    <!-- product sEARCH Section Ends Here -->



    <!-- product MEnu Section Starts Here -->
    <section class="product-menu">
        <div class="container">
            <h2 class="text-center">Product Menu</h2>

            <?php 
            
                //Create SQL Query to Get products based on Selected CAtegory
                $sql2 = "SELECT * FROM tbl_product WHERE category_id=$category_id";

                //Execute the Query
                $res2 = mysqli_query($conn, $sql2);

                //Count the Rows
                $count2 = mysqli_num_rows($res2);

                //CHeck whether product is available or not
                if($count2>0)
                {
                    //product is Available
                    while($row2=mysqli_fetch_assoc($res2))
                    {
                        $id = $row2['id'];
                        $title = $row2['title'];
                        $price = $row2['price'];
                        $description = $row2['description'];
                        $image_name = $row2['image_name'];
                        ?>
                        
                        <div class="product-menu-box">
                            <div class="product-menu-img">
                                <?php 
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
                    //product not available
                    echo "<div class='error'>Product not Available.</div>";
                }
            
            ?>


            <div class="clearfix"></div>

            

        </div>

    </section>
    <!-- product Menu Section Ends Here -->

<?php include('partials-front/footer.php'); ?>
