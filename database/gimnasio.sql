-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 14:59:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `rutina_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `email`, `contraseña`, `rutina_id`) VALUES
(1, 'webadmin@gmail.com', '$2y$10$vHCIg03NTuVSWOIMnVirmuFs875ykCRRPnhazRjN5Hxf6lRbtXhcq', NULL),
(7, 'cliente@gmail.com', '$2y$10$3cajC6c36YVX2G7RT327mOb.vLv3WP3Q8DEDoHz2xaw5Z2HlFwNNm', NULL),
(8, 'cliente2@gmail.com', '$2y$10$8XoJp.MlRGhoyJ/W551ZMuu0Kmx1BVpqbgU0NssFSX6ASbXVXKpLy', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `rutina_id` int(11) NOT NULL,
  `tren` varchar(45) NOT NULL,
  `musculo` varchar(45) NOT NULL,
  `ejercicio` varchar(45) NOT NULL,
  `repeticiones` int(15) NOT NULL,
  `series` int(15) NOT NULL,
  `cliente_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`rutina_id`, `tren`, `musculo`, `ejercicio`, `repeticiones`, `series`, `cliente_id`) VALUES
(20, 'Inferior', 'Cuadriceps', 'Sentadillas', 2, 4, 8),
(21, 'Superior', 'Tricep', 'Polea inversa', 8, 3, 7),
(22, 'Superior', 'Hombros', 'Press militar', 4, 3, 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rutina_id` (`rutina_id`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`rutina_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `rutina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `rutina_id` FOREIGN KEY (`rutina_id`) REFERENCES `rutina` (`rutina_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
