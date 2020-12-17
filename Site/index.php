<?php 
  include 'includes/isLogin.php'; 
?>

<!DOCTYPE html>
<html lang="ru">
<head>
  <?php include 'includes/head.php'; ?>
  <link rel="stylesheet" href="css/schedule.css">
  <link rel="stylesheet" href="css/home.css">
</head>
<body>
  <?php include 'includes/header.php'; ?>

  <div class="container flex-row">
    <main class="main" id="main">
      <section class="person">
        <div class="person__photo">
          <img src="/img/person-photo.jpg" alt="Фото">
        </div>
        <div class="person-content">
          <h2 class="person-content__name"><?php echo($user['surname']." ".$user['name']." ".$user['middle_name']); ?></h2>
          <div>Институт компьютерных систем и информационной безопасности</div>
          
          <?php if ($user['index'] == 0):?>
          <div>09.03.04 Программная инженерия</div>
          <div class="person-content__group">Группа <a href="#" class="underline"><?php echo($user['group']); ?></a></div>
          <?php endif; ?>
          
        </div>
      </section>
      
      <section class="tasks">
        <h2 class="tasks__header"><span>Быстрый доступ к заданиям</span></h2>
        <ul class="tasks-list">
          <li class="tasks-list__item">
            <a href="">
              <span class="abbreviation">АСД</span>
              Реализовать алгоритм обхода графа в глубину и в ширину
            </a>
          </li>
          <li class="tasks-list__item">
            <a href="">
              <span class="abbreviation">ООП</span>
              Разработать класс студента на базе класса человека
            </a>
          </li>
          <li class="tasks-list__item">
            <a href="">
              <span class="abbreviation">ВвПИ</span>
              Написать техническое задание
            </a>
          </li>
        </ul>
      </section>
    </main>

    <?php include 'includes/sidebar.php'; ?>
  </div>
  
  <?php include 'includes/footer.php'; ?>
</body>
</html>