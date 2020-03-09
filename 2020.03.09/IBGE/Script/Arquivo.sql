-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 03-Mar-2020 às 02:41
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `banco ibge`
--
CREATE DATABASE IF NOT EXISTS `banco ibge` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `banco ibge`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `populacao` text NOT NULL,
  `dataFundacao` date NOT NULL,
  `idUf` int(11) NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `FK_cidade_idUf` (`idUf`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`idCidade`, `nome`, `populacao`, `dataFundacao`, `idUf`) VALUES
(1, 'pirajui', '24.546 mil', '1915-03-29', 1),
(2, 'cafelândia', '17.499 ', '1926-02-28', 1),
(3, 'lins', '76.092', '1920-04-21', 1),
(4, 'Bahia', '15,13 milhões', '1549-03-29', 2),
(5, 'ceara', '8,843 milhões', '1726-04-13', 2),
(6, 'cuiabá', '612.547', '1719-04-08', 3),
(7, 'Porto Seguro', '80.240', '1500-04-22', 2),
(8, 'Ilheus', '148.437', '1881-06-28', 2),
(9, 'Várzea Grande', '184.069', '1867-05-15', 3),
(10, 'Sorriso', '90.313', '1986-05-13', 3),
(11, 'orlando', '280.257', '1953-10-30', 4),
(12, 'valencia', '2,531 milhões', '1799-01-23', 5),
(13, 'miami', '463.347', '1825-05-28', 4),
(14, 'texas', '28,7 milhões ', '1865-06-19', 4),
(15, 'Andaluiza', '8,41 milhões', '0000-00-00', 5),
(16, 'Las Rozas de madrid', '94 471', '0000-00-00', 5),
(17, 'Kailua', '38.635', '0000-00-00', 6),
(18, 'Hilo', '43.263', '0000-00-00', 6),
(19, 'Honolulu', '351.792', '0000-00-00', 6),
(20, 'Newark', '285.154', '0000-00-00', 7),
(21, 'jersey city', '270.753', '0000-00-00', 7),
(22, 'Atlantic city', '38.429 ', '0000-00-00', 7),
(23, 'Burgo', '356.080', '0000-00-00', 8),
(24, 'Biscaia', '1,135 milhão', '0000-00-00', 8),
(25, 'Cádis', '1,249 milhão', '0000-00-00', 8),
(26, 'Puerto Banús', '140.000', '0000-00-00', 9),
(27, 'el caminito del rey', '2,8 milhões', '0000-00-00', 9),
(28, 'velez malaga', '80.817', '0000-00-00', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `continente` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`id`, `nome`, `continente`) VALUES
(1, 'Brasil', 'sul Americano'),
(2, 'Estados unidos ', 'Norte Americano'),
(3, 'Espanha', 'Europeu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE IF NOT EXISTS `uf` (
  `idUf` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text NOT NULL,
  `idPais` int(11) NOT NULL,
  PRIMARY KEY (`idUf`),
  KEY `FK_pais` (`idPais`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `uf`
--

INSERT INTO `uf` (`idUf`, `nome`, `idPais`) VALUES
(1, 'Sao Paulo', 1),
(2, 'Bahia', 1),
(3, 'Mato Grosso', 1),
(4, 'florida', 2),
(5, 'madrid', 3),
(6, 'Havai', 2),
(7, 'Nova Jersey', 2),
(8, 'Barcelona', 3),
(9, 'Malaga', 3);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `FK_cidade_idUf` FOREIGN KEY (`idUf`) REFERENCES `uf` (`idUf`);

--
-- Limitadores para a tabela `uf`
--
ALTER TABLE `uf`
  ADD CONSTRAINT `FK_pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
