

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema researchers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema researchers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `researchers` DEFAULT CHARACTER SET utf-8 COLLATE latin1_swedish_ci ;
USE `researchers` ;

-- -----------------------------------------------------
-- Table `researchers`.`collaborators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`collaborators` (
 `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `project` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`grants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`grants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `duration` INT NULL DEFAULT NULL,
  `project` VARCHAR(45) NULL DEFAULT NULL,
  `research` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf-8 COLLATE = latin1_swedish_ci;

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`project` (
 `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `duration` INT NULL DEFAULT NULL,
  `nature` VARCHAR(45) NULL DEFAULT NULL,
  `purpose` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`researcher's`
-- -----------------------------------------------------

  CREATE TABLE IF NOT EXISTS `researchers`.`researchers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `qualifications` VARCHAR(45) NULL DEFAULT NULL,
  `researcharea` VARCHAR(45) NULL DEFAULT NULL,
  `theme` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf-8 COLLATE = latin1_swedish_ci;
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`collaborators_has_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`collaborators_has_project` (
 `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`collaborators_id`, `project_id`),
  INDEX `fk_collaborators_has_project_project1_idx` (`project_id` ASC) VISIBLE,
  INDEX `fk_collaborators_has_project_collaborators_idx` (`collaborators_id` ASC) VISIBLE,
  CONSTRAINT `fk_collaborators_has_project_collaborators`
    FOREIGN KEY (`collaborators_id`)
    REFERENCES `researchers`.`collaborators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collaborators_has_project_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `researchers`.`project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`collaborators_has_grants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`collaborators_has_grants` (
  `collaborators_id` INT NOT NULL,
  `grants_id` INT NOT NULL,
  PRIMARY KEY (`collaborators_id`, `grants_id`),
  INDEX `fk_collaborators_has_grants_grants1_idx` (`grants_id` ASC) VISIBLE,
  INDEX `fk_collaborators_has_grants_collaborators1_idx` (`collaborators_id` ASC) VISIBLE,
  CONSTRAINT `fk_collaborators_has_grants_collaborators1`
    FOREIGN KEY (`collaborators_id`)
    REFERENCES `researchers`.`collaborators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collaborators_has_grants_grants1`
    FOREIGN KEY (`grants_id`)
    REFERENCES `researchers`.`grants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `researchers`.`collaborators_has_researcher's`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `researchers`.`collaborators_has_researcher's` (
  `collaborators_id` INT NOT NULL,
  `researcher's_id` INT NOT NULL,
  PRIMARY KEY (`collaborators_id`, `researcher's_id`),
  INDEX `fk_collaborators_has_researcher's_researcher's1_idx` (`researcher's_id` ASC) VISIBLE,
  INDEX `fk_collaborators_has_researcher's_collaborators1_idx` (`collaborators_id` ASC) VISIBLE,
  CONSTRAINT `fk_collaborators_has_researcher's_collaborators1`
    FOREIGN KEY (`collaborators_id`)
    REFERENCES `researchers`.`collaborators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collaborators_has_researcher's_researcher's1`
    FOREIGN KEY (`researcher's_id`)
    REFERENCES `researchers`.`researcher's` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf-8
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
