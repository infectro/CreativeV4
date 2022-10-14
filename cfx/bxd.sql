-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Ago-2021 às 00:34
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bxd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_accounts`
--

CREATE TABLE `bxd_accounts` (
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `chars` int(1) NOT NULL DEFAULT 1,
  `gems` int(11) NOT NULL DEFAULT 0,
  `premium` int(11) NOT NULL DEFAULT 0,
  `predays` int(11) NOT NULL DEFAULT 0,
  `priority` int(3) NOT NULL DEFAULT 0,
  `login` varchar(25) NOT NULL DEFAULT '00/00/0000',
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `steam` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_banneds`
--

CREATE TABLE `bxd_banneds` (
  `id` int(11) NOT NULL,
  `steam` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `days` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_characters`
--

CREATE TABLE `bxd_characters` (
  `id` int(11) NOT NULL,
  `steam` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `serial` varchar(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `bank` int(11) NOT NULL DEFAULT 1500,
  `fines` int(11) NOT NULL DEFAULT 0,
  `garage` int(3) NOT NULL DEFAULT 1,
  `homes` int(3) NOT NULL DEFAULT 1,
  `prison` int(11) NOT NULL DEFAULT 0,
  `port` int(1) NOT NULL DEFAULT 0,
  `penal` int(1) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_chests`
--

CREATE TABLE `bxd_chests` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 0,
  `perm` varchar(100) NOT NULL,
  `logs` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_entitydata`
--

CREATE TABLE `bxd_entitydata` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_playerdata`
--

CREATE TABLE `bxd_playerdata` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_prison`
--

CREATE TABLE `bxd_prison` (
  `id` int(11) NOT NULL,
  `police` varchar(255) DEFAULT '0',
  `nuser_id` int(11) NOT NULL DEFAULT 0,
  `services` int(11) NOT NULL DEFAULT 0,
  `fines` int(11) NOT NULL DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_propertys`
--

CREATE TABLE `bxd_propertys` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT 'Homes0001',
  `interior` varchar(255) NOT NULL DEFAULT 'Middle',
  `tax` int(20) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `residents` int(11) NOT NULL DEFAULT 1,
  `vault` int(11) NOT NULL DEFAULT 1,
  `fridge` int(11) NOT NULL DEFAULT 1,
  `owner` int(1) NOT NULL DEFAULT 0,
  `contract` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_races`
--

CREATE TABLE `bxd_races` (
  `id` int(11) NOT NULL,
  `raceid` int(11) NOT NULL DEFAULT 0,
  `user_id` int(9) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `vehicle` varchar(100) NOT NULL DEFAULT '0',
  `points` int(20) NOT NULL DEFAULT 0,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bxd_vehicles`
--

CREATE TABLE `bxd_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int(20) NOT NULL DEFAULT 0,
  `plate` varchar(20) DEFAULT NULL,
  `hardness` int(1) NOT NULL DEFAULT 0,
  `rental` int(11) NOT NULL DEFAULT 0,
  `rendays` int(11) NOT NULL DEFAULT 0,
  `arrest` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `engine` int(11) NOT NULL DEFAULT 1000,
  `body` int(11) NOT NULL DEFAULT 1000,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `work` varchar(10) NOT NULL DEFAULT 'false',
  `doors` varchar(254) NOT NULL,
  `windows` varchar(254) NOT NULL,
  `tyres` varchar(254) NOT NULL,
  `brakes` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bxd_accounts`
--
ALTER TABLE `bxd_accounts`
  ADD PRIMARY KEY (`steam`) USING BTREE,
  ADD KEY `steam` (`steam`) USING BTREE;

--
-- Índices para tabela `bxd_banneds`
--
ALTER TABLE `bxd_banneds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_characters`
--
ALTER TABLE `bxd_characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_chests`
--
ALTER TABLE `bxd_chests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_entitydata`
--
ALTER TABLE `bxd_entitydata`
  ADD PRIMARY KEY (`dkey`),
  ADD KEY `dkey` (`dkey`);

--
-- Índices para tabela `bxd_playerdata`
--
ALTER TABLE `bxd_playerdata`
  ADD PRIMARY KEY (`user_id`,`dkey`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dkey` (`dkey`);

--
-- Índices para tabela `bxd_prison`
--
ALTER TABLE `bxd_prison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_propertys`
--
ALTER TABLE `bxd_propertys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_races`
--
ALTER TABLE `bxd_races`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `bxd_vehicles`
--
ALTER TABLE `bxd_vehicles`
  ADD PRIMARY KEY (`user_id`,`vehicle`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle` (`vehicle`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bxd_banneds`
--
ALTER TABLE `bxd_banneds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bxd_characters`
--
ALTER TABLE `bxd_characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bxd_chests`
--
ALTER TABLE `bxd_chests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bxd_prison`
--
ALTER TABLE `bxd_prison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bxd_propertys`
--
ALTER TABLE `bxd_propertys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bxd_races`
--
ALTER TABLE `bxd_races`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
