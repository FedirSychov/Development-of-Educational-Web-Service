-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 15 2020 г., 15:19
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ewb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `discussions`
--

CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `name` varchar(245) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `subjects_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `title` varchar(245) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `subjects_id`, `profiles_id`, `title`, `text`) VALUES
(1, 3, 2, 'Массивы, поиск в массивах, обработка массивов', 'Массив относится к ссылочным типам данных и располагается в куче (англ. heap). Куча представляет собой непрерывную область памяти, с помощью которой реализуется динамически распределяемая память приложения. Куча разделяется на занятые и свободные области различного размера. При запуске процесса ОС выделяет ему память для размещения кучи. В дальнейшем память для кучи может выделяться динамически – по запросу программы. При инициализации статического массива для него в куче выделяется область памяти заданного размера. Этот размер не изменяется в течение выполнения программы. При инициализации статического массива его имени присваивается ссылка на первый элемент. При инициализации динамического массива для него в куче выделяется область памяти некоторой ёмкости (англ. capacity), которая больше реального размера массива. Ёмкость динамического массива может изменяться в течение выполнения программы. Имени динамического массива присваивается ссылка на его первый элемент. Пока реальный размер динамического массива меньше выделенной ему ёмкости, размер массива можно быстро увеличивать, выделяя дополнительные ячейки из свободной ёмкости. Когда размер массива сравняется с выделенной для него ёмкостью, то для дальнейшего увеличения размера массива выполняются следующие действия:\r\n1 В куче ищется и выделяется новая область памяти, превышающая размер массива. Если в куче нет области нужного объёма, то она выделяется в оперативной памяти, расширяя тем самым кучу.\r\n2 Содержимое массива копируется во вновь выделенную область памяти. При большом размере массива на это копирование уйдёт много времени!\r\n3 Имени массива присваивается новая ссылка, так как элементы массива мы скопировали в новые адреса.\r\n4 Выполняется команда освобождения предыдущего объёма памяти. Если язык программирования поддерживает автоматическое управление памятью, то возвращение объёма памяти операционной системе выполняется автоматически сборщиком мусора.'),
(2, 4, 3, 'Классы, основные понятия', 'Встроенные типы данных используются для хранения одного значения в объявленной переменной. Например, int x хранит целое значение в переменной с именем x. В объектно-ориентированном программировании, класс является типом данных, определяющим набор переменных и методов для объявленного объекта.\r\nНапример, если необходимо создать программу, которая управляет счетами в банке, то класс BankAccount может быть использован для объявления объекта, который будет иметь все свойства и методы, необходимые для управления индивидуальным счетом банка, такие как переменную balance и методы Deposit и Withdrawal. \r\nКласс похож на шаблон. Он определяет данные и поведение типа. Определение класса начинается с ключевого слова class, за которым следует имя класса. Тело класса содержит данные и действия, заключенные в фигурные скобки.\r\nТак же, как и встроенные типы могут быть использованы для объявления множества переменных, классы могут быть использованы для объявления множества объектов. Мы определяем (разрабатываем) класс, который является шаблоном для создания объектов. \r\nКак только мы создали класс, мы можем создавать объекты, основанные на этом классе. Создание объекта называется инстанциацией (создание экземпляра класса) и производится с использованием ключевого слова new.\r\nКаждый объект имеет свои собственные характеристики - поля.  \r\nЗначения этих полей описывают текущее состояние объекта. Например, Person (объект класса Person) может быть в возрасте 30 лет, мужского пола, и называться Antonio. \r\n\r\nИнкапсуляция \r\nЧастью значения слова инкапсуляция является идея \"окружения\" объекта, не только, чтобы сохранить вместе то, что находится внутри, а также чтобы защитить его. \r\nВ программировании инкапсуляция значит больше, чем просто комбинирование порций функционала внутри классов; она также значит ограничение доступа к этому классу от внешнего воздействия. Инкапсуляция реализуется с помощью модификаторов доступа. Модификаторы доступа определяют область видимости членов класса. \r\nC# поддерживает следующие модификаторы доступа: public, private, protected, internal, protected internal. \r\nКак уже было отображено в предыдущих примерах, модификатор доступа public делает элемент класса доступным снаружи класса.  \r\nМодификатор доступа private делает элементы класса доступными только изнутри класса, и прячет их от доступа снаружи. '),
(3, 4, 3, 'Базовые классы, наследование классов', 'Наследование, вместе с инкапсуляцией и полиморфизмом, является одной из трех основных характеристик (или базовых понятий) объектно-ориентированного программирования. Наследование позволяет создавать новые классы, которые повторно используют, расширяют и изменяют поведение, определенное в других классах. Класс, члены которого наследуются, называется базовым классом, а класс, который наследует эти члены, называется производным классом. Производный класс может иметь только один непосредственный базовый класс. Однако наследование является транзитивным. Если сlass C является производным от сlass B, и сlass B является производным от сlass A, сlass C наследует члены, объявленные в сlass B и сlass A. Основное назначение наследования заключается в построении иерархии объектов и повторном использовании кода.\r\nДля корректной работы программы необходимо разрабатывать конструктор, который использует ссылку на наследуемый класс. С этой целью используется ключевое слово base.\r\nКогда базовый класс объявляет метод как виртуальный, производный класс может переопределить метод с помощью своей собственной реализации.\r\nПримечательно, что для вызова метода из базового класса, нам необходимо просто обратиться к нему с помощью ключевого слова base.');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `lessons_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `mark` varchar(145) DEFAULT 'NONE',
  `correct_answers` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `messages_discussions`
