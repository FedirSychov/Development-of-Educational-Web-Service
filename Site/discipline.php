<?php 
  include 'includes/isLogin.php'; 

  // Проверяем на преподавателя
  $isTeacher = $user['index'] == 1;

  // Загружаем список дисциплин
  $result = mysqli_query($db, "SELECT id, name, teacher_id, (SELECT name AS teacher_name FROM profiles WHERE id = teacher_id) AS teacher_name, (SELECT surname FROM profiles WHERE id = teacher_id) AS teacher_surname, (SELECT middle_name FROM profiles WHERE id = teacher_id) AS teacher_middle_name FROM subjects;");
  $subjects = mysqli_fetch_all($result, MYSQLI_ASSOC);
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
        <?php if ($isTeacher): ?>
        <form class="discipline_add" action="add.php?add=discipline" method="post" name="discipline_add">
          <input type="text" name="title" placeholder="Название дисциплины" required autocomplete="on" autofocus>
          <input type="submit" value="Добавить">
        </form>
        <?php endif;?>
        <form class="search-field" action="discipline.php" method="post" name="discipline">
          <input type="text" name="name" placeholder="Название дисциплины" required autocomplete="on" autofocus>
          <input type="text" name="teacher" placeholder="Преподаватель" required>
          <input type="submit" value="Поиск">
        </form>
        <ul class="search-results">

        <?php foreach ($subjects as $value) { ?>
          <li class="search-results__item">
            <a href="lessons.php?subjects_id=<?=$value['id']?>">
              <div class="discipline">
                <h3 class="discipline-title bold"><?=$value['name']?></h3>
                <div class="discipline-teacher">
                  <?=$value['teacher_surname'] . " " . $value['teacher_name'] . " " . $value['teacher_middle_name']?>
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