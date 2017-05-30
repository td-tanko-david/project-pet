-- -----------------------------------------------------
-- Schema PB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PB` DEFAULT CHARACTER SET utf8 ;
USE `PB` ;

-- -----------------------------------------------------
-- Table `PB`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PB`.`Classes` (
  `class_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `CounterFor` VARCHAR(45) NOT NULL,
  `CounteredBy` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `CounterFor_idx` (`CounterFor` ASC),
  INDEX `CounteredBy_idx` (`CounteredBy` ASC),
  CONSTRAINT `CounterFor`
    FOREIGN KEY (`CounterFor`)
    REFERENCES `PB`.`Classes` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CounteredBy`
    FOREIGN KEY (`CounteredBy`)
    REFERENCES `PB`.`Classes` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PB`.`Abilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PB`.`Abilities` (
  `abi_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `CounterFor` VARCHAR(45) NULL,
  `CounteredBy` VARCHAR(45) NULL,
  PRIMARY KEY (`abi_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `CounterFor_idx` (`CounterFor` ASC),
  INDEX `CounteredBy_idx` (`CounteredBy` ASC),
  CONSTRAINT `CounterFor`
    FOREIGN KEY (`CounterFor`)
    REFERENCES `PB`.`Classes` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CounteredBy`
    FOREIGN KEY (`CounteredBy`)
    REFERENCES `PB`.`Classes` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PB`.`Pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PB`.`Pets` (
  `pet_id` INT NOT NULL,
  `class` VARCHAR(45) NOT NULL,
  `ability` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pet_id`),
  UNIQUE INDEX `class_UNIQUE` (`class` ASC),
  INDEX `ability_idx` (`ability` ASC),
  CONSTRAINT `ability`
    FOREIGN KEY (`ability`)
    REFERENCES `PB`.`Abilities` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `class`
    FOREIGN KEY (`class`)
    REFERENCES `PB`.`Classes` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;