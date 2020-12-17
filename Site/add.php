<?php
  include 'includes/connect.php'; 

  $profiles_id = $_COOKIE['profiles_id'];
  $referer = $_SERVER['HTTP_REFERER'];

  if ($_GET['add'] == 'discipline') {
    $title = $_POST['title'];

    $result = mysqli_query($db, "SELECT * FROM `subjects` WHERE `name` = '$title' AND `teacher_id` = '$profiles_id';");
    if (mysqli_num_rows($result) == 0)
      mysqli_query($db, "INSERT INTO `subjects` (name, teacher_id) VALUES ('$title', '$profiles_id')");
  }
  else if ($_GET['add'] == 'lesson') {
    $title = $_POST['lesson_title'];
    $text = $_POST['lesson_text'];
    $subjects_id = $_GET['subjects_id'];

    mysqli_query($db, "INSERT INTO `lessons` (`subjects_id`, `profiles_id`, `title`, `text`) VALUES ('$subjects_id', '$profiles_id', '$title', '$text')"); 
  }
  else if ($_GET['add'] == 'practical') {
    $task = $_POST['practical_title'];
    $material = $_POST['practical_text'];
    $answer = $_POST['practical_answer'];
    $lesson_id = $_GET['lesson_id'];

    mysqli_query($db, "INSERT INTO `practical_works` (`lessons_id`, `task`, `material`, `answers`) VALUES ('$lesson_id', '$task', '$material', '$answer')"); 
  }

  header("Location: $referer");
?>