--

CREATE TABLE `messages_discussions` (
  `id` int(11) NOT NULL,
  `discussions_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `practical_messages`
--

CREATE TABLE `practical_messages` (
  `id` int(11) NOT NULL,
  `practical_works_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `practical_messages`
--

INSERT INTO `practical_messages` (`id`, `practical_works_id`, `profiles_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'public, private, protected', '2020-12-15 15:12:18', '2020-12-15 15:12:18');

-- --------------------------------------------------------

--
-- Структура таблицы `practical_works`
--

CREATE TABLE `practical_works` (
  `id` int(11) NOT NULL,
  `lessons_id` int(11) NOT NULL,
  `task` text NOT NULL,
  `material` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `answers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `practical_works`
--

INSERT INTO `practical_works` (`id`, `lessons_id`, `task`, `material`, `created_at`, `updated_at`, `answers`) VALUES
(1, 1, 'Массивы, как тип данных в C#', 'К какому типу данных относится массив в C# ссылочному или значимому типу?', '2020-12-15 13:55:39', '2020-12-15 13:56:20', 'ссылочному'),
(2, 2, 'Создание класса', 'Какой оператор используется для создания экземпляра класса?', '2020-12-15 14:05:30', '2020-12-15 14:05:30', 'new'),
(3, 2, 'Модификаторы доступа', 'Какие три основных модификаторов доступа существует в C#? Перечислите через запятую.', '2020-12-15 14:07:03', '2020-12-15 14:07:03', 'public, private, protected'),
(4, 3, 'Конструткор базового класса', 'С помощью какого ключевого слова можно явным образом вызвать конструктор базового класса?', '2020-12-15 14:39:32', '2020-12-15 14:39:32', 'base');

-- --------------------------------------------------------

--
-- Структура таблицы `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(145) NOT NULL,
  `surname` varchar(145) NOT NULL,
  `middle_name` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `index` tinyint(1) NOT NULL DEFAULT 0,
  `institute` varchar(245) NOT NULL,
  `year` tinyint(1) NOT NULL,
  `group` varchar(145) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `birthday_at` date NOT NULL DEFAULT current_timestamp(),
  `add_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `surname`, `middle_name`, `email`, `index`, `institute`, `year`, `group`, `created_at`, `updated_at`, `birthday_at`, `add_info`) VALUES
(1, 'Данил', 'Шишков', 'Олегович', 'shishkov-01@bk.ru', 0, 'ИКСИБ', 2, '19-КБ-ПР1', '2020-12-15 13:44:27', '2020-12-15 13:44:27', '2020-12-15', NULL),
(2, 'Виталий', 'Марков', 'Николаевич', 'shishkov-01@bk.ru', 1, 'ИКСИБ', 2, '', '2020-12-15 13:47:22', '2020-12-15 13:47:22', '2020-12-15', NULL),
(3, 'Владислава', 'Мурлина', 'Анатольевна', 'shishkov-01@bk.ru', 1, 'ИКСИБ', 2, '', '2020-12-15 13:58:38', '2020-12-15 13:58:38', '2020-12-15', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `profiles_id` int(11) NOT NULL,
  `login` varchar(245) NOT NULL,
  `password` varchar(245) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`profiles_id`, `login`, `password`) VALUES
(1, 'danil', '8c9224d49f5b80e1549e5769faa6d6b3');

-- --------------------------------------------------------

--
-- Структура таблицы `student_answers`
--

CREATE TABLE `student_answers` (
  `id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `practical_works_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `answers` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(245) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'Математическая логика и теория алгоритмов', 2, '2020-12-15 13:47:47', '2020-12-15 13:47:47'),
(2, 'Теоретические основы информатики', 2, '2020-12-15 13:48:05', '2020-12-15 13:48:05'),
(3, 'Алгоритмы и структуры данных', 2, '2020-12-15 13:48:13', '2020-12-15 13:48:13'),
(4, 'Объектно-ориентированное программирование', 3, '2020-12-15 13:59:00', '2020-12-15 13:59:00'),
(5, 'Введение в программную инженерию', 3, '2020-12-15 13:59:19', '2020-12-15 13:59:19');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `profiles_id` int(11) NOT NULL,
  `login` varchar(245) NOT NULL,
  `password` varchar(245) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`profiles_id`, `login`, `password`) VALUES
