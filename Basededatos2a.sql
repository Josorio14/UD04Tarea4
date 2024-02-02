-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MEREjercicio2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MEREjercicio2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MEREjercicio2a` ;
USE `MEREjercicio2a` ;

-- -----------------------------------------------------
-- Table `MEREjercicio2a`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2a`.`paciente` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefono` INT(9) NULL,
  `Dirrecion` VARCHAR(200) NULL,
  `Nombre_SS` INT(9) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2a`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2a`.`medico` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` INT(9) NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Carrec` VARCHAR(45) NOT NULL,
  `Especialida` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2a`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2a`.`consulta` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Lugar` VARCHAR(45) NULL,
  `Edificio` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NULL,
  `Datos_inicio` DATE NULL,
  `Datos_final` VARCHAR(45) NULL,
  `Diagnostico` VARCHAR(200) NULL,
  `paciente_ID` INT NULL,
  `medico_ID` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
