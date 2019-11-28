-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2019 a las 06:14:39
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lhd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hackers`
--

CREATE TABLE `hackers` (
  `id_hacker` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `registred` tinyint(3) DEFAULT '0',
  `checkin` tinyint(3) NOT NULL DEFAULT '0',
  `token` varchar(10) NOT NULL,
  `id_team` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hackers`
--

INSERT INTO `hackers` (`id_hacker`, `id_user`, `first_name`, `last_name`, `phone_number`, `birth_date`, `school`, `major`, `registred`, `checkin`, `token`, `id_team`) VALUES
(1, NULL, 'JORGE', 'MONGE', '71717171', NULL, NULL, NULL, 0, 1, 'LAK212', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_type`
--

CREATE TABLE `team_type` (
  `id_team_type` int(11) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hackers`
--
ALTER TABLE `hackers`
  ADD PRIMARY KEY (`id_hacker`);

--
-- Indices de la tabla `team_type`
--
ALTER TABLE `team_type`
  ADD PRIMARY KEY (`id_team_type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hackers`
--
ALTER TABLE `hackers`
  MODIFY `id_hacker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `team_type`
--
ALTER TABLE `team_type`
  MODIFY `id_team_type` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
