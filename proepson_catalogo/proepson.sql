-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 22:51:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proepson`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Impresoras'),
(2, 'Cartuchos de tinta'),
(3, 'Escáneres'),
(4, 'Papeles'),
(5, 'Tintas'),
(6, 'Impresoras 3D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `marca` varchar(50) DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT NULL CHECK (`descuento` >= 0 and `descuento` <= 100),
  `precio_con_descuento` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `rating`, `marca`, `descuento`, `precio_con_descuento`, `imagen`, `categoria_id`) VALUES
(1, 'Impresora HP LaserJet Pro M404dw', 'Impresora láser monocromática rápida y fiable para pequeñas empresas y grupos de trabajo.', 299.99, 50, 4, 'HP', 0.00, 299.99, '/ruta/imagen_impresora.jpg', 1),
(2, 'Cartucho de tinta HP 63', 'Cartucho de tinta original de alta calidad para impresión cotidiana.', 25.99, 100, 5, 'HP', 0.00, 25.99, '/ruta/imagen_cartucho.jpg', 2),
(3, 'Escaner Epson Perfection V600', 'Escaner de alta resolución para digitalizar fotos, películas, diapositivas, documentos y más.', 229.99, 30, 4, 'Epson', 0.00, 229.99, '/ruta/imagen_escaner.jpg', 3),
(4, 'Papel de impresión HP Office A4', 'Papel de impresión de alta calidad para documentos cotidianos.', 9.99, 500, 4, 'HP', 0.00, 9.99, '/ruta/imagen_papel.jpg', 4),
(5, 'Tinta Epson T502 EcoTank', 'Botella de tinta original de alta capacidad para recargar impresoras EcoTank.', 19.99, 200, 5, 'Epson', 0.00, 19.99, '/ruta/imagen_tinta.jpg', 5),
(6, 'Impresora 3D Creality Ender 3 Pro', 'Impresora 3D de alta calidad y fácil de usar para entusiastas y profesionales.', 259.99, 20, 4, 'Creality', 0.00, 259.99, '/ruta/imagen_impresora3d.jpg', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
