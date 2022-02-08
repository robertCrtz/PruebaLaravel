-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2022 a las 03:53:40
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_master`
--
CREATE DATABASE IF NOT EXISTS `laravel_master` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users` (`user_id`),
  KEY `fk_comments_images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Buena foto de familia!', '2022-01-26 14:55:34', '2022-01-26 14:55:34'),
(2, 2, 1, 'Buena foto de playa!', '2022-01-26 14:55:34', '2022-01-26 14:55:34'),
(3, 2, 4, 'Que bueno', '2022-01-26 14:55:34', '2022-01-26 14:55:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` varchar(35) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `user_id`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'test.jpg', 'Descripcion de prueba 1', '2022-01-26 14:53:07', '2022-01-26 14:53:07'),
(2, 1, 'playa.jpg', 'Descripcion de prueba 2', '2022-01-26 14:53:07', '2022-01-26 14:53:07'),
(3, 1, 'arena.jpg', 'Descripcion de prueba 3', '2022-01-26 14:53:07', '2022-01-26 14:53:07'),
(4, 3, 'familia.jpg', 'Descripcion de prueba 2', '2022-01-26 14:53:07', '2022-01-26 14:53:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_users` (`user_id`),
  KEY `fk_likes_images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `image_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2022-01-26 14:57:23', '2022-01-26 14:57:23'),
(2, 2, 4, '2022-01-26 14:57:23', '2022-01-26 14:57:23'),
(3, 3, 2, '2022-01-26 14:57:23', '2022-01-26 14:57:23'),
(4, 2, 4, '2022-01-26 14:57:23', '2022-01-26 14:57:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `role` varchar(15) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `surname` varchar(15) DEFAULT NULL,
  `nick` varchar(25) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `nick`, `email`, `password`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'user', 'Roberto', 'Cortez', 'Robert_Crtz9', 'roberto@gmail.com', 'pass', NULL, '2022-01-26 14:46:37', '2022-01-26 14:46:37', NULL),
(2, 'user', 'Lionel', 'Messi', 'L10NEL', 'roberto@gmail.com', 'pass', NULL, '2022-01-26 14:48:53', '2022-01-26 14:48:53', NULL),
(3, 'user', 'Sergio', 'Ramos', 'SR4', 'roberto@gmail.com', 'pass', NULL, '2022-01-26 14:48:53', '2022-01-26 14:48:53', NULL),
(4, NULL, 'adminn', 'elias', 'robert', 'robertoenrique98@hotmail.com', '$2y$10$w.xo8IT/DPif6C6ctfm8RePHXP9zod1j1USikRL.6/OZ5/v4ZggUa', '1643404608IMG_20191108_103720.jpg', '2022-01-26 22:46:05', '2022-01-28 21:16:48', 'jgkIKG7Y4jeVazp4BEGx1lrMxTskgQL29Y6JHz2Kpt38XBhXpqVahFz9csYP'),
(5, 'user', 'Leo', 'Messi', 'mess10', 'robertoenrique98@ssne.com', '$2y$10$2.3LIJ20p6Vv4o12NvcdPecuU9Du0MhizMInARBZ508X4TKkY7rK2', NULL, '2022-01-26 22:49:00', '2022-01-26 22:49:00', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
