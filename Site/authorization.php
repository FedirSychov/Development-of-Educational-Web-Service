<?php 
  $message = $_COOKIE['message'];
  setcookie('message', "", time() - 60, "/authorization.php");
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
      <h2 class="connect__title">Авторизация</h2>
      <form class="connect__form" action="includes/login.php" method="post" name="user">
        <input type="text" name="login" placeholder="Введите логин..." required autocomplete="on" autofocus>
        <input type="password" name="password" placeholder="Введите пароль..." required>
        <input type="submit" value="Войти">
        <a class="connect__else" href="registration.php">Регистрация</a>
      </form>
    </div>
  </div>

</body>
</html>