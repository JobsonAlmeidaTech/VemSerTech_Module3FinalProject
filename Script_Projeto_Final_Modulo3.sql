-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `locadora` DEFAULT CHARACTER SET utf8mb3 ;
USE `locadora` ;

-- -----------------------------------------------------
-- Table `locadora`.`filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`filial` (
  `id_filial` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NOT NULL,
  `logradouro` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(20) NULL DEFAULT NULL,
  `complemento` VARCHAR(150) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_filial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`cliente` (
  `cpf` VARCHAR(15) NOT NULL,
  `id_filial` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `tipo_habilitacao` VARCHAR(3) NOT NULL,
  `registro_habilitacao` VARCHAR(15) NOT NULL,
  `diretorio_fotos_habilitacao` VARCHAR(1000) NOT NULL,
  `diretorio_foto_cliente` VARCHAR(1000) NOT NULL,
  `diretorio_imagem_assinatura_cliente` VARCHAR(1000) NOT NULL,
  `data_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_cliente_filial1_idx` (`id_filial` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_filial1`
    FOREIGN KEY (`id_filial`)
    REFERENCES `locadora`.`filial` (`id_filial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`combustivel_padrao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`combustivel_padrao` (
  `id_combustivel` SMALLINT NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `preco_unidade` DECIMAL(10,3) NOT NULL,
  PRIMARY KEY (`id_combustivel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`veículo` (
  `placa` VARCHAR(10) NOT NULL,
  `id_filial` INT NOT NULL,
  `tipo` VARCHAR(10) NOT NULL,
  `situação` VARCHAR(10) NOT NULL,
  `grupo` VARCHAR(15) NOT NULL,
  `valor_diaria` DECIMAL(10,2) NOT NULL,
  `porcentagem_acrescimo` DECIMAL(3,2) NOT NULL,
  `fabricante` VARCHAR(50) NOT NULL,
  `modelo` VARCHAR(50) NOT NULL,
  `quilometragem` INT NOT NULL,
  `combustiveis_suportados` VARCHAR(50) NOT NULL,
  `id_combustivel_padrao` SMALLINT NOT NULL,
  `tanque_capacidade_maxima` INT NOT NULL,
  `nivel_maximo_painel` INT NOT NULL,
  `nivel_atual_painel` INT NOT NULL,
  `chassi` VARCHAR(17) NOT NULL,
  `diretorio_fotos_documento_veicular` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`placa`),
  INDEX `fk_Veículo_Filial1_idx` (`id_filial` ASC) VISIBLE,
  INDEX `fk_Veículo_Combustivel_Padrao1_idx` (`id_combustivel_padrao` ASC) VISIBLE,
  CONSTRAINT `fk_Veículo_Combustivel_Padrao1`
    FOREIGN KEY (`id_combustivel_padrao`)
    REFERENCES `locadora`.`combustivel_padrao` (`id_combustivel`),
  CONSTRAINT `fk_Veículo_Filial1`
    FOREIGN KEY (`id_filial`)
    REFERENCES `locadora`.`filial` (`id_filial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`lavagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`lavagem` (
  `id_lavagem` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_lavagem`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`aluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`aluguel` (
  `id_aluguel` INT NOT NULL AUTO_INCREMENT,
  `cpf_cliente` VARCHAR(15) NOT NULL,
  `placa_veiculo` VARCHAR(10) NOT NULL,
  `valor_diaria` DECIMAL(10,2) NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `data_fim` DATETIME NOT NULL,
  `quilometragem_inicial` INT NOT NULL,
  `quilometragem_final` INT NOT NULL,
  `nivel_retirada_painel` INT NOT NULL,
  `nivel_entrega_painel` INT NOT NULL,
  `id_filial_retirada` INT NOT NULL,
  `id_filial_entrega` INT NOT NULL,
  `id_lavagem_contratada` INT NULL DEFAULT NULL,
  `diretorio_fotos_fim_aluguel` VARCHAR(1000) NOT NULL,
  `nome_entregador` VARCHAR(100) NOT NULL,
  `diretorio_imagem_assinatura_entregador` VARCHAR(1000) NOT NULL,
  `danos_fim_aluguel` TINYINT NOT NULL,
  `situacao_aluguel` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_aluguel`),
  INDEX `fk_Aluguel_Cliente1_idx` (`cpf_cliente` ASC) VISIBLE,
  INDEX `fk_Aluguel_Veículo1_idx` (`placa_veiculo` ASC) VISIBLE,
  INDEX `fk_Aluguel_Filial1_idx` (`id_filial_retirada` ASC) VISIBLE,
  INDEX `fk_Aluguel_Filial2_idx` (`id_filial_entrega` ASC) VISIBLE,
  INDEX `fk_aluguel_lavagem1_idx` (`id_lavagem_contratada` ASC) VISIBLE,
  CONSTRAINT `fk_Aluguel_Cliente1`
    FOREIGN KEY (`cpf_cliente`)
    REFERENCES `locadora`.`cliente` (`cpf`),
  CONSTRAINT `fk_Aluguel_Filial1`
    FOREIGN KEY (`id_filial_retirada`)
    REFERENCES `locadora`.`filial` (`id_filial`),
  CONSTRAINT `fk_Aluguel_Filial2`
    FOREIGN KEY (`id_filial_entrega`)
    REFERENCES `locadora`.`filial` (`id_filial`),
  CONSTRAINT `fk_Aluguel_Veículo1`
    FOREIGN KEY (`placa_veiculo`)
    REFERENCES `locadora`.`veículo` (`placa`),
  CONSTRAINT `fk_aluguel_lavagem1`
    FOREIGN KEY (`id_lavagem_contratada`)
    REFERENCES `locadora`.`lavagem` (`id_lavagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`colaborador` (
  `id_colaborador` INT NOT NULL AUTO_INCREMENT,
  `id_filial` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `diretorio_foto_colaborador` VARCHAR(1000) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `departamento` VARCHAR(50) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `endereco` INT NOT NULL,
  `telefone1` BIGINT NOT NULL,
  `telefone2` BIGINT NULL DEFAULT NULL,
  `email_corporativo` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `logradouro` VARCHAR(150) NOT NULL,
  `numero` VARCHAR(20) NULL DEFAULT NULL,
  `complemento` VARCHAR(150) NULL DEFAULT NULL,
  `cep` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  INDEX `fk_Colaborador_Filial_idx` (`id_filial` ASC) VISIBLE,
  CONSTRAINT `fk_Colaborador_Filial`
    FOREIGN KEY (`id_filial`)
    REFERENCES `locadora`.`filial` (`id_filial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`dano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`dano` (
  `id_dano` INT NOT NULL AUTO_INCREMENT,
  `id_aluguel` INT NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `diretorio_fotos_dano` VARCHAR(1000) NOT NULL,
  `valor_conserto` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_dano`),
  INDEX `fk_Danos_Aluguel1_idx` (`id_aluguel` ASC) VISIBLE,
  CONSTRAINT `fk_Danos_Aluguel1`
    FOREIGN KEY (`id_aluguel`)
    REFERENCES `locadora`.`aluguel` (`id_aluguel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `locadora`.`manutencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`manutencao` (
  `placa` VARCHAR(10) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `data_fim` DATETIME NOT NULL,
  `diretorio_fotos_manutencao` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`placa`),
  CONSTRAINT `fk_Manutencao_Veículo1`
    FOREIGN KEY (`placa`)
    REFERENCES `locadora`.`veículo` (`placa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
