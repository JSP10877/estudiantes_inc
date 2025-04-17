-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2025 a las 22:17:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estudiantes_regi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(45) NOT NULL,
  `id_facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `foto_estudiante` varchar(100) DEFAULT NULL,
  `documento_estudiante` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `correo`, `id_carrera`, `fecha_inscripcion`, `foto_estudiante`, `documento_estudiante`) VALUES
(1, 'Juan', 'Carlos', 'Pérez', 'Gómez', 'juan.perez@example.c', 1, '2025-02-01', 'juan.jpg', ''),
(2, 'María', NULL, 'Rodríguez', 'López', 'maria.rodriguez@exam', 2, '2025-02-01', 'maria.jpg', ''),
(3, 'Luis', 'Eduardo', 'Martínez', NULL, 'luis.martinez@exampl', 3, '2025-02-01', 'luis.jpg', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id_facultad` int(11) NOT NULL,
  `nombre_facultad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `nombre_materia` varchar(50) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `creditos` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `nombre_materia`, `id_carrera`, `id_semestre`, `creditos`) VALUES
(1, 'Programación Básica', 1, 1, 4),
(2, 'Matemáticas Discretas', 1, 1, 3),
(3, 'Introducción a Bases de Datos', 1, 1, 3),
(4, 'Fundamentos de Algoritmos', 1, 1, 4),
(5, 'Estructuras de Datos', 1, 2, 4),
(6, 'Arquitectura de Computadoras', 1, 2, 3),
(7, 'Desarrollo Web con HTML y CSS', 1, 2, 3),
(8, 'Lógica de Programación', 1, 2, 3),
(9, 'Programación Orientada a Objetos', 1, 3, 4),
(10, 'Sistemas Operativos', 1, 3, 4),
(11, 'Diseño de Bases de Datos', 1, 3, 3),
(12, 'Seguridad Informática', 1, 3, 3),
(13, 'Desarrollo de Aplicaciones Móviles', 1, 4, 4),
(14, 'Redes de Computadoras', 1, 4, 3),
(15, 'Análisis y Diseño de Software', 1, 4, 4),
(16, 'Administración de Bases de Datos', 1, 4, 3),
(17, 'Computación en la Nube', 1, 5, 4),
(18, 'Inteligencia Artificial', 1, 5, 4),
(19, 'Estructuras de Software Empresarial', 1, 5, 3),
(20, 'Métodos Ágiles de Desarrollo', 1, 5, 3),
(21, 'Big Data y Análisis de Datos', 1, 6, 4),
(22, 'Ciberseguridad', 1, 6, 3),
(23, 'Desarrollo de API Rest', 1, 6, 3),
(24, 'Sistemas Distribuidos', 1, 6, 3),
(25, 'Machine Learning', 1, 7, 4),
(26, 'Testing y Automatización', 1, 7, 3),
(27, 'Blockchain y Criptografía', 1, 7, 3),
(28, 'Optimización de Algoritmos', 1, 7, 4),
(29, 'DevOps y CI/CD', 1, 8, 4),
(30, 'Arquitectura de Microservicios', 1, 8, 3),
(31, 'Interacción Humano-Computadora', 1, 8, 3),
(32, 'Robótica y Visión Artificial', 1, 8, 3),
(33, 'Emprendimiento Tecnológico', 1, 9, 3),
(34, 'Internet de las Cosas (IoT)', 1, 9, 3),
(35, 'Computación Cuántica', 1, 9, 4),
(36, 'Ética y Legislación en TI', 1, 9, 3),
(37, 'Proyecto Final de Grado', 1, 10, 4),
(38, 'Investigación en Computación', 1, 10, 4),
(39, 'Sistemas Inteligentes', 1, 10, 3),
(40, 'Prácticas Profesionales', 1, 10, 3),
(41, 'Anatomía Humana', 2, 1, 4),
(42, 'Bioquímica', 2, 1, 4),
(43, 'Introducción a la Medicina', 2, 1, 3),
(44, 'Fisiología General', 2, 1, 4),
(45, 'Histología', 2, 2, 3),
(46, 'Psicología Médica', 2, 2, 3),
(47, 'Microbiología Básica', 2, 2, 4),
(48, 'Farmacología General', 2, 2, 3),
(49, 'Patología General', 2, 3, 4),
(50, 'Epidemiología', 2, 3, 3),
(51, 'Semiología Clínica', 2, 3, 4),
(52, 'Genética Médica', 2, 3, 3),
(53, 'Cardiología Básica', 2, 4, 4),
(54, 'Neurología', 2, 4, 4),
(55, 'Medicina Interna', 2, 4, 4),
(56, 'Pediatría', 2, 4, 4),
(57, 'Cirugía General', 2, 5, 4),
(58, 'Ginecología y Obstetricia', 2, 5, 4),
(59, 'Dermatología', 2, 5, 3),
(60, 'Inmunología', 2, 5, 3),
(61, 'Ortopedia', 2, 6, 4),
(62, 'Oftalmología', 2, 6, 3),
(63, 'Otorrinolaringología', 2, 6, 3),
(64, 'Urgencias Médicas', 2, 6, 4),
(65, 'Psiquiatría', 2, 7, 3),
(66, 'Oncología', 2, 7, 4),
(67, 'Endocrinología', 2, 7, 3),
(68, 'Nefrología', 2, 7, 3),
(69, 'Medicina Familiar', 2, 8, 3),
(70, 'Rehabilitación Física', 2, 8, 3),
(71, 'Gastroenterología', 2, 8, 4),
(72, 'Medicina Preventiva', 2, 8, 3),
(73, 'Investigación Clínica', 2, 9, 3),
(74, 'Gerencia en Salud', 2, 9, 3),
(75, 'Ética Médica', 2, 9, 3),
(76, 'Radiología', 2, 9, 4),
(77, 'Práctica Hospitalaria Final', 2, 10, 4),
(78, 'Internado Rotatorio', 2, 10, 4),
(79, 'Terapias Avanzadas', 2, 10, 3),
(80, 'Cuidados Intensivos', 2, 10, 4),
(81, 'Fundamentos de Administración', 3, 1, 3),
(82, 'Contabilidad General', 3, 1, 4),
(83, 'Economía Básica', 3, 1, 3),
(84, 'Matemáticas Financieras', 3, 1, 4),
(85, 'Marketing y Publicidad', 3, 2, 3),
(86, 'Administración de Recursos Humanos', 3, 2, 3),
(87, 'Estadística Aplicada', 3, 2, 4),
(88, 'Finanzas Corporativas', 3, 2, 4),
(89, 'Negociación y Liderazgo', 3, 3, 3),
(90, 'Gestión Estratégica', 3, 3, 4),
(91, 'Investigación de Mercados', 3, 3, 3),
(92, 'Responsabilidad Social Empresarial', 3, 3, 3),
(93, 'Comercio Internacional', 3, 4, 4),
(94, 'Planificación Empresarial', 3, 4, 4),
(95, 'Emprendimiento y Startups', 3, 4, 3),
(96, 'Gestión de la Innovación', 3, 4, 3),
(97, 'Gestión Financiera', 3, 5, 4),
(98, 'Auditoría y Control', 3, 5, 4),
(99, 'Estrategias de Ventas', 3, 5, 3),
(100, 'Legislación Empresarial', 3, 5, 3),
(101, 'Administración Pública', 3, 6, 3),
(102, 'Organización Industrial', 3, 6, 3),
(103, 'Desarrollo Organizacional', 3, 6, 4),
(104, 'Gestión de Proyectos', 3, 6, 4),
(105, 'Análisis Económico', 3, 7, 3),
(106, 'Dirección de Empresas', 3, 7, 4),
(107, 'Transformación Digital', 3, 7, 3),
(108, 'Consultoría Empresarial', 3, 7, 3),
(109, 'Estrategia y Competitividad', 3, 8, 4),
(110, 'Innovación Tecnológica', 3, 8, 4),
(111, 'Gestión de Operaciones', 3, 8, 3),
(112, 'Análisis de Riesgo', 3, 8, 3),
(113, 'Administración Internacional', 3, 9, 3),
(114, 'Investigación de Nuevos Mercados', 3, 9, 4),
(115, 'Normativas Empresariales', 3, 9, 3),
(116, 'Análisis de Inversiones', 3, 9, 3),
(117, 'Prácticas Profesionales', 3, 10, 4),
(118, 'Gestión Empresarial Avanzada', 3, 10, 4),
(119, 'Evaluación de Proyectos', 3, 10, 3),
(120, 'Desarrollo Empresarial', 3, 10, 3),
(121, 'Teoría del Color', 4, 1, 3),
(122, 'Fundamentos del Diseño', 4, 1, 4),
(123, 'Dibujo Técnico', 4, 1, 3),
(124, 'Tipografía Básica', 4, 1, 3),
(125, 'Diseño Web', 4, 2, 4),
(126, 'Fotografía Digital', 4, 2, 3),
(127, 'Ilustración Vectorial', 4, 2, 3),
(128, 'Psicología del Color', 4, 2, 3),
(129, 'Animación 2D', 4, 3, 4),
(130, 'Diseño Editorial', 4, 3, 3),
(131, 'Creación de Identidad Visual', 4, 3, 4),
(132, 'UX/UI Design', 4, 3, 3),
(133, 'Motion Graphics', 4, 4, 4),
(134, 'Modelado 3D', 4, 4, 4),
(135, 'Estrategias de Branding', 4, 4, 3),
(136, 'Publicidad y Mercadeo Visual', 4, 4, 3),
(137, 'Arte Digital', 4, 5, 3),
(138, 'Packaging y Diseño Industrial', 4, 5, 3),
(139, 'Fotografía de Producto', 4, 5, 3),
(140, 'Visualización Creativa', 4, 5, 3),
(141, 'Dirección de Arte', 4, 6, 4),
(142, 'Diseño Interactivo', 4, 6, 3),
(143, 'Producción Audiovisual', 4, 6, 3),
(144, 'Realidad Aumentada y Virtual', 4, 6, 4),
(145, 'Diseño de Interfaces Digitales', 4, 7, 3),
(146, 'Videojuegos y Narrativa Gráfica', 4, 7, 3),
(147, 'Composición Visual Avanzada', 4, 7, 3),
(148, 'Arte Conceptual', 4, 7, 3),
(149, 'Diseño y Producción Publicitaria', 4, 8, 3),
(150, 'Estudios de Estética', 4, 8, 3),
(151, 'Marketing Visual', 4, 8, 3),
(152, 'Diseño para Redes Sociales', 4, 8, 3),
(153, 'Gestión de Diseño y Proyectos', 4, 9, 4),
(154, 'Tendencias en Diseño', 4, 9, 3),
(155, 'Producción Gráfica Avanzada', 4, 9, 3),
(156, 'Diseño Sustentable', 4, 9, 3),
(157, 'Prácticas en Diseño Gráfico', 4, 10, 4),
(158, 'Portafolio Profesional', 4, 10, 4),
(159, 'Innovación en Diseño', 4, 10, 3),
(160, 'Investigación Gráfica', 4, 10, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL,
  `numero_semestre` int(11) NOT NULL CHECK (`numero_semestre` >= 1),
  `año_academico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`),
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
