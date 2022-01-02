
<?php
require 'layout/autoload.php';
if(!isset($_GET['id_product'])){
    header('location:index.php');
}else{
    require 'layout/header.php';
    $id = $_GET['id_product'];
    $product = new Product();
    $detail = $product->getProductById($id);
    foreach ($detail as $key => $value_detail) {
        ?>
        <style>
        
        .comment{
            margin: 10px 0;
        }
        
        </style>
    <div class="detail" style="padding-top:10px">
        <div class="row">
            <div class="col-md-5">
                <img style="height:340px" class="img-responsive"
                    src="public/image/<?php echo $value_detail['image'] ?>" alt="">
            </div>
            <div class="col-md-7">
                <h3><?php echo $value_detail['name'] ?></h3>
               
                <h4 style="color:red">Giá: <?php echo $value_detail['price'] ?> VNĐ</h4>
                
                <form action="cart.php?id_product=<?php echo $value_detail['id'] ?>" method="POST">
                <div class="row">
                <div class="col-md-3">
                   <br> Số Lượng:
                </div>
                <div class="col-md-3">
                    <br><input type="number" value="1" min="1" class="form-control" name="qty"> </div>   <br> 
                    <div class="col-md-4"><input class="btn btn-success" type="submit" value="Mua hàng"></div> 
                </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="san-pham">
                    <span>Mô Tả Sản Phẩm:</span>
                </div>
            </div>
            <div class="col-md-12">
                <div class="desc">
                    <p><?php echo $value_detail['description'] ?></p>
                </div>
            </div>
        </div>
        <div class="row">
            
            <?php
            
            $db = new Db();
            $sql = "SELECT * FROM comment ORDER BY id DESC";
            
            if(isset($_GET['page'])){
                $page = $_GET['page'];
                if($page < 2){
                    $page = 1;
                }else{
                    $page = $_GET['page'];
                }
            }else{
                $page = 1;
            }
            $cmt = $db->pagination($sql,$page,5);
            if (count($cmt) > 0) {
                foreach ($cmt as $key => $value_comment) {
                ?>
           
                <?php
             } 
             $db->numPagination1($sql,$page,5);
             ?>    
                
             <?php
            }else {
            ?>
                 <?php
        }
    }
             ?>
        </div>
    </div>
<?php
    
}
require 'layout/close.php';
require 'layout/footer.php';
?>