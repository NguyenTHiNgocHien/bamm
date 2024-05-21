<?php
include_once 'lib/session.php';
include_once 'classes/product.php';
include_once 'classes/cart.php';
if (isset($_GET['search'])) {
    $search_query = $_GET['search'];
    // sử dụng $search_query để thực hiện tìm kiếm
}

$search_query ="";
$query_params = array('search' => $search_query);
$query_string = http_build_query($query_params);

$cart = new cart();
$totalQty = $cart->getTotalQtyByUserId();

$product = new product();
$list = mysqli_fetch_all($product->getFeaturedProducts(), MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Trang chủ</title>
</head>
            
<body>

    <section class="top">
    
        <div class="top-container">
            <div class="row">
                <div class="top-logo"><img src="images/logo1.jpg" alt="" width="160px" height="auto"></div>
                
               
                <div class="menu">
                <li><a href="index.php">Trang chủ</a></li>
                <li><a href="productList.php">Sản phẩm</a></li>
            <?php
            if (isset($_SESSION['user']) && $_SESSION['user']) { ?>
                <li><a href="logout.php" id="signin">Đăng xuất</a></li>
            <?php } else { ?>
                <li><a href="register.php" id="signup">Đăng ký</a></li>
                <li><a href="login.php" id="signin">Đăng nhập</a></li>
            <?php } ?>

            <li><a href="order.php" id="order">Đơn hàng</a></li>
                </div>   
                <div class="top-menu-icons">
                    <ul>
                        <li>
                            <form action="search.php" method="GET">
                                <input id="input_Search" name="search" type="text" placeholder="Tìm kiếm">
                                <i class="fas fa-search"></i>
                            </form>
                            <script>
    var input = document.getElementById("input_Search");
    var form = document.getElementById("search-form");

    input.addEventListener("keydown", function(event) {
        if (event.keyCode === 13) { // kiểm tra nếu là phím Enter
            form.submit(); // submit form
        }
    });
</script>
                        </li>
                    <li>
                <a href="checkout.php">
                    <i class="fa fa-shopping-bag" style="color: #551A8B;"></i>
                    <span style="color: #551A8B;" class="sumItem">
                        <?= ($totalQty['total']) ? $totalQty['total'] : "0" ?>
                    </span>
                </a>
            </li>
                    </ul>

                </div>
            </div>     
        </div>
    </section>
    <section class="sliders">
        <div class="aspect-ratio-169">
            <img src="data:image/jpeg;base64,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" alt="">
            <img src="data:image/jpeg;base64,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" alt="">
        </div>
        <div class="dot-container">
                <div class="dot active"></div>
                <div class="dot"></div>
        </div>
    

    </section>
        
    </div>

        <div class="featuredProducts">
        <h1>Sản phẩm nổi bật</h1>
    </div>
    <div class="container">
        <?php
        foreach ($list as $key => $value) { ?>
            <div class="card">
                <div class="imgBx">
                    <a href="detail.php?id=<?= $value['id'] ?>"><img src="admin/uploads/<?= $value['image'] ?>" alt=""></a>
                </div>
                <div class="content">
                    <div class="productName">
                        <a href="detail.php?id=<?= $value['id'] ?>">
                            <h3><?= $value['name'] ?></h3>
                        </a>
                    </div>
                    <div>
                        Đã bán: <?= $value['soldCount'] ?>
                    </div>
                    <div class="original-price">
                        <?php
                        if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                            Giá gốc: <del><?= number_format($value['originalPrice'], 0, '', ',') ?>VND</del>
                        <?php } else { ?>
                            <p>.</p>
                        <?php } ?>
                    </div>
                    <div class="price">
                        Giá bán: <?= number_format($value['promotionPrice'], 0, '', ',') ?>VND
                    </div>
                    <!-- <div class="rating">
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div> -->
                    <div class="action">
                        <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">Thêm vào giỏ</a>
                        <a class="detail" href="detail.php?id=<?= $value['id'] ?>">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        <?php }
        ?>
    </div>
    <footer>
        <div class="social">
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
        </div>
        <ul class="list">
         
        </ul>
        <p class="copyright">
                     <li>   Địa chỉ: Số 23 Đường Cát Bi , Thành Tô , Hải An Hải Phòng </li>
                    <li>Điện thoại: 028 6680 4323 -  Hotline:  0935 051 068 </li>
                    <li>Email:  admin@gmail.com</li></p>
    </footer>
    <script src="js/script.js"></script>
    <script src="js/slider.js"></script>
</body>

</html>