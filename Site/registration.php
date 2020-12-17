<?php 
  $message = $_COOKIE['message'];
  setcookie('message', "", time() - 60, "/registration.php");
?>
<!DOCTYPE html>
<html lang="ru">
<head>
  <?php include 'includes/head.php'; ?>
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <?php if ($message) echo("<script>alert('".$message."');</script>"); ?>
  <div class="connect-wrap">
    <div class="connect">
      <h2 class="connect__title">Регистрация</h2>
      <form class="connect__form" action="includes/check.php" method="post" name="user">
        <input type="text" name="login" placeholder="Введите логин" required autocomplete="on" autofocus>
        <input type="text" name="surname" placeholder="Введите фамилию" required>
        <input type="text" name="name" placeholder="Введите имя" required>
        <input type="text" name="middle_name" placeholder="Введите отчество" required>
        <input type="text" name="group" placeholder="Введите группу" required>
        <input type="text" name="email" placeholder="Введите почту" required>
        <input type="password" name="password" placeholder="Введите пароль" required>
        <label><input type="checkbox" name="isTeacher"> Преподаватель</label>
        <input type="submit" value="Зарегистрироваться">
        <a class="connect__else" href="authorization.php">Авторизация</a>
      </form>
    </div>
  </div>

</body>
</html>
