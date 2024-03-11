-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER7` ;
USE `MER7` ;

-- -----------------------------------------------------
-- Table `MER7`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Cliente` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Empleado` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Ticket` (
  `Num` INT NOT NULL,
  `Num_factura` VARCHAR(45) NULL,
  `Nombre_empresa` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `Domicilio_fiscal` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  `Web` VARCHAR(45) NULL,
  `Fecha` VARCHAR(45) NULL,
  `Forma_pago` VARCHAR(45) NULL,
  `Cliente_ID` INT NOT NULL,
  `Empleado_ID` INT NOT NULL,
  PRIMARY KEY (`Num`, `Cliente_ID`, `Empleado_ID`),
  INDEX `fk_Ticket_Cliente1_idx` (`Cliente_ID` ASC) VISIBLE,
  INDEX `fk_Ticket_Empleado1_idx` (`Empleado_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Cliente1`
    FOREIGN KEY (`Cliente_ID`)
    REFERENCES `MER7`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Empleado1`
    FOREIGN KEY (`Empleado_ID`)
    REFERENCES `MER7`.`Empleado` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Producto` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `Precio_Unitario` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Linia_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Linia_ticket` (
  `ID` INT NOT NULL,
  `Cantidad` INT NULL,
  `Descuento` VARCHAR(45) NULL,
  `Producto_ID` INT NOT NULL,
  `Ticket_Num` INT NOT NULL,
  PRIMARY KEY (`ID`, `Producto_ID`, `Ticket_Num`),
  INDEX `fk_Linia_ticket_Producto_idx` (`Producto_ID` ASC) VISIBLE,
  INDEX `fk_Linia_ticket_Ticket1_idx` (`Ticket_Num` ASC) VISIBLE,
  CONSTRAINT `fk_Linia_ticket_Producto`
    FOREIGN KEY (`Producto_ID`)
    REFERENCES `MER7`.`Producto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linia_ticket_Ticket1`
    FOREIGN KEY (`Ticket_Num`)
    REFERENCES `MER7`.`Ticket` (`Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
