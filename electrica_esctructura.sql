-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-01-2023 a las 16:10:13
-- Versión del servidor: 10.5.18-MariaDB-0+deb11u1
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `electrica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nrocompra` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `tienda_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE `contenidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `unitario` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronogramas`
--

CREATE TABLE `cronogramas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `actividad` varchar(255) NOT NULL,
  `distrito` varchar(255) NOT NULL,
  `junta` varchar(255) NOT NULL,
  `zona` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `cantidad` double NOT NULL,
  `fecha` date NOT NULL,
  `celular` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncias`
--

CREATE TABLE `denuncias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ci` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `zona` varchar(255) DEFAULT NULL,
  `nroposte` varchar(255) DEFAULT NULL,
  `reclamo` text DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `lng` double(11,6) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'EN ESPERA',
  `tecnico` varchar(255) DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `actividad` varchar(255) DEFAULT NULL,
  `l70` varchar(255) DEFAULT NULL,
  `l150` varchar(255) DEFAULT NULL,
  `l250` varchar(255) DEFAULT NULL,
  `r70` varchar(255) DEFAULT NULL,
  `r150` varchar(255) DEFAULT NULL,
  `r250` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  `ignitor` varchar(255) DEFAULT NULL,
  `cable` varchar(255) DEFAULT NULL,
  `contactor` varchar(255) DEFAULT 'NO',
  `termico` varchar(255) DEFAULT 'NO',
  `soquet` varchar(255) DEFAULT NULL,
  `fechaman` date DEFAULT NULL,
  `horaman` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diarios`
--

CREATE TABLE `diarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zona` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `carro_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diario_tecnico`
--

CREATE TABLE `diario_tecnico` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `diario_id` bigint(20) UNSIGNED NOT NULL,
  `tecnico_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` double NOT NULL DEFAULT 1,
  `codigo` varchar(255) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'ACTIVO',
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juntas`
--

CREATE TABLE `juntas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `distrito` varchar(255) DEFAULT NULL,
  `zona` varchar(255) DEFAULT NULL,
  `representante` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `unidad` varchar(255) NOT NULL,
  `stock` double NOT NULL,
  `minimo` double NOT NULL,
  `codificar` varchar(255) NOT NULL DEFAULT 'NO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_user`
--

CREATE TABLE `permiso_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permiso_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ci` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postes`
--

CREATE TABLE `postes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` double(11,6) NOT NULL,
  `lng` double(11,6) NOT NULL,
  `luminaria` varchar(255) NOT NULL,
  `nroposte` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `altura` varchar(255) NOT NULL,
  `junta` varchar(255) NOT NULL,
  `distrito` varchar(255) NOT NULL,
  `potencia` varchar(255) NOT NULL,
  `observacion` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'ACTIVO',
  `tipo` varchar(255) DEFAULT NULL,
  `fechaplan` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lat` double(11,6) NOT NULL,
  `lng` double(11,6) NOT NULL,
  `nroposte` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `dirigente` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `distrito` varchar(255) NOT NULL,
  `potencia` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamos`
--

CREATE TABLE `reclamos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reclamo` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fechaman` date DEFAULT NULL,
  `horaman` time DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'EN ESPERA',
  `tecnico` varchar(255) DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `actividad` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL DEFAULT 'RECLAMO',
  `l70` varchar(255) DEFAULT NULL,
  `l150` varchar(255) DEFAULT NULL,
  `l250` varchar(255) DEFAULT NULL,
  `r70` varchar(255) DEFAULT NULL,
  `r150` varchar(255) DEFAULT NULL,
  `r250` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  `ignitor` varchar(255) DEFAULT NULL,
  `cable` varchar(255) DEFAULT NULL,
  `contactor` varchar(255) DEFAULT 'NO',
  `termico` varchar(255) DEFAULT 'NO',
  `soquet` varchar(255) DEFAULT NULL,
  `persona_id` bigint(20) UNSIGNED DEFAULT NULL,
  `poste_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `representante` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'ACTIVO',
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_tienda_id_foreign` (`tienda_id`);

--
-- Indices de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contenidos_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `cronogramas`
--
ALTER TABLE `cronogramas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diarios`
--
ALTER TABLE `diarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diarios_carro_id_foreign` (`carro_id`),
  ADD KEY `diarios_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `diario_tecnico`
--
ALTER TABLE `diario_tecnico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diario_tecnico_diario_id_foreign` (`diario_id`),
  ADD KEY `diario_tecnico_tecnico_id_foreign` (`tecnico_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_material_id_foreign` (`material_id`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_material_id_foreign` (`material_id`),
  ADD KEY `inventarios_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `juntas`
--
ALTER TABLE `juntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_codigo_unique` (`codigo`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permiso_user_user_id_foreign` (`user_id`),
  ADD KEY `permiso_user_permiso_id_foreign` (`permiso_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_ci_unique` (`ci`);

--
-- Indices de la tabla `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamos_persona_id_foreign` (`persona_id`),
  ADD KEY `reclamos_poste_id_foreign` (`poste_id`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carros`
--
ALTER TABLE `carros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cronogramas`
--
ALTER TABLE `cronogramas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diarios`
--
ALTER TABLE `diarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diario_tecnico`
--
ALTER TABLE `diario_tecnico`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juntas`
--
ALTER TABLE `juntas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postes`
--
ALTER TABLE `postes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_tienda_id_foreign` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id`);

--
-- Filtros para la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD CONSTRAINT `contenidos_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `diarios`
--
ALTER TABLE `diarios`
  ADD CONSTRAINT `diarios_carro_id_foreign` FOREIGN KEY (`carro_id`) REFERENCES `carros` (`id`),
  ADD CONSTRAINT `diarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `diario_tecnico`
--
ALTER TABLE `diario_tecnico`
  ADD CONSTRAINT `diario_tecnico_diario_id_foreign` FOREIGN KEY (`diario_id`) REFERENCES `diarios` (`id`),
  ADD CONSTRAINT `diario_tecnico_tecnico_id_foreign` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnicos` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `inventarios_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Filtros para la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  ADD CONSTRAINT `permiso_user_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `permiso_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD CONSTRAINT `reclamos_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `reclamos_poste_id_foreign` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
