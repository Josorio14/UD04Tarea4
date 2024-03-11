-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MEREjercicio2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MEREjercicio2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MEREjercicio2b` ;
USE `MEREjercicio2b` ;

-- -----------------------------------------------------
-- Table `MEREjercicio2b`.`cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2b`.`cine` (
  `ID  NIF` INT(9) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `Numero_de_salas` VARCHAR(45) NULL,
  `Horario` VARCHAR(45) NULL,
  `Poblacion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`ID  NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2b`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2b`.`peliculas` (
  `id ISBN` INT(20) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor_secundario` VARCHAR(45) NULL,
  PRIMARY KEY (`id ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2b`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2b`.`tarifa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2b`.`proyecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2b`.`proyecciones` (
  `ID` INT NOT NULL,
  `Sala` VARCHAR(45) NULL,
  `Hora_inicio` TIME NULL,
  `Hora_final` TIME NULL,
  `cine_id NIF` INT(9) NULL,
  `tarifa_ID` INT NULL,
  `peliculas_id ISBN` INT(20) NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_proyecciones_cine_idx` (`cine_id NIF` ASC) VISIBLE,
  INDEX `fk_proyecciones_tarifa1_idx` (`tarifa_ID` ASC) VISIBLE,
  INDEX `fk_proyecciones_peliculas1_idx` (`peliculas_id ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_proyecciones_cine`
    FOREIGN KEY (`cine_id NIF`)
    REFERENCES `MEREjercicio2b`.`cine` (`ID  NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyecciones_tarifa1`
    FOREIGN KEY (`tarifa_ID`)
    REFERENCES `MEREjercicio2b`.`tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyecciones_peliculas1`
    FOREIGN KEY (`peliculas_id ISBN`)
    REFERENCES `MEREjercicio2b`.`peliculas` (`id ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
