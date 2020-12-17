<?php
  include 'connect.php';

  // Получаем данные с форм
  $login = filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING);
  $password = filter_var(trim($_POST['password']), FILTER_SANITIZE_STRING);
  
  $hash_pass = md5($pass."educationwebservice");
  $result_teachers = mysqli_query($db, "SELECT * FROM teachers WHERE `login` = '$login' AND `password` = '$hash_pass'");
  $result_students = mysqli_query($db, "SELECT * FROM students WHERE `login` = '$login' AND `password` = '$hash_pass'");
  if (mysqli_num_rows($result_teachers) == 0 && mysqli_num_rows($result_students) == 0) {
    setcookie('message', "Пользователь не найден!", time() + 60, "/authorization.php");
    header('Location: /authorization.php');
    exit();
  }
  mysqli_close($db);

  if (mysqli_num_rows($result_teachers) > 0)
    $profiles_id = mysqli_fetch_assoc($result_teachers)['profiles_id'];
  else 
    $profiles_id = mysqli_fetch_assoc($result_students)['profiles_id'];
  setcookie('profiles_id', $profiles_id, time() + 3600 * 24 * 7, "/");
  header('Location: /');
?> 