-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 00:54:40
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
-- Base de datos: `tienda_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add producto', 7, 'add_producto'),
(26, 'Can change producto', 7, 'change_producto'),
(27, 'Can delete producto', 7, 'delete_producto'),
(28, 'Can view producto', 7, 'view_producto'),
(29, 'Can add carrito item', 8, 'add_carritoitem'),
(30, 'Can change carrito item', 8, 'change_carritoitem'),
(31, 'Can delete carrito item', 8, 'delete_carritoitem'),
(32, 'Can view carrito item', 8, 'view_carritoitem'),
(33, 'Can add carrito', 9, 'add_carrito'),
(34, 'Can change carrito', 9, 'change_carrito'),
(35, 'Can delete carrito', 9, 'delete_carrito'),
(36, 'Can view carrito', 9, 'view_carrito'),
(37, 'Can add compra', 10, 'add_compra'),
(38, 'Can change compra', 10, 'change_compra'),
(39, 'Can delete compra', 10, 'delete_compra'),
(40, 'Can view compra', 10, 'view_compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$eLb0mHU8gQ1u9dz2hcmTl0$ffB4Q0u8mCHHWsH2dNpSyJiybCxhXI1W7ovDqU+KuzQ=', '2023-11-19 22:18:16.019671', 1, 'chenriquezf', '', '', 'admin@admin.cl', 1, 1, '2023-11-15 03:03:26.444823'),
(2, 'pbkdf2_sha256$600000$CWIG5h5CyxF0XkRn3kT7Nd$jv00rS9zNxXP34u93FGQIT0P0B72IvHoinpxbvmVjJw=', '2023-11-15 21:07:40.071072', 1, 'xbarrerap', '', '', 'admin@admin.cl', 1, 1, '2023-11-15 03:11:24.837541'),
(3, 'pbkdf2_sha256$600000$CfywlhBWJJCPkjCr9kYe0N$lexEExjoxNtmm1U3zMR0SKF/i3m/VcAmCVUsQ3TwQM8=', '2023-11-15 03:18:51.495579', 1, 'gscolario', '', '', 'admin@admin.cl', 1, 1, '2023-11-15 03:12:13.736566');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'tiendaApp', 'carrito'),
(8, 'tiendaApp', 'carritoitem'),
(10, 'tiendaApp', 'compra'),
(7, 'tiendaApp', 'producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-14 05:08:50.617609'),
(2, 'auth', '0001_initial', '2023-11-14 05:08:51.121277'),
(3, 'admin', '0001_initial', '2023-11-14 05:08:51.223176'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-14 05:08:51.238807'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-14 05:08:51.247265'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-14 05:08:51.300263'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-14 05:08:51.352054'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-14 05:08:51.360232'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-14 05:08:51.367211'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-14 05:08:51.396933'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-14 05:08:51.402955'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-14 05:08:51.409013'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-14 05:08:51.417710'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-14 05:08:51.429769'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-14 05:08:51.439781'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-14 05:08:51.447382'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-14 05:08:51.458110'),
(18, 'sessions', '0001_initial', '2023-11-14 05:08:51.482230'),
(19, 'tiendaApp', '0001_initial', '2023-11-14 05:08:51.499205'),
(20, 'tiendaApp', '0002_producto_categoria_alter_producto_imagen', '2023-11-14 16:38:53.848975'),
(21, 'tiendaApp', '0003_alter_producto_categoria', '2023-11-14 16:42:31.523768'),
(22, 'tiendaApp', '0004_alter_producto_categoria', '2023-11-14 16:43:50.636624'),
(23, 'tiendaApp', '0005_carritoitem', '2023-11-15 04:30:14.921399'),
(24, 'tiendaApp', '0006_delete_carritoitem', '2023-11-15 04:37:30.263352'),
(25, 'tiendaApp', '0007_producto_cantidad_disponible', '2023-11-15 18:46:19.563973'),
(26, 'tiendaApp', '0008_carrito', '2023-11-15 19:25:23.609661'),
(27, 'tiendaApp', '0009_compra', '2023-11-19 22:11:47.328015');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3x6mo1gblbezzkmu42zef121cr2urv81', '.eJztzN1qwyAUB_BXEa9FjDHR7nK73hPUIkfPSZOuVagGxsbefQ10sD3Devv_-H3yAGubw1rpGhbkT7zj4ncWIb1R3go8QT4WmUpu1yXKbSLvbZWvBen8fN_-AWao8-29wwnGKWGXOucm1e96G41L46AVoSWL1pjeKFCoNcbBUdKm0zZhxHFwfdzQC9UKR6o3br_3PIRTLfkn9VwwJZgeBPP8BXJbEJBBaiuclw9AYPS-tFLhQrmR3Oaee34Q7EE9qP9CHfjXN5LlS8A:1r4rRd:_ULTUBKz-OfJp5wD_9W6Dhji47Sj0dB5hskylvGw4fs', '2023-12-03 23:43:17.121691'),
('fcbwdh8m4iww5tqno0oe47xs6li1q3hb', '.eJxVjMsOwiAQRf-FtSG8oS7d-w2EmQGpGkhKuzL-uzbpQrf3nHNfLKZtrXEbeYkzsTOT7PS7QcJHbjuge2q3zrG3dZmB7wo_6ODXTvl5Ody_g5pG_dYTleQKkkQZQhF60h5MQGeVyOSzJ2-MNiIJUorAhozKSOWRgJwNGtj7A-7DOAI:1r3OEz:JrIdI5aj0nm72HzHtsn3w5CmDVs2BXr_nYYAsj8KsLg', '2023-11-29 22:20:09.222700'),
('iqatqf2syn9pxj6ss2gf3122f62rva93', '.eJxVjMtuwyAQRX8FsbYQxtiQLtt1vyBEaGDGMXmAFLBUJeq_N5ZSqd3ec-55cA9rW_xa6eYT8jfe8-7vFiCeKW8AT5CPRcSS2y0FsSniRav4LEiX95f7L7BAXZ7vHc4wzRH72Fs7y2E3mKBtnEYlCQ0ZNFoPWoJEpTCMlqLSvTIRA06jHcIWvVKtcKT6zO33jnt_qiX_ro53THZMjR1z_ANySwjIILYVLukOCIy-UisVrpQbiU133PHDgX__AOGdVa0:1r4rRm:Zqmjk5TuYZx3op-yh76YOLPaJBok7eoVnDOetr6qLZI', '2023-12-03 23:43:26.326872'),
('tl4mk87owupb5s4ud3mlsm34ew8mswsa', '.eJxVjMsOwiAQRf-FtSG8oS7d-w2EmQGpGkhKuzL-uzbpQrf3nHNfLKZtrXEbeYkzsTOT7PS7QcJHbjuge2q3zrG3dZmB7wo_6ODXTvl5Ody_g5pG_dYTleQKkkQZQhF60h5MQGeVyOSzJ2-MNiIJUorAhozKSOWRgJwNGtj7A-7DOAI:1r37op:e4VKy8qJBYs204QNQ-vJjdgu4dmUeH_oSeCq170cjX0', '2023-11-29 04:48:03.008984');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendaapp_carrito`
--

