CREATE TABLE IF NOT EXISTS `Cliente` (
	`id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100),
	`cpf_cnpj` varchar(20) UNIQUE,
	`telefone` varchar(20),
	`email` varchar(100) NOT NULL,
	`endereço` varchar(200) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Caminhao` (
	`placa` varchar(8) NOT NULL,
	`modelo` varchar(50),
	`ano_fabricacao` int,
	`capacidade_kg` decimal(10,2),
	`status` varchar(20),
	PRIMARY KEY (`placa`)
);

CREATE TABLE IF NOT EXISTS `Motorista` (
	`id` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100),
	`cnh` varchar(15) UNIQUE,
	`telefone` varchar(20),
	`validade_cnh` date,
	`status` varchar(20),
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Frete` (
	`id` int AUTO_INCREMENT NOT NULL,
	`cliente_id` int,
	`motorista_id` int NOT NULL,
	`caminhao_placa` varchar(8),
	`data_saida` datetime,
	`data_entrega` datetime NOT NULL,
	`valor` decimal(10,2),
	`status` varchar(20),
	`observacoes` text NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Rota` (
	`id` int AUTO_INCREMENT NOT NULL,
	`frete_id` int,
	`origem` varchar(100),
	`destino` varchar(100),
	`distancia_km` int NOT NULL,
	PRIMARY KEY (`id`)
);




ALTER TABLE `Frete` ADD CONSTRAINT `Frete_fk1` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente`(`id`);

ALTER TABLE `Frete` ADD CONSTRAINT `Frete_fk2` FOREIGN KEY (`motorista_id`) REFERENCES `Motorista`(`id`);

ALTER TABLE `Frete` ADD CONSTRAINT `Frete_fk3` FOREIGN KEY (`caminhao_placa`) REFERENCES `Caminhao`(`placa`);
ALTER TABLE `Rota` ADD CONSTRAINT `Rota_fk1` FOREIGN KEY (`frete_id`) REFERENCES `Frete`(`id`);