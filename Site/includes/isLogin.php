<?php 
  $isLogged = false;
  if (!$isLogged) {
    header('Location: /login.php'); 
  }
	// require 'db.php'; 
	// if ( ! isset($_SESSION['logged_user']) /*|| $_SESSION['ua'] != $_SERVER['HTTP_USER_AGENT'] */ ) { 
	// 	setcookie('referer', $_SERVER['REQUEST_URI'], time() + 600);
	// 	header('Location: /autorization.php'); 
	// } else {
	// 	$user = R::load('users', $_SESSION['logged_user']->id);
	// 	$user->date_online = date('Y-m-d H:i:s',time());
	// 	R::store($user);
	// }
?>