CREATE TABLE `tiendaapp_carrito` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `producto_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendaapp_compra`
--

CREATE TABLE `tiendaapp_compra` (
  `id` bigint(20) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendaapp_compra`
--

INSERT INTO `tiendaapp_compra` (`id`, `total`, `fecha`, `usuario_id`) VALUES
(1, 39960, '2023-11-19 22:12:46.621098', 1),
(2, 17990, '2023-11-19 22:13:27.510853', 1),
(3, 17990, '2023-11-19 22:35:52.363017', 1),
(4, 29990, '2023-11-19 22:36:14.012004', 1),
(5, 95870, '2023-11-19 23:44:46.765037', 1),
(6, 29990, '2023-11-19 23:47:05.649686', 1),
(7, 29900, '2023-11-19 23:53:30.902021', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendaapp_producto`
--

CREATE TABLE `tiendaapp_producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `categoria` varchar(20) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendaapp_producto`
--

INSERT INTO `tiendaapp_producto` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `categoria`, `cantidad_disponible`) VALUES
(6, 'Far cry 5', 'Bienvenido a Hope County, Montana, la tierra de los libres y los valientes, pero también hogar de un fanático culto del día del juicio final conocido como El proyecto en Eden\'s Gate, que está poniendo en peligro la libertad de la comunidad. Levántate contra los líderes del culto, Joseph Seed y los Heralds, y enciende a chispa de la resistencia que liberará a la asediada comunidad.', 17990, 'images/far_cry_5.jpg', 'PS4', 20),
(7, 'Crysis 3', 'La isla perdida transporta a los jugadores a una isla tropical en la costa de Ling Shan donde se desarrolla el Crysis original. La isla perdida incluye 4 mapas multijugador, Ascenso, Litoral, Arroyo y Travesía, 2 nuevos modos, 2 nuevas armas y una amplia gama de nuevos desafíos para desbloquear.', 29990, 'images/crysis_3.jpg', 'PS3', 20),
(8, 'Mortal Kombat X', 'Mortal Kombat regresa con su décima entrega, intentando continuar el éxito del retorno de la mano de Warner Bros. Con un estilo similar al juego anterior, el título añade varios estilos por luchador, al estilo de Mortal Kombat Deception, y además toma de Injustice: Gods Among Us la interactividad del escenario, permitiendo a los jugadores usar diferentes partes contra sus rivales. Hay también nuevos luchadores en el repertorio.', 9990, 'images/mortal_kombat_x.jpg', 'Xbox 360', 20),
(9, 'FIFA 23 Standard Edition Electronic Arts', 'FIFA 23 nos acerca aún más a la acción y al realismo con The World\'s Game y la tecnología HyperMotion2*, con el doble de capturas de movimiento del mundo real y animaciones más auténticas que nunca en cada partido.', 29900, 'images/fifa-23-xbox.jpg', 'Xbox One', 20),
(10, 'GTA TRILOGY', 'Tres ciudades famosas, tres historias épicas. Juega a los clásicos que definieron un género de la trilogía original de Grand Theft Auto: Grand Theft Auto: III, Grand Theft Auto: Vice City y Grand Theft Auto: San Andreas, actualizados para la nueva generación, ahora con mejoras a todos los niveles, como nueva y deslumbrante iluminación, retoques en el entorno, texturas de alta resolución, mayores distancias visuales, controles y apuntado al estilo de Grand Theft Auto V, y muchas cosas más.', 33900, 'images/gta.jpg', 'Xbox X', 20),
(11, 'Horizon Zero Dawn', 'Explora tierras remotas, enfréntate a máquinas más grandes e imponentes y descubre increíbles tribus en tu regreso a un futuro lejano en el mundo apocalíptico de Horizon.', 75000, 'images/horizon.jpg', 'PS5', 20),
(13, 'FIFA 23 Standard Edition Electronic Arts', 'Descripción de fifa 23 para play station 4 Standard edition', 111111, 'images/fifa-23.png', 'PS4', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `tiendaapp_carrito`
--
ALTER TABLE `tiendaapp_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiendaApp_carrito_producto_id_f4f7b059_fk_tiendaApp_producto_id` (`producto_id`),
  ADD KEY `tiendaApp_carrito_usuario_id_d64901ce_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `tiendaapp_compra`
--
ALTER TABLE `tiendaapp_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiendaApp_compra_usuario_id_46f1807a_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `tiendaapp_producto`
--
ALTER TABLE `tiendaapp_producto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tiendaapp_carrito`
--
ALTER TABLE `tiendaapp_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tiendaapp_compra`
--
ALTER TABLE `tiendaapp_compra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tiendaapp_producto`
--
ALTER TABLE `tiendaapp_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `tiendaapp_carrito`
--
ALTER TABLE `tiendaapp_carrito`
  ADD CONSTRAINT `tiendaApp_carrito_producto_id_f4f7b059_fk_tiendaApp_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `tiendaapp_producto` (`id`),
  ADD CONSTRAINT `tiendaApp_carrito_usuario_id_d64901ce_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `tiendaapp_compra`
--
ALTER TABLE `tiendaapp_compra`
  ADD CONSTRAINT `tiendaApp_compra_usuario_id_46f1807a_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
