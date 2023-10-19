-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8 ;
USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`games` (
  `IdGames` INT UNSIGNED NOT NULL,
  `Overwatch` VARCHAR(45) NOT NULL,
  `Call of Duty` VARCHAR(45) NOT NULL,
  `Marvel` VARCHAR(45) NOT NULL,
  `Mortal Combat` VARCHAR(45) NULL,
  PRIMARY KEY (`IdGames`),
  UNIQUE INDEX `IdGames_UNIQUE` (`IdGames` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`game2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`game2` (
  `IdAchievements` INT UNSIGNED NOT NULL,
  `hanzo 5 player kill streak` VARCHAR(45) NOT NULL,
  `2 headshot in one` VARCHAR(45) NOT NULL,
  `defeat the ememy with all the characters` VARCHAR(45) NOT NULL,
  `win 100 matches` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAchievements`),
  UNIQUE INDEX `IdGame_UNIQUE` (`IdAchievements` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer` (
  `IdAchievements complete` INT UNSIGNED NOT NULL,
  `achievement 5 kills` VARCHAR(45) NOT NULL,
  `achievement 2 headshots` VARCHAR(45) NOT NULL,
  `achievement all heroes` VARCHAR(45) NOT NULL,
  `achievement win matches` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAchievements complete`),
  UNIQUE INDEX `IdGamer_UNIQUE` (`IdAchievements complete` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`games_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`games_has_game` (
  `games_IdGames` INT UNSIGNED NOT NULL,
  `game_IdAchievements` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`games_IdGames`, `game_IdAchievements`),
  INDEX `fk_games_has_game_game1_idx` (`game_IdAchievements` ASC) VISIBLE,
  INDEX `fk_games_has_game_games_idx` (`games_IdGames` ASC) VISIBLE,
  CONSTRAINT `fk_games_has_game_games`
    FOREIGN KEY (`games_IdGames`)
    REFERENCES `gameraccount`.`games` (`IdGames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_game_game1`
    FOREIGN KEY (`game_IdAchievements`)
    REFERENCES `gameraccount`.`game2` (`IdAchievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamer_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gamer_has_game` (
  `gamer_IdAchievements complete` INT UNSIGNED NOT NULL,
  `game_IdAchievements` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`gamer_IdAchievements complete`, `game_IdAchievements`),
  INDEX `fk_gamer_has_game_game1_idx` (`game_IdAchievements` ASC) VISIBLE,
  INDEX `fk_gamer_has_game_gamer1_idx` (`gamer_IdAchievements complete` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_game_gamer1`
    FOREIGN KEY (`gamer_IdAchievements complete`)
    REFERENCES `gameraccount`.`gamer` (`IdAchievements complete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_game_game1`
    FOREIGN KEY (`game_IdAchievements`)
    REFERENCES `gameraccount`.`game2` (`IdAchievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
