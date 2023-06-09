-- MySQL Script generated by MySQL Workbench
-- Wed May 24 11:57:45 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cul d´ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cul d´ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul d´ampolla` DEFAULT CHARACTER SET utf8mb4 ;
USE `cul d´ampolla` ;

-- -----------------------------------------------------
-- Table `cul d´ampolla`.`venedors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`venedors` (
  `idVenedors` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Data Contracte` DATE NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVenedors`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`clients/tes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`clients/tes` (
  `id_Cliente` INT(5) NOT NULL AUTO_INCREMENT,
  `id_Ulleres` INT(5) NOT NULL,
  `Nom` VARCHAR(35) NOT NULL,
  `Adreça_Postal` TEXT NULL DEFAULT NULL,
  `Teléfon` INT(15) NOT NULL,
  `Correu_Electrónic` VARCHAR(50) NULL DEFAULT NULL,
  `Data_Registre` DATE NOT NULL,
  `Recomanat` VARCHAR(35) NULL DEFAULT NULL,
  `Venedor_id` INT(11) NULL DEFAULT NULL,
  `venedors_idVenedors` INT(11) NOT NULL,
  `venedors_ventas_idVentas` INT(11) NOT NULL,
  `venedors_ventas_idVentas1` INT(11) NOT NULL,
  `venedors_ventas_clients/tes_id_Cliente` INT(5) NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  INDEX `id_Ulleres` (`id_Ulleres` ASC) ,
  INDEX `fk_clients/tes_venedors1_idx` (`venedors_idVenedors` ASC, `venedors_ventas_idVentas` ASC, `venedors_ventas_idVentas1` ASC, `venedors_ventas_clients/tes_id_Cliente` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`proveïdor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`proveïdor` (
  `id_proveídor` INT(5) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(75) NOT NULL,
  `Adreça` VARCHAR(255) NULL DEFAULT NULL,
  `Telèfon` INT(15) NOT NULL,
  `Fax` INT(15) NULL DEFAULT NULL,
  `NIF` VARCHAR(20) NOT NULL,
  `marca_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proveídor`),
  UNIQUE INDEX `NIF` (`NIF` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`marca` (
  `idMarca` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `proveïdor_id` INT(11) NULL DEFAULT NULL,
  `proveïdor_id_proveídor` INT(5) NOT NULL,
  PRIMARY KEY (`idMarca`),
  INDEX `fk_marca_proveïdor1_idx` (`proveïdor_id_proveídor` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`Compra/Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`Compra/Venta` (
  `idVentas` INT(11) NOT NULL AUTO_INCREMENT,
  `Venedor_id` INT(11) NULL DEFAULT NULL,
  `Ulleres_id` VARCHAR(45) NULL DEFAULT NULL,
  `DataVenta` DATE NOT NULL,
  `clients/tes_id_Cliente` INT(5) NOT NULL,
  `venedors_idVenedors` INT(11) NOT NULL,
  `clients/tes_id_Cliente1` INT(5) NOT NULL,
  PRIMARY KEY (`idVentas`, `clients/tes_id_Cliente`),
  INDEX `fk_Compra/Venta_venedors1_idx` (`venedors_idVenedors` ASC) ,
  INDEX `fk_Compra/Venta_clients/tes1_idx` (`clients/tes_id_Cliente1` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`ulleres` (
  ` marca_id` INT(11) NULL DEFAULT NULL,
  `Graduación` FLOAT NULL DEFAULT NULL,
  `TipoMontura` VARCHAR(25) NOT NULL COMMENT 'Los tipos de montura deben ser:\\nPlástico\\nMetal\\nFlotante',
  `Color Vidrio` VARCHAR(15) NOT NULL,
  `Preu` FLOAT NOT NULL,
  `marca_idMarca` INT(11) NOT NULL,
  `marca_idMarca1` INT(11) NOT NULL,
  `Compra/Venta_idVentas` INT(11) NOT NULL,
  `Compra/Venta_clients/tes_id_Cliente` INT(5) NOT NULL,
  PRIMARY KEY (`marca_idMarca`),
  INDEX `fk_ulleres_marca1_idx` (`marca_idMarca1` ASC) ,
  INDEX `fk_ulleres_Compra/Venta1_idx` (`Compra/Venta_idVentas` ASC, `Compra/Venta_clients/tes_id_Cliente` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `cul d´ampolla`.`tipus de montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul d´ampolla`.`tipus de montura` (
  `TipusMontura_id` INT(11) NOT NULL AUTO_INCREMENT,
  `idTipus de Montura` VARCHAR(45) NULL DEFAULT NULL,
  `Nom Montura` VARCHAR(45) NULL DEFAULT NULL,
  `ulleres_marca_idMarca` INT(11) NOT NULL,
  PRIMARY KEY (`TipusMontura_id`),
  INDEX `fk_tipus de montura_ulleres1_idx` (`ulleres_marca_idMarca` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
