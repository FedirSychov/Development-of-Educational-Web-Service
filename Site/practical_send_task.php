<?php
  include 'includes/connect.php'; 

  $profiles_id = $_COOKIE['profiles_id'];
  $practical_id = $_GET['practical_id'];
  $answer = $_POST['answer'];

  header("Location: ". $_SERVER['HTTP_REFERER']);
  mysqli_query($db, "INSERT INTO `practical_messages` (`practical_works_id`, `profiles_id`, `text`) VALUES ('$practical_id', '$profiles_id', '$answer')");

?>
