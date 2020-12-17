<?php 
  include 'includes/isLogin.php'; 
  include 'includes/connect.php';
  $subjects_id = $_GET['subjects_id'];
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

      <form id="form_lesson" class="lesson" action="add.php?add=lesson&subjects_id=<?=$subjects_id?>" method="post" name="lesson_add">
        <div class="lesson__title">
          <h2>
          <input form="form_lesson" type="text" name="lesson_title" placeholder="Название лекции" required autocomplete="on" autofocus>
          </h2>
        </div>
        
        <p class="lesson__text">
          <textarea form="form_lesson" name="lesson_text" cols="30" rows="10" placeholder="Текст лекции"></textarea>
        </p>
        <input form="form_lesson" class="add_button" type="submit" value="Добавить">
      </form>
    </main>

    <?php include 'includes/sidebar.php'; ?>
  </div>

  <?php include 'includes/footer.php'; ?>
</body>
</html>
