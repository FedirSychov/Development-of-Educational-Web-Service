<?php 
  include 'includes/isLogin.php'; 
  include 'includes/connect.php';
  $lesson_id = $_GET['lesson_id'];
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

      <form id="form_practical" class="lesson" action="add.php?add=practical&lesson_id=<?=$lesson_id?>" method="post" name="practical_add">
        <div class="lesson__title">
          <h2>
          <input form="form_practical" type="text" name="practical_title" placeholder="Название задания" required autocomplete="on" autofocus>
          </h2>
        </div>
        
        <p class="lesson__text">
          <textarea form="form_practical" name="practical_text" cols="30" rows="10" placeholder="Текст задания"></textarea>
        </p>
        <input form="form_practical" type="text" name="practical_answer" placeholder="Ответ" required autocomplete="on">
        <input form="form_practical" class="add_button" type="submit" value="Добавить">
      </form>
    </main>

    <?php include 'includes/sidebar.php'; ?>
  </div>

  <?php include 'includes/footer.php'; ?>
</body>
</html>
