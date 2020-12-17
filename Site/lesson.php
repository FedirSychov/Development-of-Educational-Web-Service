<?php 
  include 'includes/isLogin.php'; 
  include 'includes/connect.php'; 

  $lesson_id = $_GET['lesson_id'];
  $profiles_id = $_COOKIE['profiles_id'];
  $result = mysqli_query($db, "SELECT * FROM `lessons` WHERE `id` = '$lesson_id' AND `profiles_id` = '$profiles_id'");
  $isTeacherThis = mysqli_num_rows($result) > 0;

  $result = mysqli_query($db, "SELECT `title`, `text` FROM `lessons` WHERE `id` = '$lesson_id';");
  $lesson = mysqli_fetch_array($result, MYSQLI_ASSOC);

  $result = mysqli_query($db, "SELECT * FROM `practical_works` WHERE `lessons_id` = '$lesson_id';");
  $practicals = mysqli_fetch_all($result, MYSQLI_ASSOC);
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
          <?=$lesson['title']?>
          </h2>
        </div>
        
        <p class="lesson__text">
          <?=$lesson['text']?>
        </p>
      </section>

      <section class="practicals">
        <div class="practicals__title">
          <h2>Практические задания</h2>
          <?php if ($isTeacherThis): ?>
            <a class="add_button" href="practical_add.php?lesson_id=<?=$lesson_id?>">+</a>
          <?php endif; ?>
        </div>
        
        <ul class="practicals-list">

        <?php if ($practicals) foreach ($practicals as $practical) { ?>
          <li class="practicals-list__item">
            <a href="practical.php?practical_id=<?=$practical['id']?>">
              <div class="practical">
                <h3 class="practical-title">
                  <?=$practical['task']?>
                </h3>
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
