-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2022 г., 08:50
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `navsursu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `elevators`
--

CREATE TABLE `elevators` (
  `id` int(16) NOT NULL COMMENT 'ID лифта',
  `floor` int(3) NOT NULL COMMENT 'Этаж',
  `X` int(16) NOT NULL COMMENT 'Координата по X',
  `Y` int(16) NOT NULL COMMENT 'Координата по Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(16) NOT NULL COMMENT 'ID сотрудника',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'Фамилия',
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя',
  `patronymic` varchar(255) DEFAULT NULL COMMENT 'Отчество',
  `id_of_kab` int(16) NOT NULL COMMENT 'Номер кабинета',
  `email` varchar(255) DEFAULT NULL COMMENT 'Электронная почта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL COMMENT 'ID этажа',
  `id_of_kab` int(11) NOT NULL COMMENT 'ID этажа',
  `id_of_toilet` int(16) NOT NULL COMMENT 'ID туалета',
  `id_of_stairs` int(16) NOT NULL COMMENT 'ID лестницы',
  `id_of_elevator` int(16) NOT NULL COMMENT 'ID лифта',
  `id_of_qr` int(16) NOT NULL COMMENT 'ID места с QR кодом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `kabinets`
--

CREATE TABLE `kabinets` (
  `id` int(16) NOT NULL COMMENT 'ID кабинета',
  `id_of_employees` int(16) NOT NULL COMMENT 'ID сотрудника',
  `X` int(16) NOT NULL COMMENT 'координата по X',
  `Y` int(16) NOT NULL COMMENT 'координата по Y',
  `id_of_toilet` int(16) NOT NULL COMMENT 'ID туалета',
  `id_of_stairs` int(16) NOT NULL COMMENT 'ID лестницы',
  `id_of_elevator` int(16) NOT NULL COMMENT 'ID лифта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `korpus`
--

CREATE TABLE `korpus` (
  `id` int(16) NOT NULL COMMENT 'ID корпуса',
  `id_of_floor` int(16) NOT NULL COMMENT 'ID этажа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `qr`
--

CREATE TABLE `qr` (
  `id` int(11) NOT NULL COMMENT 'ID места',
  `X` int(16) NOT NULL COMMENT 'Координата по X	',
  `Y` int(16) NOT NULL COMMENT 'Координата по Y',
  `id_of_toilet` int(16) NOT NULL COMMENT 'ID туалета',
  `id_of_stairs` int(16) NOT NULL COMMENT 'ID лестницы',
  `id_of_elevator` int(16) NOT NULL COMMENT 'ID лифта'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stairs`
--

CREATE TABLE `stairs` (
  `id` int(11) NOT NULL COMMENT 'ID лестницы',
  `floor` int(11) NOT NULL COMMENT 'Этаж',
  `X` int(11) NOT NULL COMMENT 'Координата по X',
  `Y` int(11) NOT NULL COMMENT 'Координата по Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `toilet`
--

CREATE TABLE `toilet` (
  `id` int(11) NOT NULL COMMENT 'ID туалета',
  `floor` int(11) NOT NULL COMMENT 'Этаж',
  `X` int(11) NOT NULL COMMENT 'координата по X',
  `Y` int(11) NOT NULL COMMENT 'координата по Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `elevators`
--
ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_of_kab` (`id_of_kab`),
  ADD KEY `floors_ibfk_1` (`id_of_elevator`),
  ADD KEY `floors_ibfk_4` (`id_of_stairs`),
  ADD KEY `floors_ibfk_5` (`id_of_toilet`),
  ADD KEY `floors_ibfk_3` (`id_of_qr`);

--
-- Индексы таблицы `kabinets`
--
ALTER TABLE `kabinets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_of_employees` (`id_of_employees`),
  ADD KEY `id_of_elevator` (`id_of_elevator`),
  ADD KEY `id_of_stairs` (`id_of_stairs`),
  ADD KEY `id_of_toilet` (`id_of_toilet`);

--
-- Индексы таблицы `korpus`
--
ALTER TABLE `korpus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_of_floor` (`id_of_floor`);

--
-- Индексы таблицы `qr`
--
ALTER TABLE `qr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_of_elevator` (`id_of_elevator`),
  ADD KEY `id_of_stairs` (`id_of_stairs`),
  ADD KEY `id_of_toilet` (`id_of_toilet`);

--
-- Индексы таблицы `stairs`
--
ALTER TABLE `stairs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `toilet`
--
ALTER TABLE `toilet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID сотрудника';

--
-- AUTO_INCREMENT для таблицы `korpus`
--
ALTER TABLE `korpus`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID корпуса';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floors_ibfk_1` FOREIGN KEY (`id_of_elevator`) REFERENCES `elevators` (`id`),
  ADD CONSTRAINT `floors_ibfk_2` FOREIGN KEY (`id_of_kab`) REFERENCES `kabinets` (`id`),
  ADD CONSTRAINT `floors_ibfk_3` FOREIGN KEY (`id_of_qr`) REFERENCES `qr` (`id`),
  ADD CONSTRAINT `floors_ibfk_4` FOREIGN KEY (`id_of_stairs`) REFERENCES `stairs` (`id`),
  ADD CONSTRAINT `floors_ibfk_5` FOREIGN KEY (`id_of_toilet`) REFERENCES `toilet` (`id`);

--
-- Ограничения внешнего ключа таблицы `kabinets`
--
ALTER TABLE `kabinets`
  ADD CONSTRAINT `kabinets_ibfk_1` FOREIGN KEY (`id_of_employees`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `kabinets_ibfk_2` FOREIGN KEY (`id_of_elevator`) REFERENCES `elevators` (`id`),
  ADD CONSTRAINT `kabinets_ibfk_3` FOREIGN KEY (`id_of_stairs`) REFERENCES `stairs` (`id`),
  ADD CONSTRAINT `kabinets_ibfk_4` FOREIGN KEY (`id_of_toilet`) REFERENCES `toilet` (`id`);

--
-- Ограничения внешнего ключа таблицы `korpus`
--
ALTER TABLE `korpus`
  ADD CONSTRAINT `korpus_ibfk_1` FOREIGN KEY (`id_of_floor`) REFERENCES `floors` (`id`);

--
-- Ограничения внешнего ключа таблицы `qr`
--
ALTER TABLE `qr`
  ADD CONSTRAINT `qr_ibfk_1` FOREIGN KEY (`id_of_elevator`) REFERENCES `elevators` (`id`),
  ADD CONSTRAINT `qr_ibfk_2` FOREIGN KEY (`id_of_stairs`) REFERENCES `stairs` (`id`),
  ADD CONSTRAINT `qr_ibfk_3` FOREIGN KEY (`id_of_toilet`) REFERENCES `toilet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
