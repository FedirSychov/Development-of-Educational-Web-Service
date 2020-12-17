<?php
  if ($_COOKIE['profiles_id'] == '')
		header('Location: authorization.php');
	$profiles_id = $_COOKIE['profiles_id'];

	include 'includes/connect.php'; 
	$result = mysqli_query($db, "SELECT `name`, `surname`, `middle_name`, `institute`, `group`, `index` FROM `profiles` WHERE `id` = '$profiles_id'");
  if (mysqli_num_rows($result) == 0)
    header('Location: authorization.php');
  $user = mysqli_fetch_array($result);

?>