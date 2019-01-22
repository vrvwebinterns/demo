<?php
session_start();
$msg="";
$id=$_SESSION["usernameloginid"];
if(!isset($_SESSION['usernameloginid']))
	{
		header("location:http://localhost/shoppingsite/account.php");
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Cart | </title>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Bree+Serif|Pacifico" rel="stylesheet">
<style>
*{
    box-sizing: border-box;
}
.column {

    width: 100%;
    padding: 10px;
    box-shadow: 0px 0px 3px grey;
}
 footer {
      background-color: #d7d7d7;
      color: white;
      width: 100%;
      height: 7%;
      position: fixed;
      bottom: 0px;
    }

.btn {
    border: none;
    outline: none;
    padding: 12px 16px;
    background-color: #f1f1f1;
    cursor: pointer;
    border-radius: 10px;
    box-shadow: 0px 1px 3px #4caf50;
    color: #4caf50;
    font-family: 'Pacifico', cursive;
    font-family: 'Bree Serif', serif;
}
p
{
    font-family: 'Pacifico', cursive;
font-family: 'Bree Serif', serif;
}

.btn:hover {
    background-color: #ddd;
}

.btn.active {
    background-color: #666;
    color: white;
}
h3, p
{
margin-left:150px;

}
.desc
{
	white-space: nowrap;
    width: auto;
    overflow: hidden;
    text-overflow: ellipsis;
    color: cadetblue;
}
.h3head
{
  font-family: 'Pacifico', cursive;
font-family: 'Bree Serif', serif;
}
</style>
</head>
<body>
	<?php
	include "database.php";
	$sql="SELECT * FROM `cart` w,`products` p,`userlog` u WHERE w.productId=p.id and w.userId=u.id and u.id= '$id'";
	$result=mysqli_query($link,$sql);
		while($row=mysqli_fetch_array($result))
		{
      		$productid=$row["productId"];
      		$addingdate=$row["postingDate"];
      		$productName=$row["productName"];
      		$productimage1 = $row["productImage1"];
      		$productDescription=$row["productDescription"];
      		$productPrice=$row["productPrice"];
      		$productPriceBeforeDiscount=$row["productPriceBeforeDiscount"];
		
  echo "
<div class='row'>
  <div class='column'>
  <img src='admin/productimages/$productName/$productimage1' height=100px width=100px style='float:left;border-radius:12px'>
  <a href='checkout.php?productid=$productid'><button class='btn btn-primary btn-lg'  style='float:right'>Buy</button></a>
    <h3 class='h3head' >$productName</h3>
    <p class='desc' >$productDescription</p>
    <p style='color:green;'>Price: ₹ $productPrice ₹<strike style='color:grey'>$productPriceBeforeDiscount</strike> </p>&nbsp;
    <p style='color:pink;font-size:12px;float:left'>$addingdate</p>
        <form method='GET'><button name='cartdel' value='$productid' style='background-color:transparent;border:none'><i class='fa fa-trash w3-xlarge w3-text-red'></i></button></form>
  </div>
  <div style='height:2vh'> 
</div>
</div>
";
}
$sql32="SELECT * FROM cart";
$result32=mysqli_query($link,$sql32);
while($row32=mysqli_fetch_array($result32)) 
{
$pid=$row32["productId"];
if($row32[0]>0)
{
echo"
 <footer class='container-fluid'>
  <a href='checkout.php'><button class='btn btn-primary btn-lg'  style='float:right;background-color:green;color:white'>Place An Orders</button></a>
  <br><br>
</footer>
";
}
else
{
  echo"
 <footer class='container-fluid'>
  <a href='checkout.php'><button class='btn btn-primary btn-lg' disabled  style='float:right;background-color:green;color:white'>Place An Orders</button></a>
  <br><br>
</footer>
";
}
}
if (isset($_GET['cartdel']))
{
	include "database.php";
	$id=$_GET['cartdel'];
   $statusmatchfil=0;
	$sql3="DELETE FROM `cart` WHERE productid='$id'";
	mysqli_query($link,$sql3);
  $sql32="UPDATE `products` SET `status_cart`='$statusmatchfil' WHERE id='$id'";
  mysqli_query($link,$sql32);
	mysqli_close($link);
}
?>



</body>
</html>
