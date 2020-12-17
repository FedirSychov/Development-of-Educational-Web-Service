<?php 
  include 'connect.php';

  // Получаем данные с форм
  $isTeacher = ($_POST['isTeacher'] == "on") ? 1 : 0;

  $login = filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING);
  $name = filter_var(trim($_POST['name']), FILTER_SANITIZE_STRING);
  $surname = filter_var(trim($_POST['surname']), FILTER_SANITIZE_STRING);
  $middle_name = filter_var(trim($_POST['middle_name']), FILTER_SANITIZE_STRING);
  $group = $isTeacher ? null : filter_var(trim($_POST['group']), FILTER_SANITIZE_STRING);
  $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_STRING);
  $password = filter_var(trim($_POST['password']), FILTER_SANITIZE_STRING);

  // Проверяем существует ли уже пользователь
  $result_teachers = mysqli_query($db, "SELECT * FROM teachers WHERE `login` = '$login'");
  $result_students = mysqli_query($db, "SELECT * FROM students WHERE `login` = '$login'");
  if (mysqli_num_rows($result_students) > 0 || mysqli_num_rows($result_teachers) != 0) {
    setcookie('message', "Пользователь с таким логином уже существует!", time() + 60, "/registration.php");
    header('Location: /registration.php');
    exit;
  }
  
  // Сохраняем основные данные пользователя
  mysqli_query($db, "INSERT INTO `profiles` (`name`, `surname`, `middle_name`, `email`, `index`, `institute`, `year`, `group`) VALUES ('$name', '$surname','$middle_name','$email', $isTeacher, 'ИКСИБ', 2, '$group')");
  $profiles_id = mysqli_insert_id($db);

  // Сохраняем данные для входа студента/преподавателя
  $hash_pass = md5($pass."educationwebservice");
  if ($isTeacher)
    mysqli_query($db, "INSERT INTO `teachers` VALUES ('$profiles_id', '$login', '$hash_pass')");
  else 
    mysqli_query($db, "INSERT INTO `students` VALUES ('$profiles_id', '$login', '$hash_pass')");
  mysqli_close($db);


  setcookie('profiles_id', $profiles_id, time() + 3600 * 24 * 7, "/");
  header('Location: /');
?>