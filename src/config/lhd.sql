-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2019 a las 05:54:50
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
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `idCategory` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hackers`
--

CREATE TABLE `hackers` (
  `idHacker` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `phoneNumber` varchar(8) NOT NULL,
  `birthDate` date NOT NULL,
  `school` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registered` tinyint(4) NOT NULL,
  `checkin` tinyint(4) NOT NULL,
  `token` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hackers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `judgescategories`
--

CREATE TABLE `judgescategories` (
  `idJudgesCategories` int(11) NOT NULL,
  `idJudge` int(11) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `idTeam` int(11) NOT NULL,
  `userCreatedBy` int(11) NOT NULL,
  `idTeamType` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `nameTeam` varchar(45) NOT NULL,
  `timeCreatedBy` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `score` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `teams`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_hackers`
--

CREATE TABLE `team_hackers` (
  `idTeamHacker` int(11) NOT NULL,
  `idTeam` int(11) NOT NULL,
  `idHacker` int(11) NOT NULL,
  `idEvent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `team_hackers`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_type`
--

CREATE TABLE `team_type` (
  `idTeamType` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `team_type`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indices de la tabla `hackers`
--
ALTER TABLE `hackers`
  ADD PRIMARY KEY (`idHacker`);

--
-- Indices de la tabla `judgescategories`
--
ALTER TABLE `judgescategories`
  ADD PRIMARY KEY (`idJudgesCategories`),
  ADD KEY `judge_user_idx` (`idJudge`),
  ADD KEY `judge_category_idx` (`idCategory`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idRole`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`idTeam`),
  ADD KEY `team_user_idx` (`userCreatedBy`),
  ADD KEY `team_category` (`idCategory`),
  ADD KEY `team_type` (`idTeamType`);

--
-- Indices de la tabla `team_hackers`
--
ALTER TABLE `team_hackers`
  ADD PRIMARY KEY (`idTeamHacker`),
  ADD KEY `team_hacker_idx` (`idHacker`),
  ADD KEY `team_team_idx` (`idTeam`);

--
-- Indices de la tabla `team_type`
--
ALTER TABLE `team_type`
  ADD PRIMARY KEY (`idTeamType`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`),
  ADD KEY `user_role` (`idRole`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `hackers`
--
ALTER TABLE `hackers`
  MODIFY `idHacker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `judgescategories`
--
ALTER TABLE `judgescategories`
  MODIFY `idJudgesCategories` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `idRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `idTeam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `team_hackers`
--
ALTER TABLE `team_hackers`
  MODIFY `idTeamHacker` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `team_type`
--
ALTER TABLE `team_type`
  MODIFY `idTeamType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `judgescategories`
--
ALTER TABLE `judgescategories`
  ADD CONSTRAINT `judge_category` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_user` FOREIGN KEY (`idJudge`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `team_category` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_type` FOREIGN KEY (`idTeamType`) REFERENCES `team_type` (`idTeamType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_user` FOREIGN KEY (`userCreatedBy`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `team_hackers`
--
ALTER TABLE `team_hackers`
  ADD CONSTRAINT `team_hacker` FOREIGN KEY (`idHacker`) REFERENCES `hackers` (`idHacker`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_team` FOREIGN KEY (`idTeam`) REFERENCES `teams` (`idTeam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
