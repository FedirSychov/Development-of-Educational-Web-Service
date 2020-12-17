<?php 
  include 'includes/isLogin.php'; 
  include 'includes/connect.php'; 

  $subjects_id = $_GET['subjects_id'];
  $profiles_id = $_COOKIE['profiles_id'];

  // Проверяем на преподавателя
  $result = mysqli_query($db, "SELECT * FROM `subjects` WHERE `id` = '$subjects_id' AND `teacher_id` = '$profiles_id'");
  $isTeacherThis = mysqli_num_rows($result) > 0;

  $result = mysqli_query($db, "SELECT `id`, `title`, `text` FROM `lessons` WHERE `subjects_id` = '$subjects_id';");
  $lessons = mysqli_fetch_all($result, MYSQLI_ASSOC);
  mysqli_close($db);
?>

<!DOCTYPE html>
<html lang="ru">
<head>
  <?php include 'includes/head.php'; ?>
  <link rel="stylesheet" href="css/schedule.css">
  <link rel="stylesheet" href="css/discipline.css">
</head>
<body>
  <?php include 'includes/header.php'; ?>

  <div class="container flex-row">
    <main class="main" id="main">
      <section class="search">
        <div class="search-field">
          <form action="lessons.php" method="post" name="lessons">
            <input type="text" name="name" placeholder="Название лекции" required autocomplete="on" autofocus>
            <input type="submit" value="Поиск">
          </form>

          <?php if ($isTeacherThis): ?>
            <a class="add_button" href="lesson_add.php?subjects_id=<?=$subjects_id?>">+</a>
          <?php endif; ?>

        </div>
        <ul class="search-results">

        <?php if ($lessons) foreach ($lessons as $lesson) { ?>
          <li class="search-results__item">
            <a href="lesson.php?lesson_id=<?=$lesson['id']?>">
              <div class="lesson">
                <h3 class="lesson-title bold">
                  <?=$lesson['title']?>
                  
                </h3>
                <div class="lesson-subtitle">
                  <?php echo (mb_strimwidth($lesson['text'], 0, 50, '...')); ?>
                </div>
              </div>
            </a>
          </li>
        <?php } ?>

        </ul>
      </section>
    </main>

    <?php include 'includes/sidebar.php'; ?>
  </div>

  <?php include 'includes/footer.php'; ?>
</body>
</html>
