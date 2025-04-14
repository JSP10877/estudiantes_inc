-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2025 a las 23:38:30
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estudiantes_reg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(45) NOT NULL,
  `id_facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id_carrera`, `nombre_carrera`, `id_facultad`) VALUES
(1, 'Ingeniería de Software', 1),
(2, 'Medicina', 2),
(3, 'Administración de Empresas', 3),
(4, 'Diseño Gráfico', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `nombre1` varchar(45) NOT NULL,
  `nombre2` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `correo` varchar(20) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `foto_estudiante` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `correo`, `id_carrera`, `fecha_inscripcion`, `foto_estudiante`) VALUES
(1, 'Juan', 'Carlos', 'Pérez', 'Gómez', 'juan.perez@example.c', 1, '2025-02-01', 'juan.jpg'),
(2, 'María', NULL, 'Rodríguez', 'López', 'maria.rodriguez@exam', 2, '2025-02-01', 'maria.jpg'),
(3, 'Luis', 'Eduardo', 'Martínez', NULL, 'luis.martinez@exampl', 3, '2025-02-01', 'luis.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id_facultad` int(11) NOT NULL,
  `nombre_facultad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id_facultad`, `nombre_facultad`) VALUES
(1, 'Ingeniería'),
(2, 'Ciencias de la Salud'),
(3, 'Administración'),
(4, 'Arte y Diseño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion_semestre`
--

CREATE TABLE `inscripcion_semestre` (
  `id_inscripcion` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripcion_semestre`
--

INSERT INTO `inscripcion_semestre` (`id_inscripcion`, `id_estudiante`, `id_semestre`, `fecha_inscripcion`) VALUES
(2, 1, 3, '2026-04-01'),
(3, 2, 1, '2025-04-01'),
(4, 3, 1, '2025-04-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `nombre_materia` varchar(50) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre_materia`, `id_carrera`, `id_semestre`) VALUES
(1, 'Anatomía Humana', 2, 1),
(2, 'Bioquímica', 2, 1),
(3, 'Introducción a la Medicina', 2, 1),
(4, 'Fisiología General', 2, 1),
(5, 'Histología', 2, 2),
(6, 'Psicología Médica', 2, 2),
(7, 'Microbiología Básica', 2, 2),
(8, 'Farmacología General', 2, 2),
(9, 'Patología General', 2, 3),
(10, 'Epidemiología', 2, 3),
(11, 'Semiología Clínica', 2, 3),
(12, 'Genética Médica', 2, 3),
(13, 'Cardiología Básica', 2, 4),
(14, 'Neurología', 2, 4),
(15, 'Medicina Interna', 2, 4),
(16, 'Pediatría', 2, 4),
(17, 'Cirugía General', 2, 5),
(18, 'Ginecología y Obstetricia', 2, 5),
(19, 'Dermatología', 2, 5),
(20, 'Inmunología', 2, 5),
(21, 'Ortopedia', 2, 6),
(22, 'Oftalmología', 2, 6),
(23, 'Otorrinolaringología', 2, 6),
(24, 'Urgencias Médicas', 2, 6),
(25, 'Psiquiatría', 2, 7),
(26, 'Oncología', 2, 7),
(27, 'Endocrinología', 2, 7),
(28, 'Nefrología', 2, 7),
(29, 'Medicina Familiar', 2, 8),
(30, 'Rehabilitación Física', 2, 8),
(31, 'Gastroenterología', 2, 8),
(32, 'Medicina Preventiva', 2, 8),
(33, 'Investigación Clínica', 2, 9),
(34, 'Gerencia en Salud', 2, 9),
(35, 'Ética Médica', 2, 9),
(36, 'Radiología', 2, 9),
(37, 'Práctica Hospitalaria Final', 2, 10),
(38, 'Internado Rotatorio', 2, 10),
(39, 'Terapias Avanzadas', 2, 10),
(40, 'Cuidados Intensivos', 2, 10),
(41, 'Fundamentos de Administración', 3, 1),
(42, 'Contabilidad General', 3, 1),
(43, 'Economía Básica', 3, 1),
(44, 'Matemáticas Financieras', 3, 1),
(45, 'Marketing y Publicidad', 3, 2),
(46, 'Administración de Recursos Humanos', 3, 2),
(47, 'Estadística Aplicada', 3, 2),
(48, 'Finanzas Corporativas', 3, 2),
(49, 'Negociación y Liderazgo', 3, 3),
(50, 'Gestión Estratégica', 3, 3),
(51, 'Investigación de Mercados', 3, 3),
(52, 'Responsabilidad Social Empresarial', 3, 3),
(53, 'Comercio Internacional', 3, 4),
(54, 'Planificación Empresarial', 3, 4),
(55, 'Emprendimiento y Startups', 3, 4),
(56, 'Gestión de la Innovación', 3, 4),
(57, 'Gestión Financiera', 3, 5),
(58, 'Auditoría y Control', 3, 5),
(59, 'Estrategias de Ventas', 3, 5),
(60, 'Legislación Empresarial', 3, 5),
(61, 'Administración Pública', 3, 6),
(62, 'Organización Industrial', 3, 6),
(63, 'Desarrollo Organizacional', 3, 6),
(64, 'Gestión de Proyectos', 3, 6),
(65, 'Análisis Económico', 3, 7),
(66, 'Dirección de Empresas', 3, 7),
(67, 'Transformación Digital', 3, 7),
(68, 'Consultoría Empresarial', 3, 7),
(69, 'Estrategia y Competitividad', 3, 8),
(70, 'Innovación Tecnológica', 3, 8),
(71, 'Gestión de Operaciones', 3, 8),
(72, 'Análisis de Riesgo', 3, 8),
(73, 'Administración Internacional', 3, 9),
(74, 'Investigación de Nuevos Mercados', 3, 9),
(75, 'Normativas Empresariales', 3, 9),
(76, 'Análisis de Inversiones', 3, 9),
(77, 'Prácticas Profesionales', 3, 10),
(78, 'Gestión Empresarial Avanzada', 3, 10),
(79, 'Evaluación de Proyectos', 3, 10),
(80, 'Desarrollo Empresarial', 3, 10),
(81, 'Teoría del Color', 4, 1),
(82, 'Fundamentos del Diseño', 4, 1),
(83, 'Dibujo Técnico', 4, 1),
(84, 'Tipografía Básica', 4, 1),
(85, 'Diseño Web', 4, 2),
(86, 'Fotografía Digital', 4, 2),
(87, 'Ilustración Vectorial', 4, 2),
(88, 'Psicología del Color', 4, 2),
(89, 'Animación 2D', 4, 3),
(90, 'Diseño Editorial', 4, 3),
(91, 'Creación de Identidad Visual', 4, 3),
(92, 'UX/UI Design', 4, 3),
(93, 'Motion Graphics', 4, 4),
(94, 'Modelado 3D', 4, 4),
(95, 'Estrategias de Branding', 4, 4),
(96, 'Publicidad y Mercadeo Visual', 4, 4),
(97, 'Arte Digital', 4, 5),
(98, 'Packaging y Diseño Industrial', 4, 5),
(99, 'Fotografía de Producto', 4, 5),
(100, 'Visualización Creativa', 4, 5),
(101, 'Dirección de Arte', 4, 6),
(102, 'Diseño Interactivo', 4, 6),
(103, 'Producción Audiovisual', 4, 6),
(104, 'Realidad Aumentada y Virtual', 4, 6),
(105, 'Diseño de Interfaces Digitales', 4, 7),
(106, 'Videojuegos y Narrativa Gráfica', 4, 7),
(107, 'Composición Visual Avanzada', 4, 7),
(108, 'Arte Conceptual', 4, 7),
(109, 'Diseño y Producción Publicitaria', 4, 8),
(110, 'Estudios de Estética', 4, 8),
(111, 'Marketing Visual', 4, 8),
(112, 'Diseño para Redes Sociales', 4, 8),
(113, 'Gestión de Diseño y Proyectos', 4, 9),
(114, 'Tendencias en Diseño', 4, 9),
(115, 'Producción Gráfica Avanzada', 4, 9),
(116, 'Diseño Sustentable', 4, 9),
(117, 'Prácticas en Diseño Gráfico', 4, 10),
(118, 'Portafolio Profesional', 4, 10),
(119, 'Innovación en Diseño', 4, 10),
(120, 'Investigación Gráfica', 4, 10),
(121, 'Programación Básica', 1, 1),
(122, 'Matemáticas Discretas', 1, 1),
(123, 'Introducción a Bases de Datos', 1, 1),
(124, 'Fundamentos de Algoritmos', 1, 1),
(125, 'Estructuras de Datos', 1, 2),
(126, 'Arquitectura de Computadoras', 1, 2),
(127, 'Desarrollo Web con HTML y CSS', 1, 2),
(128, 'Lógica de Programación', 1, 2),
(129, 'Programación Orientada a Objetos', 1, 3),
(130, 'Sistemas Operativos', 1, 3),
(131, 'Diseño de Bases de Datos', 1, 3),
(132, 'Seguridad Informática', 1, 3),
(133, 'Desarrollo de Aplicaciones Móviles', 1, 4),
(134, 'Redes de Computadoras', 1, 4),
(135, 'Análisis y Diseño de Software', 1, 4),
(136, 'Administración de Bases de Datos', 1, 4),
(137, 'Computación en la Nube', 1, 5),
(138, 'Inteligencia Artificial', 1, 5),
(139, 'Estructuras de Software Empresarial', 1, 5),
(140, 'Métodos Ágiles de Desarrollo', 1, 5),
(141, 'Big Data y Análisis de Datos', 1, 6),
(142, 'Ciberseguridad', 1, 6),
(143, 'Desarrollo de API Rest', 1, 6),
(144, 'Sistemas Distribuidos', 1, 6),
(145, 'Machine Learning', 1, 7),
(146, 'Testing y Automatización', 1, 7),
(147, 'Blockchain y Criptografía', 1, 7),
(148, 'Optimización de Algoritmos', 1, 7),
(149, 'DevOps y CI/CD', 1, 8),
(150, 'Arquitectura de Microservicios', 1, 8),
(151, 'Interacción Humano-Computadora', 1, 8),
(152, 'Robótica y Visión Artificial', 1, 8),
(153, 'Emprendimiento Tecnológico', 1, 9),
(154, 'Internet de las Cosas (IoT)', 1, 9),
(155, 'Computación Cuántica', 1, 9),
(156, 'Ética y Legislación en TI', 1, 9),
(157, 'Proyecto Final de Grado', 1, 10),
(158, 'Investigación en Computación', 1, 10),
(159, 'Sistemas Inteligentes', 1, 10),
(160, 'Prácticas Profesionales', 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `numero_semestre` int(11) NOT NULL CHECK (`numero_semestre` >= 1),
  `año_academico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id_semestre`, `numero_semestre`, `año_academico`) VALUES
(1, 1, 2025),
(2, 2, 2025),
(3, 3, 2026),
(4, 4, 2026),
(5, 5, 2027),
(6, 6, 2027),
(7, 7, 2028),
(8, 8, 2028),
(9, 9, 2029),
(10, 10, 2029);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD KEY `id_facultad` (`id_facultad`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id_facultad`);

--
-- Indices de la tabla `inscripcion_semestre`
--
ALTER TABLE `inscripcion_semestre`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_semestre` (`id_semestre`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inscripcion_semestre`
--
ALTER TABLE `inscripcion_semestre`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id_semestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`);

--
-- Filtros para la tabla `inscripcion_semestre`
--
ALTER TABLE `inscripcion_semestre`
  ADD CONSTRAINT `inscripcion_semestre_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `inscripcion_semestre_ibfk_2` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`),
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
