<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="footer, address, phone, icons" />
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/footer-distributed-with-contact-form.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

</head>

	<body>


		<!-- The content of your page would go here. -->

		<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Shreya's<span>Sweets</span></h3>

				<p class="footer-company-name">Shreya's Sweets &copy; 2018</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>GHS Rd, Hampankatta</span> Mangalore</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p><a href="tel:0824 426 4683">
						0824 426 4683</a></p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@shreyasweets.in">support@shreyasweets.in</a></p>
				</div>
					
				
			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About Shreya's Sweets</span>
					Shreya's Sweets.
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-whatsapp"></i></a>
					<a href="#"><i class="fa fa-instagram"></i></a>
					<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d124449.9760559666!2d74.89584536290559!3d12.903750803360472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x3ba35a4d98588849%3A0x6dd2968cf7ddd1ce!2sshreyas+sweets+mangalore!3m2!1d12.867949699999999!2d74.8405731!5e0!3m2!1sen!2sin!4v1521886165542"></iframe>

				</div>

			</div>
			<p style="color: white!important">Contact Us</p>	
<form  method="post">

					<input type="email" name="email" placeholder="Email" />
					<textarea name="message" placeholder="Message"></textarea>
					<button type="submit" name="send">Send</button>

				</form>
		</footer>

<?php
include "database.php";
if(isset($_POST['send']))
{
	$email=$_POST['email'];
	$message=$_POST['message'];
$sql="INSERT INTO `sitefeedback`(`email`, `message`) VALUES ('$email','$message')";
mysqli_query($link,$sql);
}
?>
	</body>

</html>
