-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29-Maio-2024 às 10:02
-- Versão do servidor: 8.0.36-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.17

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
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id_cadastro` int NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `cadastro`
--

INSERT INTO `cadastro` (`id_cadastro`, `nome_completo`, `cpf`, `email`, `senha`) VALUES
(8, 'Joao Pereira', '111.222.333-44', 'joao.silva@example.com', 'senhajoao123'),
(9, 'Maria Oliveira', '456.897.777-88', 'maria.oliveira@example.com', 'senhamaria123'),
(10, 'Pedro Souza', '774.234.875-98', 'pedro.souza@example.com', 'senhapedro123'),
(33, 'Jhonnathan Pinheiro do Nascimento', '607.111.232-23', 'jhon250603@gmail.com', 'Jhon245');

--
-- Acionadores `cadastro`
--
DELIMITER $$
CREATE TRIGGER `insert_cadastro` AFTER INSERT ON `cadastro` FOR EACH ROW BEGIN
    INSERT INTO log_cadastro (id_cadastro, nome_completo, cpf, email, senha, data_insercao, tipo_operacao)
    VALUES (NEW.id_cadastro, NEW.nome_completo, NEW.cpf, NEW.email, NEW.senha, NOW(), 'I');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_cadastro`
--

CREATE TABLE `log_cadastro` (
  `id` int NOT NULL,
  `id_cadastro` int NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `data_insercao` timestamp NULL DEFAULT NULL,
  `tipo_operacao` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `log_cadastro`
--

INSERT INTO `log_cadastro` (`id`, `id_cadastro`, `nome_completo`, `cpf`, `email`, `senha`, `data_insercao`, `tipo_operacao`) VALUES
(1, 33, 'Jhonnathan Pinheiro do Nascimento', '607.111.232-23', 'jhon250603@gmail.com', 'Jhon245', '2024-05-29 12:48:02', 'I');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_usuario`
--

CREATE TABLE `log_usuario` (
  `id_log` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_cadastro` int NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `telefone_secundario` varchar(15) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero_residencia` varchar(9) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `data_insercao` timestamp NULL DEFAULT NULL,
  `tipo_operacao` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `log_usuario`
--

INSERT INTO `log_usuario` (`id_log`, `id_usuario`, `id_cadastro`, `telefone`, `telefone_secundario`, `cep`, `endereco`, `numero_residencia`, `complemento`, `bairro`, `cidade`, `estado`, `data_insercao`, `tipo_operacao`) VALUES
(1, 14, 33, '(98) 99621-6000', '(98) 99171-9132', '65130-000', 'av da Laranja', '06', 'q2', 'Lima Verde', 'Paço do Lumiar', 'MA', '2024-05-29 12:48:02', 'I');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `asinante_sim/nao` varchar(3) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `forma_pagamento` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_usuario`, `asinante_sim/nao`, `valor`, `data_pagamento`, `forma_pagamento`) VALUES
(9, NULL, 'sim', '100.00', '2024-04-01', 'Cartão de Crédito'),
(10, NULL, 'nao', '75.50', '2024-04-02', 'Boleto Bancário'),
(11, NULL, 'sim', '150.00', '2024-04-03', 'Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receba_novidades`
--

CREATE TABLE `receba_novidades` (
  `id_novidades` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `receba_novidades`
--

INSERT INTO `receba_novidades` (`id_novidades`, `email`, `celular`, `nome`) VALUES
(3, 'lucasazevedd@hotmail.com', '(98) 98344-5700', 'Lucas Israel de Azevedo'),
(4, 'gabriel@gmail.com', '(01) 98410-9274', 'Gabriel Viana'),
(5, 'allyson65@gmail.com', '(98) 96216-0000', 'Allyson Bovea');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `id_cadastro` int DEFAULT NULL,
  `telefone` varchar(15) NOT NULL,
  `telefone_secundario` varchar(15) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero_residencia` varchar(9) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_cadastro`, `telefone`, `telefone_secundario`, `cep`, `endereco`, `numero_residencia`, `complemento`, `bairro`, `cidade`, `estado`) VALUES
(8, 8, '5551234567', '5559876543', '01153-000', 'Rua A', '8', 'Casa de dois andar', 'Moema', 'SP', 'Maranhão'),
(9, 9, '5552345678', '5558765432', '20511-130', 'Av. B', '12', 'prx ao bar da rosa', 'Bota Fogo', 'RJ', 'Maranhão'),
(10, 10, '5553456789', '5557654321', '82930-080', 'Av. C', '54', 'Bloco 3', 'Cajuru', 'PR', 'Maranhão'),
(14, 33, '(98) 99621-6000', '(98) 99171-9132', '65130-000', 'av da Laranja', '06', 'q2', 'Lima Verde', 'Paço do Lumiar', 'MA');

--
-- Acionadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `insert_usuario` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN

INSERT INTO log_usuario (id_usuario, id_cadastro, telefone, telefone_secundario, cep, endereco, numero_residencia, complemento, bairro, cidade, estado, data_insercao, tipo_operacao)

VALUES (NEW.id_usuario, NEW.id_cadastro, NEW.telefone, NEW.telefone_secundario, NEW.cep, NEW.endereco, NEW.numero_residencia, NEW.complemento, NEW.bairro, NEW.cidade, NEW.estado, NOW(), 'I');

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_usuario_cadastro`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_usuario_cadastro` (
`id_cadastro` int
,`nome_completo` varchar(100)
,`cpf` varchar(14)
,`email` varchar(45)
,`telefone` varchar(15)
,`telefone_secundario` varchar(15)
,`cep` varchar(9)
,`endereco` varchar(100)
,`numero_residencia` varchar(9)
,`complemento` varchar(20)
,`bairro` varchar(45)
,`cidade` varchar(45)
,`estado` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_usuario_cadastro`
--
DROP TABLE IF EXISTS `vw_usuario_cadastro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jhon`@`localhost` SQL SECURITY DEFINER VIEW `vw_usuario_cadastro`  AS SELECT `c`.`id_cadastro` AS `id_cadastro`, `c`.`nome_completo` AS `nome_completo`, `c`.`cpf` AS `cpf`, `c`.`email` AS `email`, `u`.`telefone` AS `telefone`, `u`.`telefone_secundario` AS `telefone_secundario`, `u`.`cep` AS `cep`, `u`.`endereco` AS `endereco`, `u`.`numero_residencia` AS `numero_residencia`, `u`.`complemento` AS `complemento`, `u`.`bairro` AS `bairro`, `u`.`cidade` AS `cidade`, `u`.`estado` AS `estado` FROM (`cadastro` `c` join `usuario` `u`) WHERE (`c`.`id_cadastro` = `u`.`id_cadastro`) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id_cadastro`);

--
-- Índices para tabela `log_cadastro`
--
ALTER TABLE `log_cadastro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD PRIMARY KEY (`id_log`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Índices para tabela `receba_novidades`
--
ALTER TABLE `receba_novidades`
  ADD PRIMARY KEY (`id_novidades`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cadastro_idx` (`id_cadastro`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id_cadastro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `log_cadastro`
--
ALTER TABLE `log_cadastro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `receba_novidades`
--
ALTER TABLE `receba_novidades`
  MODIFY `id_novidades` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
