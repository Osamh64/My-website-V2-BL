-- تعيين قيم مؤقتة لإعدادات التحقق من الفريدة والمفاتيح الخارجية
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- إنشاء نطاق قاعدة البيانات إذا لم يكن موجودًا بالفعل واستخدامه كنطاق حالي
CREATE SCHEMA IF NOT EXISTS `database` DEFAULT CHARACTER SET utf8mb4;
USE `database`;

-- إنشاء جدول "reader" إذا لم يكن موجودًا بالفعل لتخزين بيانات القراء
CREATE TABLE IF NOT EXISTS `database`.`reader` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `followers` INT(11) NOT NULL,
  `stories read` INT(11) NOT NULL,
  `Comments and Likes` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- إنشاء جدول "writer" إذا لم يكن موجودًا بالفعل لتخزين بيانات الكُتّاب
CREATE TABLE IF NOT EXISTS `database`.`writer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Follower` INT(11) NOT NULL,
  `Stories` INT(11) NOT NULL,
  `support` INT(11) NOT NULL,
  `language` INT(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- إنشاء جدول "stories" إذا لم يكن موجودًا بالفعل لتخزين بيانات القصص
CREATE TABLE IF NOT EXISTS `database`.`stories` (
  `id Writer` TINYINT(4) NOT NULL,
  `Stories` INT(11) NOT NULL,
  `Rating` DECIMAL(10,0) NOT NULL,
  `Number of Readers` BIGINT(20) NOT NULL,
  `Language Story` VARCHAR(5) NOT NULL,
  `id Story` INT(11) NOT NULL AUTO_INCREMENT,
  `storiescol` VARCHAR(45) NULL DEFAULT '',
  `writer_id` INT(11) NOT NULL,
  INDEX `fk_stories_writer_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_stories_writer`
    FOREIGN KEY (`writer_id`)
    REFERENCES `database`.`writer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- إنشاء جدول "users" إذا لم يكن موجودًا بالفعل لتخزين بيانات المستخدمين
CREATE TABLE IF NOT EXISTS `database`.`users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `real name` VARCHAR(50) NOT NULL,
  `last name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `Book or reader` INT(11) NOT NULL,
  `ip` TINYINT(4) NOT NULL,
  `language` VARCHAR(5) NOT NULL,
  `Device type` INT(11) NOT NULL,
  `reader_id` BIGINT(20) NOT NULL,
  `writer_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_reader1_idx` (`reader_id` ASC) VISIBLE,
  INDEX `fk_users_writer1_idx` (`writer_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_reader1`
    FOREIGN KEY (`reader_id`)
    REFERENCES `database`.`reader` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_writer1`
    FOREIGN KEY (`writer_id`)
    REFERENCES `database`.`writer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- استعادة إعدادات SQL Mode السابقة وقيم التحقق من المفاتيح الخارجية والقيم الفريدة
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
