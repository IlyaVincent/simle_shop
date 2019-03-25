-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 25 2019 г., 07:10
-- Версия сервера: 5.5.62
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop.local`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`) VALUES
(1, 'Одежда', '#3f5866'),
(2, 'Техника', '#bdd3de'),
(3, 'Электроника', '#f0f0df');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tel` text NOT NULL,
  `cart` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `tel`, `cart`) VALUES
(6, 'Илья', '7(912)123-12-12', '[{\"id\":\"77\",\"productId\":\"5\",\"amount\":\"1\"},{\"id\":\"78\",\"productId\":\"3\",\"amount\":\"1\"},{\"id\":\"79\",\"productId\":\"9\",\"amount\":\"1\"},{\"id\":\"80\",\"productId\":\"1\",\"amount\":\"3\"}]');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `categoryId` varchar(100) DEFAULT NULL,
  `description` text,
  `stock` int(11) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `categoryId`, `description`, `stock`, `href`) VALUES
(1, 'Товар 1', '1', 'Описание товара 1', 20, '/public/img/products/1.png'),
(2, 'Товар 2', '1', 'Описание товара 2', 119, '/public/img/products/2.png'),
(3, 'Товар 3', '1', 'Описание товара 3', 121, '/public/img/products/3.png'),
(4, 'Товар 4', '1', 'Описание товара 4', 123, '/public/img/products/4.png'),
(5, 'Товар 5', '1', 'Описание товара 5', 50, '/public/img/products/5.png'),
(6, 'Товар 6', '1', 'Описание товара 6', 0, '/public/img/products/6.png'),
(7, 'Товар 7', '1', 'Описание товара 7', 10, '/public/img/products/7.png'),
(8, 'Товар 8', '2', 'Описание товара 8', 0, '/public/img/products/8.png'),
(9, 'Товар 9', '2', 'Описание товара 9', 2, '/public/img/products/9.png'),
(10, 'Товар 10', '2', 'Описание товара 10', 19, '/public/img/products/10.png'),
(11, 'Товар 11', '2', 'Описание товара 11', 50, '/public/img/products/11.png'),
(12, 'Товар 12', '2', 'Описание товара 12', 11, '/public/img/products/12.png'),
(13, 'Товар 13', '2', 'Описание товара 13', 12, '/public/img/products/13.png'),
(14, 'Товар 14', '2', 'Описание товара 14', 1, '/public/img/products/14.png'),
(15, 'Товар 15', '2', 'Описание товара 15', 20, '/public/img/products/15.png'),
(16, 'Товар 16', '3', 'Описание товара 16', 82, '/public/img/products/16.png'),
(17, 'Товар 17', '3', 'Описание товара 17', 2, '/public/img/products/17.png'),
(18, 'Товар 18', '3', 'Описание товара 18', 0, '/public/img/products/18.png'),
(19, 'Товар 19', '3', 'Описание товара 19', 20, '/public/img/products/19.png'),
(20, 'Товар 20', '3', 'Описание товара 20', 196, '/public/img/products/20.png');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
