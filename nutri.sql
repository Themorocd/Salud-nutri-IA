-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2025 a las 03:26:39
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
-- Base de datos: `nutri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `id` int(11) NOT NULL,
  `alergia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alergias`
--

INSERT INTO `alergias` (`id`, `alergia`) VALUES
(1, 'Gluten'),
(2, 'Lácteos'),
(3, 'Frutos secos'),
(4, 'Mariscos'),
(5, 'Huevo'),
(6, 'Soja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dietas`
--

CREATE TABLE `dietas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `alergias` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dietas`
--

INSERT INTO `dietas` (`id`, `nombre`, `tipo`, `alergias`, `descripcion`) VALUES
(11, 'Dieta vegana básica', 'Vegana', '', 'Ejemplo de dieta vegana sin alergias'),
(12, 'Dieta vegetariana básica', 'Vegetariana', '', 'Ejemplo de dieta vegetariana sin alergias'),
(13, 'Dieta sin gluten básica', 'Sin gluten', '', 'Ejemplo de dieta sin gluten sin alergias'),
(14, 'Dieta sin lactosa básica', 'Sin lactosa', '', 'Ejemplo de dieta sin lactosa sin alergias'),
(15, 'Dieta baja en carbohidratos básica', 'Baja en carbohidratos', '', 'Ejemplo de dieta baja en carbohidratos sin alergias'),
(16, 'Dieta alta en proteínas básica', 'Alta en proteínas', '', 'Ejemplo de dieta alta en proteínas sin alergias'),
(17, 'Dieta para adelgazar básica', 'adelgazar', '', 'Ejemplo de dieta para adelgazar sin alergias'),
(18, 'Dieta para engordar básica', 'engordar', '', 'Ejemplo de dieta para engordar sin alergias'),
(19, 'Dieta equilibrada básica', 'equilibrada', '', 'Ejemplo de dieta equilibrada sin alergias'),
(20, 'Dieta vegana con alergias', 'Vegana', 'Gluten,Frutos secos', 'Vegana excluyendo gluten y frutos secos'),
(21, 'Dieta vegetariana con alergias', 'Vegetariana', 'Lácteos,Huevo', 'Vegetariana excluyendo lácteos y huevo'),
(22, 'Dieta sin gluten con alergias', 'Sin gluten', 'Soja', 'Sin gluten y sin soja'),
(23, 'Dieta sin lactosa con alergias', 'Sin lactosa', 'Frutos secos', 'Sin lactosa y sin frutos secos'),
(24, 'Dieta baja en carbohidratos con alergias', 'Baja en carbohidratos', 'Mariscos', 'Baja en carbohidratos y sin mariscos'),
(25, 'Dieta alta en proteínas con alergias', 'Alta en proteínas', 'Huevo', 'Alta en proteínas y sin huevo'),
(26, 'Dieta para adelgazar con alergias', 'adelgazar', 'Gluten', 'Para adelgazar y sin gluten'),
(27, 'Dieta para engordar con alergias', 'engordar', 'Lácteos', 'Para engordar y sin lácteos'),
(28, 'Dieta equilibrada con alergias', 'equilibrada', 'Soja', 'Equilibrada y sin soja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dietas_ia`
--

CREATE TABLE `dietas_ia` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `dieta_json` longtext NOT NULL,
  `fecha_guardado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dietas_ia`
--

INSERT INTO `dietas_ia` (`id`, `id_usuario`, `dieta_json`, `fecha_guardado`) VALUES
(1, 12, '[{\"dia\":\"Lunes\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Avena, plátano, nueces\",\"cantidad\":\"100g de avena, 1 plátano, 30g de nueces\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Pechuga de pollo, arroz integral, brócoli\",\"cantidad\":\"150g de pechuga de pollo, 100g de arroz integral, 100g de brócoli\"},{\"nombre\":\"Cena\",\"alimentos\":\"Salmón, quinoa, espárragos\",\"cantidad\":\"150g de salmón, 100g de quinoa, 100g de espárragos\"}]},{\"dia\":\"Martes\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Huevos revueltos, aguacate, pan integral\",\"cantidad\":\"2 huevos, 1 aguacate, 2 rebanadas de pan integral\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Ternera, batata, ensalada verde\",\"cantidad\":\"150g de ternera, 100g de batata, ensalada verde al gusto\"},{\"nombre\":\"Cena\",\"alimentos\":\"Pollo al horno, quínoa, zanahorias\",\"cantidad\":\"150g de pollo al horno, 100g de quínoa, 100g de zanahorias\"}]},{\"dia\":\"Miércoles\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Batido de proteínas, plátano, almendras\",\"cantidad\":\"1 batido de proteínas, 1 plátano, 30g de almendras\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Sardinas en lata, quínoa, espinacas\",\"cantidad\":\"1 lata de sardinas, 100g de quínoa, 100g de espinacas\"},{\"nombre\":\"Cena\",\"alimentos\":\"Tofu a la plancha, arroz basmati, brócoli\",\"cantidad\":\"150g de tofu a la plancha, 100g de arroz basmati, 100g de brócoli\"}]},{\"dia\":\"Jueves\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Yogur griego, frutos rojos, granola\",\"cantidad\":\"200g de yogur griego, 100g de frutos rojos, 30g de granola\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Lentejas, aguacate, tomate\",\"cantidad\":\"150g de lentejas, 1 aguacate, 1 tomate\"},{\"nombre\":\"Cena\",\"alimentos\":\"Pechuga de pavo, batata, espárragos\",\"cantidad\":\"150g de pechuga de pavo, 100g de batata, 100g de espárragos\"}]},{\"dia\":\"Viernes\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Tortilla de espinacas, pan integral, aguacate\",\"cantidad\":\"2 huevos, 100g de espinacas, 2 rebanadas de pan integral, 1 aguacate\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Atún en lata, arroz integral, brócoli\",\"cantidad\":\"1 lata de atún, 100g de arroz integral, 100g de brócoli\"},{\"nombre\":\"Cena\",\"alimentos\":\"Salmón al horno, quínoa, zanahorias\",\"cantidad\":\"150g de salmón al horno, 100g de quínoa, 100g de zanahorias\"}]},{\"dia\":\"Sábado\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Batido de proteínas, plátano, almendras\",\"cantidad\":\"1 batido de proteínas, 1 plátano, 30g de almendras\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Pollo a la plancha, batata, ensalada verde\",\"cantidad\":\"150g de pollo a la plancha, 100g de batata, ensalada verde al gusto\"},{\"nombre\":\"Cena\",\"alimentos\":\"Tofu salteado, arroz basmati, espárragos\",\"cantidad\":\"150g de tofu salteado, 100g de arroz basmati, 100g de espárragos\"}]},{\"dia\":\"Domingo\",\"comidas\":[{\"nombre\":\"Desayuno\",\"alimentos\":\"Huevos revueltos, aguacate, pan integral\",\"cantidad\":\"2 huevos, 1 aguacate, 2 rebanadas de pan integral\"},{\"nombre\":\"Almuerzo\",\"alimentos\":\"Ternera, quínoa, brócoli\",\"cantidad\":\"150g de ternera, 100g de quínoa, 100g de brócoli\"},{\"nombre\":\"Cena\",\"alimentos\":\"Salmón al horno, batata, espárragos\",\"cantidad\":\"150g de salmón al horno, 100g de batata, 100g de espárragos\"}]}]', '2025-06-06 12:00:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivo`
--

CREATE TABLE `objetivo` (
  `id` int(11) NOT NULL,
  `objetivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objetivo`
--

INSERT INTO `objetivo` (`id`, `objetivo`) VALUES
(1, 'Perder peso'),
(2, 'Ganar masa muscular'),
(3, 'Mejorar la condición física general'),
(4, 'Recuperación o rehabilitación de lesiones'),
(5, 'Mejorar el rendimiento deportivo'),
(6, 'Mantenimiento'),
(8, 'Ganar peso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE `rutinas` (
  `id` int(11) NOT NULL,
  `objetivo` varchar(255) NOT NULL,
  `dias_por_semana` varchar(50) DEFAULT NULL,
  `tipo_entrenamiento` text DEFAULT NULL,
  `semana` text DEFAULT NULL,
  `principios` text DEFAULT NULL,
  `enfoque` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`id`, `objetivo`, `dias_por_semana`, `tipo_entrenamiento`, `semana`, `principios`, `enfoque`) VALUES
(1, 'Perder peso', '5 días', 'Cardio + entrenamiento de fuerza ligera', 'Lunes: Cardio HIIT + Fuerza (tren superior)\nMartes: Cardio moderado (cinta/bici)\nMiércoles: Cardio HIIT + Fuerza (piernas)\nJueves: Yoga o cardio suave\nViernes: Cardio HIIT + Core\nSábado/Domingo: Descanso o actividad ligera', 'Circuitos, altas repeticiones (12-15), 2-3 series.', 'Maximizar quema de calorías y mantener masa muscular'),
(2, 'Ganar masa muscular', '4 días', 'Fuerza intensa (pesas moderadas a pesadas)', 'Lunes: Pecho + Tríceps\nMartes: Espalda + Bíceps\nMiércoles: Descanso\nJueves: Piernas + Glúteos\nViernes: Hombros + Abdominales\nSábado/Domingo: Descanso', '3-4 ejercicios por músculo, 8-12 repeticiones, 3-4 series.', 'Romper fibras musculares para crecimiento'),
(3, 'Mejorar la condición física general', '4-5 días', 'Cardio + fuerza + movilidad', 'Lunes: Cardio moderado + Full body fuerza\nMartes: Movilidad + Core\nMiércoles: Cardio HIIT\nJueves: Fuerza tren inferior\nViernes: Cardio + movilidad\nSábado/Domingo: Descanso activo', 'Combinación de entrenamiento funcional, cardio y fuerza ligera.', 'Mejorar resistencia, movilidad y fuerza general'),
(4, 'Recuperación o rehabilitación de lesiones', '3-4 días', 'Movilidad, fuerza ligera, ejercicios terapéuticos', 'Lunes: Estiramientos y fuerza controlada\nMartes: Descanso\nMiércoles: Cardio de bajo impacto (bicicleta estática, elíptica)\nJueves: Fuerza básica + movilidad\nViernes: Estiramientos o fisioterapia\nSábado/Domingo: Descanso', 'Enfoque en técnica perfecta, cargas bajas, progreso lento.', 'Recuperar movilidad y fuerza de forma segura'),
(5, 'Mejorar el rendimiento deportivo', '5-6 días', 'Fuerza explosiva + resistencia específica', 'Lunes: Fuerza tren superior\nMartes: Técnica deportiva específica\nMiércoles: Cardio de alta intensidad\nJueves: Fuerza tren inferior\nViernes: Trabajo de velocidad y agilidad\nSábado: Resistencia aeróbica\nDomingo: Descanso', 'Ejercicios pliométricos, potencia, series cortas e intensas.', 'Optimizar fuerza, agilidad y rendimiento específico'),
(6, 'Mantenimiento', '3-4 días', 'Fuerza moderada + cardio moderado', 'Lunes: Full body fuerza\nMartes: Cardio moderado\nMiércoles: Descanso\nJueves: Circuito de fuerza ligera\nViernes: Cardio ligero + Core\nSábado/Domingo: Descanso o paseo activo', '2-3 series de 10-12 repeticiones, enfoque equilibrado.', 'Mantener condición física y composición corporal estable'),
(7, 'Ganar peso', '5', 'Entrenamiento de fuerza + ejercicios multiarticulares', 'Lunes: Pecho + Tríceps (Press banca, Fondos, Aperturas)\\nMartes: Espalda + Bíceps (Dominadas, Remo, Curl bíceps)\\nMiércoles: Piernas (Sentadillas, Prensa, Peso muerto)\\nJueves: Hombros + Abdomen (Press militar, Elevaciones laterales, Crunch)\\nViernes: Full body (Combinación de ejercicios multiarticulares)', 'Series de 8-12 repeticiones, cargas progresivas, descanso 60-90s, técnica estricta', 'Maximizar ganancia de masa muscular y fuerza, superávit calórico, priorizar ejercicios básicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas_ia`
--

CREATE TABLE `rutinas_ia` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `rutina_json` longtext NOT NULL,
  `fecha_guardado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutinas_ia`
--

INSERT INTO `rutinas_ia` (`id`, `id_usuario`, `rutina_json`, `fecha_guardado`) VALUES
(1, 12, '[{\"dia\":\"Lunes\",\"ejercicios\":[{\"nombre\":\"Sentadillas\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Press de banca\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Dominadas\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"}]},{\"dia\":\"Martes\",\"ejercicios\":[{\"nombre\":\"Peso muerto\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Fondos en paralelas\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Elevaciones laterales\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"}]},{\"dia\":\"Miércoles\",\"ejercicios\":[{\"nombre\":\"Press militar\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Remo con barra\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Curl de bíceps\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"}]},{\"dia\":\"Jueves\",\"ejercicios\":[{\"nombre\":\"Sentadillas frontales\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Press de hombros\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Pájaros\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"}]},{\"dia\":\"Viernes\",\"ejercicios\":[{\"nombre\":\"Prensa de piernas\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Pull-ups\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Curl de bíceps con barra Z\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"}]},{\"dia\":\"Sábado\",\"ejercicios\":[{\"nombre\":\"Hip Thrust\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Press francés\",\"series\":\"4\",\"repeticiones\":\"8-10\",\"descanso\":\"2 min\"},{\"nombre\":\"Flexiones de tríceps en suelo\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"}]},{\"dia\":\"Domingo\",\"ejercicios\":[{\"nombre\":\"Gemelos de pie\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"},{\"nombre\":\"Gemelos sentado\",\"series\":\"4\",\"repeticiones\":\"12-15\",\"descanso\":\"1 min\"},{\"nombre\":\"Plancha abdominal\",\"series\":\"3\",\"repeticiones\":\"30 seg\",\"descanso\":\"1 min\"}]}]', '2025-06-06 12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_dieta`
--

CREATE TABLE `tipos_dieta` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_dieta`
--

INSERT INTO `tipos_dieta` (`id`, `tipo`) VALUES
(1, 'Vegetariana'),
(2, 'Vegana'),
(3, 'Sin gluten'),
(4, 'Baja en carbohidratos'),
(5, 'Alta en proteínas'),
(6, 'Sin lactosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` enum('Hombre','Mujer','Otro') DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  `peso_actual` decimal(5,2) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `foto` longtext DEFAULT NULL,
  `objetivo` varchar(50) DEFAULT NULL,
  `id_rutina` int(11) DEFAULT NULL,
  `dieta_id` int(11) DEFAULT NULL,
  `rol` varchar(20) DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `fecha_nacimiento`, `edad`, `sexo`, `altura`, `peso_actual`, `correo`, `contraseña`, `foto`, `objetivo`, `id_rutina`, `dieta_id`, `rol`) VALUES
(12, 'Andres Jose Marin Pascualvaca', '1995-01-22', 30, 'Hombre', 1.85, 75.00, 'themorocd@gmail.com', '$2b$10$HCYupMnIpLGqKV60smAZH.Im7W0NYiC5Poid4MCEvFmmhyBjpS/DK', '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', 'Ganar masa muscular', 2, 15, 'usuario'),
(15, 'Administrador', '0001-01-01', 1, 'Hombre', 1.00, 1.00, 'admin@gmail.com', '$2b$10$0Fq8H3D.sjYtBj6D14Q4UOwoWrlgTc5p21WMG9v4w4mFe0TKH3v1O', NULL, 'Perder peso', 1, NULL, 'admin'),
(17, 'Andres', '1995-01-23', 30, 'Hombre', 99.99, 75.00, 'andresjosemarinpascualvaca@gmail.com', '$2b$10$88zQYaVw2d.Nsir1lNd2iObwJq9W1AKqJLeRjMVvUq.d3OcGpdIli', NULL, 'Ganar masa muscular', 2, NULL, 'usuario'),
(21, 'pepito grillo', '1995-01-23', 30, 'Hombre', 99.99, 87.00, 'themorocd2@gmail.com', '$2b$10$os1CxrjXIRDhq.JufOkma.IjMRRvVnnEgjL.K9YZa/NO1vLRF7To2', NULL, 'Ganar masa muscular', 2, NULL, 'usuario'),
(22, 'Clara', '1995-01-23', 30, 'Mujer', 99.99, 60.00, 'claraa17072000@gmail.com', '$2b$10$QLRzfyAMC3mivH8nf23n7.ZntuCEEP/HbBm0is1ZR0Cz1fKoyGYUq', NULL, 'Ganar masa muscular', 2, NULL, 'usuario'),
(23, 'pepito grillo', '1995-01-22', 30, 'Hombre', 1.85, 76.00, 'pepito@gmail.com', '$2b$10$bMKDpgPcYlcrowU9ZXFt4ult7DjevebjaPtv34gx9yMCfw9qKoAYi', NULL, 'Ganar peso', 7, 13, 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dietas`
--
ALTER TABLE `dietas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dietas_ia`
--
ALTER TABLE `dietas_ia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario` (`id_usuario`);

--
-- Indices de la tabla `objetivo`
--
ALTER TABLE `objetivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutinas_ia`
--
ALTER TABLE `rutinas_ia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipos_dieta`
--
ALTER TABLE `tipos_dieta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`correo`),
  ADD KEY `fk_rutina` (`id_rutina`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `dietas`
--
ALTER TABLE `dietas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `dietas_ia`
--
ALTER TABLE `dietas_ia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `objetivo`
--
ALTER TABLE `objetivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rutinas_ia`
--
ALTER TABLE `rutinas_ia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tipos_dieta`
--
ALTER TABLE `tipos_dieta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dietas_ia`
--
ALTER TABLE `dietas_ia`
  ADD CONSTRAINT `dietas_ia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rutinas_ia`
--
ALTER TABLE `rutinas_ia`
  ADD CONSTRAINT `rutinas_ia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_rutina` FOREIGN KEY (`id_rutina`) REFERENCES `rutinas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
