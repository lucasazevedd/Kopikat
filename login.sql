-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 17/05/2024 às 17:42
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `login`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id_cadastro` int(11) NOT NULL,
  `nome_completo` varchar(100) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cadastro`
--

INSERT INTO `cadastro` (`id_cadastro`, `nome_completo`, `cpf`, `email`, `senha`) VALUES
(8, 'Joao Pereira', '111.222.333-44', 'joao.silva@example.com', 'senhajoao123'),
(9, 'Maria Oliveira', '456.897.777-88', 'maria.oliveira@example.com', 'senhamaria123'),
(10, 'Pedro Souza', '774.234.875-98', 'pedro.souza@example.com', 'senhapedro123'),
(11, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(12, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(13, 'Beko', '123.456.789-01', 'lucasazevedd@hotmail.com', 'beko123'),
(14, 'Raicone', '456.789.091-21', 'lucasazevedd@hotmail.com', 'beko123'),
(15, 'Gabriel Viana', '323.232.323-23', 'gabriel@gmail.com', 'beko123'),
(16, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(17, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(18, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(19, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(20, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(21, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(22, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(23, 'Douglas', '566.666.666-66', 'lucasazevedd@hotmail.com', 'beko123'),
(24, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(25, 'Maluco no pedaço', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(26, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(27, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'BEKO123'),
(28, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'BEKO123'),
(29, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(30, 'Lucas Israel de Azevedo', '071.049.343-67', 'lucasazevedd@hotmail.com', 'beko123'),
(31, 'Gabriel Viana', '987.654.433-22', 'lucasazevedd@hotmail.com', 'beko123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `asinante_sim/nao` varchar(3) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `forma_pagamento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_usuario`, `asinante_sim/nao`, `valor`, `data_pagamento`, `forma_pagamento`) VALUES
(9, NULL, 'sim', 100.00, '2024-04-01', 'Cartão de Crédito'),
(10, NULL, 'nao', 75.50, '2024-04-02', 'Boleto Bancário'),
(11, NULL, 'sim', 150.00, '2024-04-03', 'Débito');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receba_novidades`
--

CREATE TABLE `receba_novidades` (
  `id_novidades` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `receba_novidades`
--

INSERT INTO `receba_novidades` (`id_novidades`, `email`, `celular`, `nome`) VALUES
(3, 'lucasazevedd@hotmail.com', '(98) 98344-5700', 'Lucas Israel de Azevedo'),
(4, 'gabriel@gmail.com', '(01) 98410-9274', 'Gabriel Viana');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `telefone_secundario` varchar(15) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero_residencia` varchar(9) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_cadastro`, `telefone`, `telefone_secundario`, `cep`, `endereco`, `numero_residencia`, `complemento`, `bairro`, `cidade`, `estado`) VALUES
(8, 8, '5551234567', '5559876543', '01153-000', 'Rua A', '8', 'Casa de dois andar', 'Moema', 'SP', 'Maranhão'),
(9, 9, '5552345678', '5558765432', '20511-130', 'Av. B', '12', 'prx ao bar da rosa', 'Bota Fogo', 'RJ', 'Maranhão'),
(10, 10, '5553456789', '5557654321', '82930-080', 'Av. C', '54', 'Bloco 3', 'Cajuru', 'PR', 'Maranhão'),
(11, 30, '(98) 98344-5700', '(98) 12345-6789', '12491-827', 'salada', '9', '', 'Barreto', 'salada', 'AL'),
(12, 31, '(98) 12345-6789', '(98) 12345-6789', '65060-641', 'salada', '9', 'askbjas', 'angleim', ',amscn,', 'AC');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id_cadastro`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Índices de tabela `receba_novidades`
--
ALTER TABLE `receba_novidades`
  ADD PRIMARY KEY (`id_novidades`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cadastro_idx` (`id_cadastro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id_cadastro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `receba_novidades`
--
ALTER TABLE `receba_novidades`
  MODIFY `id_novidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `id_cadastro` FOREIGN KEY (`id_cadastro`) REFERENCES `cadastro` (`id_cadastro`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
