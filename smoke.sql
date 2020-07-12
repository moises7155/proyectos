-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2020 a las 20:08:55
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `smoke`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_products` (`_imagen` VARCHAR(255), `_nombre` VARCHAR(45), `_descripcion` VARCHAR(255), `_precio` DOUBLE, `_stock` INT(11), `_stock_minimo` INT(11), `codigo_barras` VARCHAR(45))  INSERT INTO producto(nombre, imagen, descripcion, precio, stock, stock_minimo, codigo_barras) VALUES (_nombre, _imagen, _descripcion, _precio, _stock, _stock_minimo, codigo_barras )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usuario` (`_nombre` VARCHAR(15), `_email` VARCHAR(45), `_password` VARCHAR(255), `_rol` ENUM('administrador','vendedor'))  INSERT INTO usuarios (nombre, email, password, rol) VALUES (_nombre, _email, _password, _rol )$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `tipo` enum('editado','eliminado','agregado') DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  `Producto_id` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `tipo`, `fecha_mod`, `Producto_id`, `usuario`) VALUES
(1, 'agregado', '2020-06-26', 1, 'arturo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `codigo_barras` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `imagen`, `nombre`, `descripcion`, `precio`, `stock`, `stock_minimo`, `codigo_barras`) VALUES
(1, 'https://images-na.ssl-images-amazon.com/images/I/510YTzJuxTL._AC_SX522_.jpg', 'Pipa cristal grande', 'pipa tintada', 30, 500, 60, '25245asdsd'),
(2, 'https://www.dhresource.com/0x0/f2/albu/g6/M01/56/8F/rBVaR1sOawKAbrdNAAH01V7AUrA472.jpg', 'Pipa pyrex', 'pipa tintada de blanco', 80, 300, 60, '2asdasd5245asdsd'),
(3, 'https://http2.mlstatic.com/pipa-cristal-reforzada-100pzs-30mm-hundida-D_NQ_NP_751575-MLM29155513922_012019-F.jpg', 'Pipa cristal', 'pipa tintada', 30, 500, 60, '25245asdsd'),
(4, 'https://http2.mlstatic.com/pipa-cristal-reforzada-100pzs-30mm-hundida-D_NQ_NP_751575-MLM29155513922_012019-F.jpg', 'Pipa cristal', 'pipa tintada', 30, 500, 60, '25245asdsd'),
(5, 'https://http2.mlstatic.com/pipa-cristal-reforzada-100pzs-30mm-hundida-D_NQ_NP_751575-MLM29155513922_012019-F.jpg', 'Pipa cristal', 'pipa tintada', 30, 500, 60, '25245asdsd'),
(10, 'http://localhost/smoke/imagenes/pipa.jpg', 'pipa', 'pirex', 100, 100, 20, '245644'),
(11, 'http://localhost/smoke/imagenes/aluminio.jpg', 'Pipa de aluminio', 'uso para hierba', 45, 58, 10, '89897787'),
(13, 'http://localhost/smoke/imagenes/pipa.jpg', 'pipa cristal', 'pipa tintada', 30, 500, 60, '25245');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_ventas`
--

CREATE TABLE `producto_has_ventas` (
  `Producto_id` int(11) NOT NULL,
  `ventas_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_has_ventas`
--

INSERT INTO `producto_has_ventas` (`Producto_id`, `ventas_id`, `cantidad`, `importe`) VALUES
(1, 2, 2, '70.00'),
(1, 4, 1, '35.00'),
(1, 5, 2, '70.00'),
(2, 3, 3, '300.00'),
(2, 4, 1, '100.00'),
(2, 6, 2, '200.00'),
(3, 3, 1, '100.00'),
(3, 4, 1, '100.00'),
(3, 7, 2, '200.00'),
(4, 2, 1, '40.00'),
(4, 4, 2, '80.00'),
(5, 4, 1, '40.00'),
(5, 8, 3, '120.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `telefono`, `imagen`) VALUES
(1, 'Eduardo', '415-123-4567', 'https://www.tekcrispy.com/wp-content/uploads/2018/10/avatar.png'),
(2, 'David', '415-167-0236', 'https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_has_producto`
--

CREATE TABLE `proveedores_has_producto` (
  `proveedores_id` int(11) NOT NULL,
  `Producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores_has_producto`
--

INSERT INTO `proveedores_has_producto` (`proveedores_id`, `Producto_id`) VALUES
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` enum('administrador','vendedor') DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `status`) VALUES
(1, 'arturo', 'arturbau0194@gmail.com ', '$2y$10$vvdjUSF6JlFLQZXt57rv1Ozr9n8thn6/Mvo1fIZJIUDt2nwem1B4S', 'administrador', 1),
(2, 'moises', 'moises_gm9@hotmail.com', '$2y$10$.OX7BJZIyDTVI9EEecfUpe.2QkST9br6EjNPFWZJHZIcWxc3w.cD6', 'vendedor', 1),
(3, 'janete', 'janete@gmail.com', '$2y$10$oz35TtiYnbRhMB5/pb1r9.7l6UbyXhkBciVw.t8r9Ir2qY977pxFS', 'administrador', 1),
(6, 'javier', 'javier@gmail.com', '$2y$10$QD4Ov9vG3BZ7pbqCr0c8FeOq2WfPtce2/fm6CJI0CLAQmBGC894iK', 'administrador', 1),
(7, 'Doris', 'doris@gmail.com', '$2y$10$LlLRNS.JrpQydc.1VDrF9eab049B3GDdCU5AgwDFLgrFWwGaf7D9y', 'vendedor', 1),
(8, 'Federico', 'federico@gmail.com', '$2y$10$FwhAdnCmcF8D6eYMCYgLp.OUtirp.0DwovyiYnEgx8yrEWADnrQ6a', 'vendedor', 1),
(9, 'asdasd', 'janete@gmail.com', '$2y$10$gMmC.AiNYR1BpL23kYSOd.w0T1tKVxoGOK2bmQa0rKHV3NHg3YE2u', 'administrador', 1),
(10, 'Paulino', 'paulo@gmail.com', '$2y$10$SnCnDkZ5xq6r0C3XBHWzwe9P6Bpev.bS4ljK1zFBdvVZ8BCbOLa3a', 'vendedor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `no_ticket` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `fecha_venta`, `status`, `usuarios_id`, `no_ticket`) VALUES
(2, '2020-06-27', 'Pagada', 2, 1),
(3, '2020-06-28', 'Pagada', 2, 2),
(4, '2020-06-29', 'Pagada', 1, 3),
(5, '2020-05-04', 'Pagado', 2, 4),
(6, '2020-05-17', 'Pagado', 2, 5),
(7, '2020-04-06', 'Pagado', 2, 6),
(8, '2020-04-07', 'Pagado', 2, 7);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_product`
--
CREATE TABLE `view_product` (
`id` int(11)
,`imagen` varchar(255)
,`nombre` varchar(45)
,`descripcion` varchar(45)
,`precio` double
,`stock` int(11)
,`stock_minimo` int(11)
,`codigo_barras` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_users`
--
CREATE TABLE `vista_users` (
`id` int(11)
,`nombre` varchar(45)
,`email` varchar(45)
,`password` varchar(255)
,`rol` enum('administrador','vendedor')
,`status` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_product`
--
DROP TABLE IF EXISTS `view_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product`  AS  select `producto`.`id` AS `id`,`producto`.`imagen` AS `imagen`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`precio` AS `precio`,`producto`.`stock` AS `stock`,`producto`.`stock_minimo` AS `stock_minimo`,`producto`.`codigo_barras` AS `codigo_barras` from `producto` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_users`
--
DROP TABLE IF EXISTS `vista_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_users`  AS  select `usuarios`.`id` AS `id`,`usuarios`.`nombre` AS `nombre`,`usuarios`.`email` AS `email`,`usuarios`.`password` AS `password`,`usuarios`.`rol` AS `rol`,`usuarios`.`status` AS `status` from `usuarios` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimientos_Producto1_idx` (`Producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_has_ventas`
--
ALTER TABLE `producto_has_ventas`
  ADD PRIMARY KEY (`Producto_id`,`ventas_id`),
  ADD KEY `fk_Producto_has_ventas_ventas1_idx` (`ventas_id`),
  ADD KEY `fk_Producto_has_ventas_Producto_idx` (`Producto_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores_has_producto`
--
ALTER TABLE `proveedores_has_producto`
  ADD PRIMARY KEY (`proveedores_id`,`Producto_id`),
  ADD KEY `fk_proveedores_has_Producto_Producto1_idx` (`Producto_id`),
  ADD KEY `fk_proveedores_has_Producto_proveedores1_idx` (`proveedores_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ventas_usuarios1_idx` (`usuarios_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_movimientos_Producto1` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_ventas`
--
ALTER TABLE `producto_has_ventas`
  ADD CONSTRAINT `fk_Producto_has_ventas_Producto` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_ventas_ventas1` FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores_has_producto`
--
ALTER TABLE `proveedores_has_producto`
  ADD CONSTRAINT `fk_proveedores_has_Producto_Producto1` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proveedores_has_Producto_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
