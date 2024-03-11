-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MEREjercicio2c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MEREjercicio2c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MEREjercicio2c` ;
USE `MEREjercicio2c` ;

-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`AsignaturaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`AsignaturaMatricula` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Aula` VARCHAR(45) NULL,
  `Calendario` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`Matricula` (
  `ID` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `Nivel` VARCHAR(45) NULL,
  `Curso` VARCHAR(45) NULL,
  `Grupo` VARCHAR(45) NULL,
  `AsignaturaMatricula_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_AsignaturaMatricula1_idx` (`AsignaturaMatricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_AsignaturaMatricula1`
    FOREIGN KEY (`AsignaturaMatricula_ID`)
    REFERENCES `MEREjercicio2c`.`AsignaturaMatricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`Alumno` (
  `Expediente` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` VARCHAR(9) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Matricula_ID` INT NULL,
  PRIMARY KEY (`Expediente`),
  INDEX `fk_Alumno_Matricula_idx` (`Matricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Alumno_Matricula`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `MEREjercicio2c`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`Profesor` (
  `NIF` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Correo` VARCHAR(45) NULL,
  `Telefono` VARCHAR(9) NULL,
  `Titulacion` VARCHAR(45) NULL,
  `AsignaturaMatricula_ID` INT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Profesor_AsignaturaMatricula1_idx` (`AsignaturaMatricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_AsignaturaMatricula1`
    FOREIGN KEY (`AsignaturaMatricula_ID`)
    REFERENCES `MEREjercicio2c`.`AsignaturaMatricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`Departamento` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `Profesor_NIF` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Departamento_Profesor1_idx` (`Profesor_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Profesor1`
    FOREIGN KEY (`Profesor_NIF`)
    REFERENCES `MEREjercicio2c`.`Profesor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MEREjercicio2c`.`Asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MEREjercicio2c`.`Asignaturas` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Criterios_de_evaluacion` VARCHAR(45) NULL,
  `Objetivos` VARCHAR(45) NULL,
  `AsignaturaMatricula_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Asignaturas_AsignaturaMatricula1_idx` (`AsignaturaMatricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Asignaturas_AsignaturaMatricula1`
    FOREIGN KEY (`AsignaturaMatricula_ID`)
    REFERENCES `MEREjercicio2c`.`AsignaturaMatricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
