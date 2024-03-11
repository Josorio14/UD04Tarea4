-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Pasajeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Pasajeros` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avion` (
  `ID` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Capacidad` VARCHAR(45) NULL,
  `Autonomia` VARCHAR(45) NULL,
  `Fecha_frabricacion` DATE NULL,
  `Fecha_retiro` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vuelo` (
  `ID` INT NOT NULL,
  `Num_vuelo` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  `Destino` VARCHAR(45) NULL,
  `Fecha_salida` DATE NULL,
  `Hora_salida` TIME NULL,
  `Hora_llegada` TIME NULL,
  `Fecha_llegada` DATE NULL,
  `Avion_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Avion_ID`),
  INDEX `fk_Vuelo_Avion1_idx` (`Avion_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avion1`
    FOREIGN KEY (`Avion_ID`)
    REFERENCES `MER6`.`Avion` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reservas` (
  `ID` INT NOT NULL,
  `Fecha_` VARCHAR(45) NULL,
  `Importe` VARCHAR(45) NULL,
  `Num_asiento` VARCHAR(45) NULL,
  `Pasajeros_ID` INT NOT NULL,
  `Vuelo_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Pasajeros_ID`, `Vuelo_ID`),
  INDEX `fk_Reservas_Pasajeros_idx` (`Pasajeros_ID` ASC) VISIBLE,
  INDEX `fk_Reservas_Vuelo1_idx` (`Vuelo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reservas_Pasajeros`
    FOREIGN KEY (`Pasajeros_ID`)
    REFERENCES `MER6`.`Pasajeros` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservas_Vuelo1`
    FOREIGN KEY (`Vuelo_ID`)
    REFERENCES `MER6`.`Vuelo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
