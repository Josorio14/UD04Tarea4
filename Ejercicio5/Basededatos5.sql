-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CLIENT` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Dir` VARCHAR(45) NULL,
  `Municipi` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `User` VARCHAR(45) NULL,
  `PWD` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`TIPUS_VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`TIPUS_VEHICLE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`VEHICLE` (
  `Num_bastidor` VARCHAR(20) NOT NULL,
  `Matricula` VARCHAR(10) NULL,
  `Model` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Any_matriculacio` VARCHAR(45) NULL,
  `TIPUS_VEHICLE_ID` INT NOT NULL,
  PRIMARY KEY (`Num_bastidor`),
  INDEX `fk_VEHICLE_TIPUS_VEHICLE1_idx` (`TIPUS_VEHICLE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_TIPUS_VEHICLE1`
    FOREIGN KEY (`TIPUS_VEHICLE_ID`)
    REFERENCES `MER5`.`TIPUS_VEHICLE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`CLIENT_VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CLIENT_VEHICLE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Any_compra` VARCHAR(45) NULL,
  `Any_venta` VARCHAR(45) NULL,
  `Data_darrera_revisio` VARCHAR(45) NULL,
  `CLIENT_DNI` VARCHAR(9) NOT NULL,
  `VEHICLE_Num_bastidor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CLIENT_VEHICLE_CLIENT_idx` (`CLIENT_DNI` ASC) VISIBLE,
  INDEX `fk_CLIENT_VEHICLE_VEHICLE1_idx` (`VEHICLE_Num_bastidor` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENT_VEHICLE_CLIENT`
    FOREIGN KEY (`CLIENT_DNI`)
    REFERENCES `MER5`.`CLIENT` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENT_VEHICLE_VEHICLE1`
    FOREIGN KEY (`VEHICLE_Num_bastidor`)
    REFERENCES `MER5`.`VEHICLE` (`Num_bastidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`CITA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`CITA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NULL,
  `Lloc` VARCHAR(100) NULL,
  `CLIENT_VEHICLE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CITA_CLIENT_VEHICLE1_idx` (`CLIENT_VEHICLE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CITA_CLIENT_VEHICLE1`
    FOREIGN KEY (`CLIENT_VEHICLE_ID`)
    REFERENCES `MER5`.`CLIENT_VEHICLE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
