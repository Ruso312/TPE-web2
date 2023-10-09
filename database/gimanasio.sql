-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2023 a las 16:13:09
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
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `clase_id` int(11) NOT NULL,
  `nombre_clase` varchar(45) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`clase_id`, `nombre_clase`, `instructor_id`, `horario_id`) VALUES
(1, 'funcional', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `nombre_cliente` varchar(45) NOT NULL,
  `apellido_cliente` varchar(45) NOT NULL,
  `dni_cliente` int(15) NOT NULL,
  `edad_cliente` int(11) NOT NULL,
  `email_cliente` varchar(45) NOT NULL,
  `contraseña_cliente` varchar(45) NOT NULL,
  `fecha_in` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nombre_cliente`, `apellido_cliente`, `dni_cliente`, `edad_cliente`, `email_cliente`, `contraseña_cliente`, `fecha_in`, `fecha_fin`) VALUES
(1, 'marco', 'dacenzo', 42676234, 23, 'example@gmail.com', '123qwe', '2023-09-23', '2023-10-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `ejercicio_id` int(11) NOT NULL,
  `nombre_ejercicio` varchar(45) NOT NULL,
  `musculo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`ejercicio_id`, `nombre_ejercicio`, `musculo`) VALUES
(1, 'press banca', 'pecho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `historial_id` int(11) NOT NULL,
  `peso_historial` int(11) NOT NULL,
  `altura_historial` float NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`historial_id`, `peso_historial`, `altura_historial`, `cliente_id`) VALUES
(1, 70, 1.7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `horario_id` int(11) NOT NULL,
  `dia_id` varchar(45) NOT NULL,
  `horas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`horario_id`, `dia_id`, `horas_id`) VALUES
(1, 'lunes a viernes', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `instructor_id` int(11) NOT NULL,
  `nombre_instructor` varchar(45) NOT NULL,
  `edad_instructor` int(11) NOT NULL,
  `apellido_instructor` varchar(45) NOT NULL,
  `contraseña_instructor` varchar(45) NOT NULL,
  `email_instructor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`instructor_id`, `nombre_instructor`, `edad_instructor`, `apellido_instructor`, `contraseña_instructor`, `email_instructor`) VALUES
(1, 'patricio', 22, 'Ramos', '123asd', 'example2@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `rutina_id` int(11) NOT NULL,
  `nombre_rutina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`rutina_id`, `nombre_rutina`) VALUES
(1, 'push-pull-legs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina_cliente`
--

CREATE TABLE `rutina_cliente` (
  `rutina_cliente_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina_cliente`
--

INSERT INTO `rutina_cliente` (`rutina_cliente_id`, `cliente_id`, `rutina_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina_ejercicio`
--

CREATE TABLE `rutina_ejercicio` (
  `rut_ejer_id` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL,
  `ejercicio_id` int(11) NOT NULL,
  `series_rutina` varchar(45) NOT NULL,
  `repeticiones_rutina` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina_ejercicio`
--

INSERT INTO `rutina_ejercicio` (`rut_ejer_id`, `rutina_id`, `ejercicio_id`, `series_rutina`, `repeticiones_rutina`) VALUES
(1, 1, 1, '4', '10-15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`clase_id`),
  ADD KEY `clase_id` (`instructor_id`),
  ADD KEY `horario_id` (`horario_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`ejercicio_id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`historial_id`),
  ADD KEY `historial_id` (`cliente_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`horario_id`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`instructor_id`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`rutina_id`);

--
-- Indices de la tabla `rutina_cliente`
--
ALTER TABLE `rutina_cliente`
  ADD PRIMARY KEY (`rutina_cliente_id`),
  ADD KEY `FK_cliente_id` (`cliente_id`),
  ADD KEY `FK_rutina_id` (`rutina_id`) USING BTREE;

--
-- Indices de la tabla `rutina_ejercicio`
--
ALTER TABLE `rutina_ejercicio`
  ADD PRIMARY KEY (`rut_ejer_id`),
  ADD KEY `rut_ejer_id` (`ejercicio_id`),
  ADD KEY `rutina_id` (`rutina_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `clase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `ejercicio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `historial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `horario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `rutina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutina_cliente`
--
ALTER TABLE `rutina_cliente`
  MODIFY `rutina_cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rutina_ejercicio`
--
ALTER TABLE `rutina_ejercicio`
  MODIFY `rut_ejer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`horario_id`),
  ADD CONSTRAINT `clase_id` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`);

--
-- Filtros para la tabla `rutina_cliente`
--
ALTER TABLE `rutina_cliente`
  ADD CONSTRAINT `cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `rutina_id` FOREIGN KEY (`rutina_id`) REFERENCES `rutina` (`rutina_id`);

--
-- Filtros para la tabla `rutina_ejercicio`
--
ALTER TABLE `rutina_ejercicio`
  ADD CONSTRAINT `rut_ejer_id` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicio` (`ejercicio_id`),
  ADD CONSTRAINT `rutina_ejercicio_ibfk_1` FOREIGN KEY (`rutina_id`) REFERENCES `rutina` (`rutina_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;