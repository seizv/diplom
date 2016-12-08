-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 08 2016 г., 19:27
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvc`
--
USE `seiz`;

-- --------------------------------------------------------

--
-- Структура таблицы `flowers`
--

CREATE TABLE `flowers` (
  `id` int(5) NOT NULL,
  `category` varchar(40) CHARACTER SET utf8 NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `price` int(5) NOT NULL DEFAULT '0',
  `size` int(3) NOT NULL DEFAULT '0',
  `is_available` tinyint(4) NOT NULL DEFAULT '0',
  `foto` varchar(1024) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `flowers`
--

INSERT INTO `flowers` (`id`, `category`, `name`, `price`, `size`, `is_available`, `foto`) VALUES
(3, 'rose', 'Black Horse', 65, 80, 1, '/webroot/img/slide5.png'),
(5, 'rose', 'Black Man', 78, 80, 1, '/webroot/img/slide1.png'),
(13, 'rose', 'Black Man', 48, 0, 0, '/webroot/uploads/ff660a906e1d5ac1e44904f993c39c5d.png'),
(14, 'rose', 'Black Man', 78, 80, 0, '/webroot/img/slide1.png'),
(19, 'rose', 'Black Man', 78, 80, 0, '/webroot/uploads/309a846d374be17b8426e6f98ae5739c.jpg'),
(20, 'rose', 'Black Man', 78, 80, 0, '/webroot/img/slide1.png'),
(21, 'rose', 'Black Man', 78, 55, 1, '/webroot/uploads/9fb59d9ff1055fd6f9c9a67ac8f461ab.jpg'),
(32, 'rose', 'Black Man', 78, 80, 1, '/webroot/uploads/8668cc1aaac49e2b931add88333bcf94.png'),
(34, 'tulip', 'red', 45, 0, 1, '/webroot/uploads/8668cc1aaac49e2b931add88333bcf94.png'),
(35, 'chrysanthemum', 'белая', 45, 65, 1, '/webroot/uploads/e670f2cf45981391c1cd984c9496cb21.png'),
(38, 'lily', 'pink', 0, 0, 1, '/webroot/uploads/21397c69996ff563ffe441ea63f5d2e4.jpg'),
(39, 'lily', 'cool', 0, 0, 1, '/webroot/uploads/05f481092a6d13ad2145e6724c920728.jpg'),
(40, 'lily', 'yellow', 0, 0, 1, '/webroot/uploads/6eea296d6102ff4c3d3cab4a47c216ae.jpg'),
(41, 'lily', 'very nice', 0, 300, 1, '/webroot/uploads/8807926dc8f6a35437cee53b06a7b964.jpg'),
(42, 'lily', 'xxx', 0, 0, 1, '/webroot/uploads/18df640bf63679f936fb60c4d4fa005a.jpg'),
(43, 'lily', 'lily', 0, 0, 1, '/webroot/uploads/3faeef3c8138de7fa536ad0b5826430c.jpg'),
(44, 'lily', 'lily2', 0, 0, 1, '/webroot/uploads/6f48684084b4ffe61c1ed0ec70862f1f.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`) VALUES
(1, 'Test', 'test@test.com', 'Test message'),
(5, 'Ð¹Ñ†ÑƒÐº', ' ', 'ÑƒÑ†ÐºÐ¹ Ñ†ÑƒÐº'),
(6, 'dg', 'df', 'df');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(32) NOT NULL,
  `is_active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@your-site.com', 'admin', '44ca5fa5c67e434b9e779c5febc46f06', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `flowers`
--
ALTER TABLE `flowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
