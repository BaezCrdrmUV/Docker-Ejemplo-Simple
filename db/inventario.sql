-- MySQL Script generated by MySQL Workbench
-- Mon Feb 22 23:09:44 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `inventario` ;

-- -----------------------------------------------------
-- Schema inventario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventario` DEFAULT CHARACTER SET utf8mb4 ;
USE `inventario` ;

-- -----------------------------------------------------
-- Table `inventario`.`fabricante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario`.`fabricante` ;

CREATE TABLE IF NOT EXISTS `inventario`.`fabricante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario`.`categorias` ;

CREATE TABLE IF NOT EXISTS `inventario`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventario`.`dispositivos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario`.`dispositivos` ;

CREATE TABLE IF NOT EXISTS `inventario`.`dispositivos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fabricante` INT NOT NULL,
  `lanzamiento` DATETIME NOT NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dispositivos_categorias_idx` (`categoria` ASC) VISIBLE,
  INDEX `fk_dispositivos_fabricante_idx` (`fabricante` ASC) VISIBLE,
  CONSTRAINT `fk_dispositivos_categorias`
    FOREIGN KEY (`categoria`)
    REFERENCES `inventario`.`categorias` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_dispositivos_fabricante`
    FOREIGN KEY (`fabricante`)
    REFERENCES `inventario`.`fabricante` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- SET SQL_MODE = '';
-- DROP USER IF EXISTS admin;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY 'admin';
-- GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `inventario`.`fabricante`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventario`;
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (1, 'Apple');
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (2, 'Microsoft');
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (3, 'Dell');
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (4, 'Samsung');
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (5, 'LG');
INSERT INTO `inventario`.`fabricante` (`id`, `nombre`) VALUES (6, 'Lenovo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventario`.`categorias`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventario`;
INSERT INTO `inventario`.`categorias` (`id`, `nombre`) VALUES (1, 'Laptops');
INSERT INTO `inventario`.`categorias` (`id`, `nombre`) VALUES (2, 'Celulares');
INSERT INTO `inventario`.`categorias` (`id`, `nombre`) VALUES (3, 'Tabletas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventario`.`dispositivos`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventario`;
INSERT INTO `inventario`.`dispositivos` (`id`, `nombre`, `fabricante`, `lanzamiento`, `categoria`) VALUES (1, 'iPhone 12 64 GB', 1, '2020-10-13', 2);
INSERT INTO `inventario`.`dispositivos` (`id`, `nombre`, `fabricante`, `lanzamiento`, `categoria`) VALUES (2, 'Surface Book 2', 2, '2017-11-16', 1);
INSERT INTO `inventario`.`dispositivos` (`id`, `nombre`, `fabricante`, `lanzamiento`, `categoria`) VALUES (3, 'iPad Pro', 1, '2020-03-18', 3);
INSERT INTO `inventario`.`dispositivos` (`id`, `nombre`, `fabricante`, `lanzamiento`, `categoria`) VALUES (4, 'Galaxy Fold', 4, '2019-09-06', 2);

COMMIT;