(2, 'markov', '8c9224d49f5b80e1549e5769faa6d6b3'),
(3, 'myrlina', '8c9224d49f5b80e1549e5769faa6d6b3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_discussions_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lessons_subjects1_idx` (`subjects_id`),
  ADD KEY `fk_lessons_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD KEY `fk_marks_lessons1_idx` (`lessons_id`),
  ADD KEY `fk_marks_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `messages_discussions`
--
ALTER TABLE `messages_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_messages_discussions_discussions1_idx` (`discussions_id`),
  ADD KEY `fk_messages_discussions_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notifications_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `practical_messages`
--
ALTER TABLE `practical_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_practical_messages_practical_works1_idx` (`practical_works_id`),
  ADD KEY `fk_practical_messages_profiles1_idx` (`profiles_id`);

--
-- Индексы таблицы `practical_works`
--
ALTER TABLE `practical_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_practical_works_lessons1_idx` (`lessons_id`);

--
-- Индексы таблицы `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD KEY `fk_students_profiles_idx` (`profiles_id`);

--
-- Индексы таблицы `student_answers`
--
ALTER TABLE `student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_answers_profiles1_idx` (`profiles_id`),
  ADD KEY `fk_student_answers_practical_works1_idx` (`practical_works_id`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD KEY `fk_teachers_profiles1_idx` (`profiles_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `messages_discussions`
--
ALTER TABLE `messages_discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `practical_messages`
--
ALTER TABLE `practical_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `practical_works`
--
ALTER TABLE `practical_works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `student_answers`
--
ALTER TABLE `student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `fk_discussions_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `fk_lessons_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lessons_subjects1` FOREIGN KEY (`subjects_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `fk_marks_lessons1` FOREIGN KEY (`lessons_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marks_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `messages_discussions`
--
ALTER TABLE `messages_discussions`
  ADD CONSTRAINT `fk_messages_discussions_discussions1` FOREIGN KEY (`discussions_id`) REFERENCES `discussions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_messages_discussions_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `practical_messages`
--
ALTER TABLE `practical_messages`
  ADD CONSTRAINT `fk_practical_messages_practical_works1` FOREIGN KEY (`practical_works_id`) REFERENCES `practical_works` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_practical_messages_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `practical_works`
--
ALTER TABLE `practical_works`
  ADD CONSTRAINT `fk_practical_works_lessons1` FOREIGN KEY (`lessons_id`) REFERENCES `lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_profiles` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `student_answers`
--
ALTER TABLE `student_answers`
  ADD CONSTRAINT `fk_student_answers_practical_works1` FOREIGN KEY (`practical_works_id`) REFERENCES `practical_works` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_answers_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teachers_profiles1` FOREIGN KEY (`profiles_id`) REFERENCES `profiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
