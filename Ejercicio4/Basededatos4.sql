-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Cliente` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  `VIP` TINYINT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Tipos_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipos_Polissa` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER4`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Vendedor` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `Num_Polissa` INT NOT NULL,
  `Precio_Anual` VARCHAR(45) NULL,
  `Tipos_Pagamiento` VARCHAR(45) NULL,
  `Fecha_Contractación` VARCHAR(45) NULL,
  `Fecha_Inici_Vigencia` VARCHAR(45) NULL,
  `Fecha_Final_Vigencia` VARCHAR(45) NULL,
  `Cliente_DNI` VARCHAR(9) NOT NULL,
  `Tipos_Polissa_ID` INT NOT NULL,
  `Vendedor_ID` INT NOT NULL,
  PRIMARY KEY (`Num_Polissa`, `Cliente_DNI`, `Tipos_Polissa_ID`, `Vendedor_ID`),
  INDEX `fk_Polissa_Cliente_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipos_Polissa1_idx` (`Tipos_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Vendedor1_idx` (`Vendedor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `MER4`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipos_Polissa1`
    FOREIGN KEY (`Tipos_Polissa_ID`)
    REFERENCES `MER4`.`Tipos_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Vendedor1`
    FOREIGN KEY (`Vendedor_ID`)
    REFERENCES `MER4`.`Vendedor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
