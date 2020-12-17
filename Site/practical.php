<?php 
  include 'includes/isLogin.php'; 
  include 'includes/connect.php'; 

  $practical_id = $_GET['practical_id'];
  $result = mysqli_query($db, "SELECT `task`, `material` FROM `practical_works` WHERE `id` = '$practical_id';");
  $practical = mysqli_fetch_array($result, MYSQLI_ASSOC);
  mysqli_close($db);
?>

<!DOCTYPE html>
<html lang="ru">
<head>
  <?php include 'includes/head.php'; ?>
  <link rel="stylesheet" href="css/schedule.css">
  <link rel="stylesheet" href="css/lesson.css">
</head>
<body>
  <?php include 'includes/header.php'; ?>

  <div class="container flex-row">
    <main class="main" id="main">

      <section class="lesson">
        <div class="lesson__title">
          <h2>
          <?=$practical['task']?>
          </h2>
        </div>
        
        <p class="lesson__text">
          <?=$practical['material']?>
        </p>
        <form action="practical_send_task.php?practical_id=<?=$practical_id?>" method="post">
          <input type="text" name="answer" placeholder="Введите ответ" required autocomplete="on">
          <input type="submit" value="Отправить">
        </form>
      </section>

    </main>

    <?php include 'includes/sidebar.php'; ?>
  </div>

  <?php include 'includes/footer.php'; ?>
</body>
</html>
