-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2023 a las 02:18:01
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `medicheck`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citamedica`
--

CREATE TABLE `citamedica` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idPaciente` int NOT NULL,
  `idMedico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citamedica`
--

INSERT INTO `citamedica` (`id`, `fecha`, `hora`, `idPaciente`, `idMedico`) VALUES
(62, '2023-07-23', '18:00:00', 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultamedica`
--

CREATE TABLE `consultamedica` (
  `id` int NOT NULL,
  `diagnostico` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `idCitaMedica` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `id` int NOT NULL,
  `consultorio` varchar(5) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`id`, `consultorio`) VALUES
(1, 'A101'),
(2, 'A102'),
(3, 'A103');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int NOT NULL,
  `especialidad` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `especialidad`) VALUES
(1, 'cirugia'),
(8, 'Patologia'),
(9, 'Pediatra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int NOT NULL,
  `horaIngreso` time NOT NULL,
  `horaSalida` time NOT NULL,
  `dia` date NOT NULL,
  `idMedico` int NOT NULL,
  `idConsultorio` int NOT NULL,
  `idTurno` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `horaIngreso`, `horaSalida`, `dia`, `idMedico`, `idConsultorio`, `idTurno`) VALUES
(8, '12:00:00', '17:00:00', '2023-07-23', 4, 3, 2),
(9, '07:00:00', '13:00:00', '2023-07-24', 4, 3, 1),
(11, '18:00:00', '20:00:00', '2023-07-23', 5, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicina`
--

CREATE TABLE `medicina` (
  `id` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int NOT NULL,
  `nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoP` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoM` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `idEspecialidad` int NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id`, `nombre`, `apellidoP`, `apellidoM`, `telefono`, `direccion`, `idEspecialidad`, `dni`, `usuario`, `contrasena`) VALUES
(4, 'Medico1', 'Apellido1', 'Apellido2', '12345', 'mi casa', 9, '123459', 'Medico', '1234'),
(5, 'Medico2', 'Apellido', 'Apellio', '1234', 'sucasa', 8, '1234', 'Medico2', '1234'),
(6, 'Medico32', 'Apellido', 'Apellido', '1221332', 'sucasa', 1, '14438', 'Medico3', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int NOT NULL,
  `nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoP` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellidoM` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `edad` int NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `edad`, `dni`, `sexo`, `telefono`, `direccion`, `correo`, `contrasena`) VALUES
(10, 'Paciente12', 'Apellido', 'Apellido', '2003-01-23', 20, '1234', 'F', '1234', 'sucasa', 'yopisrasr@gmail.com', '1234'),
(11, 'Paciente2', 'Apellido', 'Apellido2', '2003-01-28', 20, '1234', 'M', '1234', 'sucasa', 'ejemplo@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetamedica`
--

CREATE TABLE `recetamedica` (
  `id` int NOT NULL,
  `idConsulta` int NOT NULL,
  `idMedicina` int NOT NULL,
  `dosis` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id` int NOT NULL,
  `turno` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `turno`) VALUES
(1, 'MAÑANA'),
(2, 'TARDE'),
(3, 'NOCHE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citamedica`
--
ALTER TABLE `citamedica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPaciente` (`idPaciente`,`idMedico`),
  ADD KEY `idMedico` (`idMedico`);

--
-- Indices de la tabla `consultamedica`
--
ALTER TABLE `consultamedica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCitaMedica` (`idCitaMedica`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMedico` (`idMedico`,`idConsultorio`),
  ADD KEY `idConsultorio` (`idConsultorio`),
  ADD KEY `idTurno` (`idTurno`);

--
-- Indices de la tabla `medicina`
--
ALTER TABLE `medicina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recetamedica`
--
ALTER TABLE `recetamedica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idConsulta` (`idConsulta`,`idMedicina`),
  ADD KEY `idMedicina` (`idMedicina`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citamedica`
--
ALTER TABLE `citamedica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `consultamedica`
--
ALTER TABLE `consultamedica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `medicina`
--
ALTER TABLE `medicina`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `recetamedica`
--
ALTER TABLE `recetamedica`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citamedica`
--
ALTER TABLE `citamedica`
  ADD CONSTRAINT `citamedica_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `citamedica_ibfk_2` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`);

--
-- Filtros para la tabla `consultamedica`
--
ALTER TABLE `consultamedica`
  ADD CONSTRAINT `consultamedica_ibfk_1` FOREIGN KEY (`idCitaMedica`) REFERENCES `citamedica` (`id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorio` (`id`),
  ADD CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`idTurno`) REFERENCES `turno` (`id`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `recetamedica`
--
ALTER TABLE `recetamedica`
  ADD CONSTRAINT `recetamedica_ibfk_1` FOREIGN KEY (`idConsulta`) REFERENCES `consultamedica` (`id`),
  ADD CONSTRAINT `recetamedica_ibfk_2` FOREIGN KEY (`idMedicina`) REFERENCES `medicina` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
