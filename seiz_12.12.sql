-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 12 2016 г., 21:41
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `seiz`
--
CREATE DATABASE IF NOT EXISTS `seiz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `seiz`;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id_category` smallint(6) NOT NULL,
  `category_name` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- СВЯЗИ ТАБЛИЦЫ `category`:
--

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(6, 'carnation'),
(1, 'chrysanthemum'),
(5, 'lily'),
(4, 'orhid'),
(3, 'rose'),
(2, 'tulip');

-- --------------------------------------------------------

--
-- Структура таблицы `flowers`
--

CREATE TABLE `flowers` (
  `id` int(5) NOT NULL,
  `id_category` smallint(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` int(5) NOT NULL DEFAULT '0',
  `size` int(3) NOT NULL DEFAULT '0',
  `is_available` tinyint(4) NOT NULL DEFAULT '0',
  `foto` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `flowers`:
--   `id_category`
--       `category` -> `id_category`
--

--
-- Дамп данных таблицы `flowers`
--

INSERT INTO `flowers` (`id`, `id_category`, `name`, `price`, `size`, `is_available`, `foto`) VALUES
(45, 6, 'green', 55, 60, 0, '/webroot/uploads/15c78e89dbc3be02bddb0d430d5294a4.jpg'),
(46, 6, 'mix', 55, 60, 0, '/webroot/uploads/6d3500f520ef012e576a7923eaadd6ec.jpg'),
(47, 6, 'style', 55, 60, 1, '/webroot/uploads/27f79f4c5594d0d6018f19dfeb56eab4.jpg'),
(48, 6, 'white pink', 60, 60, 0, '/webroot/uploads/2e356436df680e43b9941fba9c51307a.jpg'),
(49, 5, 'green', 45, 0, 1, '/webroot/uploads/9d435d27811bb98d90fbddfa2e0b78c4.jpg'),
(50, 5, 'nice', 56, 50, 1, '/webroot/uploads/d6ebe2ecb0110390b4d9faf65fda892b.jpg'),
(51, 5, 'new orange', 60, 45, 1, '/webroot/uploads/63572cd3398f5e1d40f7b4c07242b880.jpg'),
(52, 5, 'orange', 65, 45, 0, '/webroot/uploads/c9473fe424aa4d05624c5ee3dc5b427e.jpg'),
(54, 5, 'very nice', 62, 56, 1, '/webroot/uploads/1c732d18400732207dd93808276f4d6a.jpg'),
(55, 5, 'white', 56, 56, 0, '/webroot/uploads/c43491a48f131e8d36509cc8d12d804d.jpg'),
(56, 5, 'yellow', 45, 54, 1, '/webroot/uploads/6eea296d6102ff4c3d3cab4a47c216ae.jpg'),
(57, 4, 'copper king', 54, 54, 1, '/webroot/uploads/994b6947049a730c7ca40a98164a84d5.jpg'),
(58, 4, 'green', 56, 65, 1, '/webroot/uploads/66646663300d289fdb90a76fb9b5cff9.jpg'),
(59, 4, 'pink', 45, 50, 1, '/webroot/uploads/516f0966d5e3ab392bed7f13d5bfc65c.jpg'),
(60, 4, 'purple', 45, 45, 1, '/webroot/uploads/a1a9e32345c33d7830eab398de80486b.jpg'),
(61, 4, 'white', 56, 0, 1, '/webroot/uploads/ca728cb804f47f5b10b3d4ae16af9fb6.jpg'),
(62, 3, 'nice', 40, 80, 1, '/webroot/uploads/0c3570c152354a4cf1679ec24391f584.jpg'),
(63, 3, 'new purple', 45, 80, 1, '/webroot/uploads/3abf4e273434cb365c8b5af4ecdccf86.jpg'),
(64, 3, 'purple', 50, 80, 1, '/webroot/uploads/2dbe172c018beeaea24396de60063863.jpg'),
(65, 3, 'red', 45, 70, 1, '/webroot/uploads/ddc267f94e0974f813d4261b152146d6.jpg'),
(66, 3, 'yellow', 56, 60, 1, '/webroot/uploads/6c7652ca0365dbed3b3ed4134655dbc7.jpg'),
(67, 2, 'best', 45, 65, 1, '/webroot/uploads/623ec555d6aaed46bdc8d679dcedddae.jpg'),
(68, 2, 'nice', 0, 0, 0, '/webroot/uploads/4cab52302d8f9c8a239ed1403c703c21.jpg'),
(69, 2, 'red', 0, 0, 0, '/webroot/uploads/0abcdd1fd4f6f3b7d941ee33e5babd38.jpg'),
(70, 2, 'mix', 0, 0, 0, '/webroot/uploads/ab5d912191cb72217b429cc717547a71.jpg'),
(71, 2, 'pink', 0, 0, 0, '/webroot/uploads/dc303047b914ae8ab47b5b3e11b93b0d.jpg'),
(72, 1, 'graden mum', 56, 60, 1, '/webroot/uploads/49b190baa34b70a19dc7ed187c8fb7b4.jpg'),
(73, 1, 'green', 45, 60, 1, '/webroot/uploads/ff9e78279c703c31c28e469345b97c12.jpg'),
(74, 1, 'orange', 45, 60, 1, '/webroot/uploads/e67cdf9efd7caaf35af506138a8223bb.jpg');

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
-- СВЯЗИ ТАБЛИЦЫ `messages`:
--

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`) VALUES
(1, 'Test', 'test@test.com', 'Test message'),
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
-- СВЯЗИ ТАБЛИЦЫ `users`:
--

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `email`, `role`, `password`, `is_active`) VALUES
(1, 'admin', 'admin@your-site.com', 'admin', '44ca5fa5c67e434b9e779c5febc46f06', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `id` (`id_category`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD KEY `category_name_2` (`category_name`);

--
-- Индексы таблицы `flowers`
--
ALTER TABLE `flowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_category` (`id_category`);

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
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id_category` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT для таблицы `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
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
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `flowers`
--
ALTER TABLE `flowers`
  ADD CONSTRAINT `fk_id_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
