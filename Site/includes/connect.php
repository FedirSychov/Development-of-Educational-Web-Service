<?php
$db = mysqli_connect('localhost', 'mysql', 'mysql', 'ewb');
if ($db == false){
  echo("<script>alert('Не удалось подключиться к БД');</script>");
}
?>