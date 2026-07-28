-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db capstone project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db capstone project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db capstone project` DEFAULT CHARACTER SET utf8 ;
USE `db capstone project` ;

-- -----------------------------------------------------
-- Table `db capstone project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Staff` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `GuestName` VARCHAR(255) NULL DEFAULT 'nN',
  `BookingSlot` TIME NULL DEFAULT 0,
  `StaffID` INT NULL DEFAULT 0,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `db capstone project`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`MenuItems` (
  `ItemName` VARCHAR(255) NOT NULL,
  `ItemType` VARCHAR(255) NOT NULL,
  `Price` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  `DrinkName` VARCHAR(255) NOT NULL,
  `ItemID` INT NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Menus` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  `ItemID` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_ItemID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `fk_ItemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `db capstone project`.`MenuItems` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `TableNumber` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_BookingID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `fk_CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `db capstone project`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `db capstone project`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db capstone project`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Address` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NOT NULL,
  `Code` VARCHAR(255) NOT NULL,
  `State` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db capstone project`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db capstone project`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  `AddressID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_OrderID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `fk_AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db capstone project`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `db capstone project`.`Address` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
