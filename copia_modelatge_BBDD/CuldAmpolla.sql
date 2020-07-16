-- MySQL Workbench Synchronization
-- Generated: 2020-07-15 11:29
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Jojotrezz

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Supplier` (
  `id_supplier` VARCHAR(45) NOT NULL COMMENT 'Holds the supplier name',
  `sup_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the supplier name',
  `sup_nif` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the supplier nif',
  PRIMARY KEY (`id_supplier`),
  INDEX `name` (`sup_name` ASC),
  INDEX `NIF` (`sup_nif` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Glasses` (
  `id_glasses` VARCHAR(45) NOT NULL COMMENT 'Holds the glasses identifier',
  `id_brand` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the glasses brand',
  `prescription` INT(11) NULL DEFAULT NULL COMMENT 'Holds the glasses prescription',
  `frame` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Holds the glasses type of frame, possible values:\nF= Floating\nP= Plastic\nM= Metalic',
  `frame_colour` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the frame colour',
  `lens_colour` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the lens colour',
  `price` DECIMAL NULL DEFAULT NULL COMMENT 'Holds the price of the glasses',
  PRIMARY KEY (`id_glasses`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Customer` (
  `cust_name` VARCHAR(55) NOT NULL COMMENT 'Holds the customer name',
  `cust_email` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Holds the customer email',
  `date_registered` DATETIME NULL DEFAULT NULL COMMENT 'Holds the register date of the customer',
  `recommended` VARCHAR(55) NULL DEFAULT NULL COMMENT 'Holds the name of the person who recommended our stablishment to the customer',
  PRIMARY KEY (`cust_name`),
  INDEX `idx_name` (`cust_name` ASC),
  INDEX `idx_email` (`cust_email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Address` (
  `id_address` INT(11) NOT NULL,
  `street` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Holds the street name',
  `number` INT(11) NULL DEFAULT NULL COMMENT 'Holds the number, locationwise',
  `floor` INT(11) NULL DEFAULT NULL COMMENT 'Holds the floor number',
  `door` INT(11) NULL DEFAULT NULL COMMENT 'Holds the door number',
  `zip` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Holds the zip code',
  `city` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds the city',
  `country` VARCHAR(2) NULL DEFAULT NULL COMMENT 'Holds the country',
  `phone` INT(11) NULL DEFAULT NULL COMMENT 'Holds the supplier or customer phone number',
  `fax` INT(11) NULL DEFAULT NULL COMMENT 'Holds the supplier fax number',
  PRIMARY KEY (`id_address`),
  INDEX `idx_zip` (`zip` ASC),
  INDEX `idx_city` (`city` ASC),
  INDEX `idx_country` (`country` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Employee` (
  `empl_name` VARCHAR(55) NOT NULL COMMENT 'Holds the employee name',
  PRIMARY KEY (`empl_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Sale` (
  `Customer_cust_name` VARCHAR(55) NOT NULL,
  `Employee_empl_name` VARCHAR(55) NOT NULL,
  `Glasses_id_glasses` VARCHAR(45) NOT NULL,
  INDEX `fk_Sale_Customer1_idx` (`Customer_cust_name` ASC),
  INDEX `fk_Sale_Employee1_idx` (`Employee_empl_name` ASC),
  INDEX `fk_Sale_Glasses1_idx` (`Glasses_id_glasses` ASC),
  CONSTRAINT `fk_Sale_Customer1`
    FOREIGN KEY (`Customer_cust_name`)
    REFERENCES `culd'ampolla`.`Customer` (`cust_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Employee1`
    FOREIGN KEY (`Employee_empl_name`)
    REFERENCES `culd'ampolla`.`Employee` (`empl_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Glasses1`
    FOREIGN KEY (`Glasses_id_glasses`)
    REFERENCES `culd'ampolla`.`Glasses` (`id_glasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Glasses_have_suppliers` (
  `Supplier_id_supplier` VARCHAR(45) NOT NULL,
  `Glasses_id_glasses` VARCHAR(45) NOT NULL,
  INDEX `fk_Glasses have suppliers_Supplier_idx` (`Supplier_id_supplier` ASC),
  INDEX `fk_Glasses_have_suppliers_Glasses1_idx` (`Glasses_id_glasses` ASC),
  CONSTRAINT `fk_Glasses have suppliers_Supplier`
    FOREIGN KEY (`Supplier_id_supplier`)
    REFERENCES `culd'ampolla`.`Supplier` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_have_suppliers_Glasses1`
    FOREIGN KEY (`Glasses_id_glasses`)
    REFERENCES `culd'ampolla`.`Glasses` (`id_glasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Supplier_has_address` (
  `id_supplier_has_address` INT(11) NOT NULL,
  `Supplier_id_supplier` VARCHAR(45) NOT NULL,
  `Address_id_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_supplier_has_address`, `Supplier_id_supplier`),
  INDEX `fk_Supplier_has_address_Supplier1_idx` (`Supplier_id_supplier` ASC),
  INDEX `fk_Supplier_has_address_Address1_idx` (`Address_id_address` ASC),
  CONSTRAINT `fk_Supplier_has_address_Supplier1`
    FOREIGN KEY (`Supplier_id_supplier`)
    REFERENCES `culd'ampolla`.`Supplier` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_has_address_Address1`
    FOREIGN KEY (`Address_id_address`)
    REFERENCES `culd'ampolla`.`Address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `culd'ampolla`.`Customer_has_address` (
  `id_customer_has_address` INT(11) NOT NULL,
  `Customer_cust_name` VARCHAR(55) NOT NULL,
  `Address_id_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_customer_has_address`, `Customer_cust_name`),
  INDEX `fk_Customer_has_address_Customer1_idx` (`Customer_cust_name` ASC),
  INDEX `fk_Customer_has_address_Address1_idx` (`Address_id_address` ASC),
  CONSTRAINT `fk_Customer_has_address_Customer1`
    FOREIGN KEY (`Customer_cust_name`)
    REFERENCES `culd'ampolla`.`Customer` (`cust_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_address_Address1`
    FOREIGN KEY (`Address_id_address`)
    REFERENCES `culd'ampolla`.`Address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
