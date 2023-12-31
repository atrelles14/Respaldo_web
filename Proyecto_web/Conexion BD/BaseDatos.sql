-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 04:06:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `actualizar_apellido`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_apellido` (IN `p_id_user` INT, IN `p_nuevo_apellido` VARCHAR(50))   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar el apellido';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_apellido = p_nuevo_apellido
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DROP PROCEDURE IF EXISTS `actualizar_email`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_email` (IN `p_id_user` INT, IN `p_nuevo_email` VARCHAR(50))   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar el email';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_email = p_nuevo_email
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DROP PROCEDURE IF EXISTS `actualizar_fecha`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_fecha` (IN `p_id_user` INT, IN `p_nueva_fecha` DATE)   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar LA fecha de nacimiento';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_fechacumple = p_nueva_fecha
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DROP PROCEDURE IF EXISTS `actualizar_nombre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_nombre` (IN `p_id_user` INT, IN `p_nuevo_nombre` VARCHAR(50))   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar el nombre';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_nombre = p_nuevo_nombre
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DROP PROCEDURE IF EXISTS `actualizar_password`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_password` (IN `p_id_user` INT, IN `p_nueva_password` VARCHAR(15))   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar la contraseña';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_password = p_nueva_password
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DROP PROCEDURE IF EXISTS `actualizar_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_user` (IN `p_id_user` INT, IN `p_nuevo_user` VARCHAR(50))   BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar excepciones SQL
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al crear el usuario';
    END;
    -- Iniciar la transacción
    START TRANSACTION;
    UPDATE usuario
    SET Usu_user = p_nuevo_user
    WHERE Usu_ID = p_id_user;
   
    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE `favoritos` (
  `Fav_ID` int(11) NOT NULL,
  `Fav_ID_cancion` int(11) DEFAULT NULL,
  `Fav_nombre_cancion` varchar(150) DEFAULT NULL,
  `Fav_artista_cancion` varchar(100) DEFAULT NULL,
  `Fav_ID_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `favoritos`:
--   `Fav_ID_usuario`
--       `usuario` -> `Usu_ID`
--

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`Fav_ID`, `Fav_ID_cancion`, `Fav_nombre_cancion`, `Fav_artista_cancion`, `Fav_ID_usuario`) VALUES
(2, 9249219, 'Super Shy', 'NewJeans (뉴진스)', 1),
(4, 9120330, 'Bite Me', 'ENHYPEN (엔하이픈)', 1),
(5, 9586157, 'Chasing That Feeling', 'TOMORROW X TOGETHER', 1),
(6, 8009315, 'DON QUIXOTE', 'SEVENTEEN (세븐틴)', 1),
(7, 7662944, 'INVU', 'TAEYEON (태연)', 1),
(8, 7797196, 'LOVE DIVE', 'IVE', 1),
(9, 3308361, '피카부 (Peek-A-Boo)', 'Red Velvet (레드벨벳)', 1),
(10, 8856240, 'Like Crazy (English Version)', 'Jimin (지민)', 1),
(11, 868452, 'Busca Por Dentro', 'Grupo Niche', 2),
(12, 1975040, 'Persona Ideal', 'Adolescent’s Orquesta', 2),
(13, 1305889, 'Gitana', 'Willie Colón', 2),
(14, 1728078, 'Deseandote', 'Frankie Ruiz', 3),
(15, 2052994, 'Si Tu Amor No Vuelve', 'Binomio De Oro De América', 3),
(16, 812153, 'Olvidala', 'Binomio De Oro De América', 3),
(17, 8222243, 'Hype Boy', 'NewJeans (뉴진스)', 1),
(18, 1795758, 'Donde Estara Mi Primavera', 'Marco Antonio Solís', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Usu_ID` int(11) NOT NULL,
  `Usu_user` varchar(50) DEFAULT NULL,
  `Usu_password` varchar(15) DEFAULT NULL,
  `Usu_email` varchar(50) DEFAULT NULL,
  `Usu_nombre` varchar(50) DEFAULT NULL,
  `Usu_apellido` varchar(50) DEFAULT NULL,
  `Usu_fechacumple` date DEFAULT NULL,
  `Usu_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `usuario`:
--

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Usu_ID`, `Usu_user`, `Usu_password`, `Usu_email`, `Usu_nombre`, `Usu_apellido`, `Usu_fechacumple`, `Usu_tipo`) VALUES
(1, 'Gabriela', 'Rito1402', 'gabi@outlook.com', 'Lineth', 'Hernandez', '2002-06-15', 'regular'),
(2, 'Martin', 'abc12345', 'martin@gmail.com', 'Martin', 'Romero', '2023-11-13', 'regular'),
(3, 'Admin1', 'administrador1', 'admin@outlook.com', 'Admin', 'Admin', '2023-11-29', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`Fav_ID`),
  ADD KEY `Fav_ID_usuario` (`Fav_ID_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Usu_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `Fav_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Usu_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `Fav_ID_usuario` FOREIGN KEY (`Fav_ID_usuario`) REFERENCES `usuario` (`Usu_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
