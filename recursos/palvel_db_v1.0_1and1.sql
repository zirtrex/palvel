-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db749219188
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db749219188
-- -----------------------------------------------------
USE `db749219188` ;

-- -----------------------------------------------------
-- Table `db749219188`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db749219188`.`usuario` ;

CREATE TABLE IF NOT EXISTS `db749219188`.`usuario` (
  `codUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  `rol` ENUM('admin', 'docente') NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(100) NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `primerApellido` VARCHAR(45) NULL,
  `segundoApellido` VARCHAR(45) NULL,
  `modalidadDocente` VARCHAR(100) NULL,
  `correo` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `departamento` VARCHAR(200) NULL,
  `imagenPerfil` VARCHAR(500) NULL,
  PRIMARY KEY (`codUsuario`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db749219188`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db749219188`.`curso` ;

CREATE TABLE IF NOT EXISTS `db749219188`.`curso` (
  `codCurso` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCurso` VARCHAR(500) NULL,
  `ciclo` CHAR(2) NULL,
  `departamento` VARCHAR(200) NULL,
  PRIMARY KEY (`codCurso`),
  UNIQUE INDEX `codigo_UNIQUE` (`nombreCurso` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db749219188`.`quimico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db749219188`.`quimico` ;

CREATE TABLE IF NOT EXISTS `db749219188`.`quimico` (
  `codQuimico` INT(11) NOT NULL AUTO_INCREMENT,
  `elemento` VARCHAR(500) NULL,
  `unidadMedida` VARCHAR(100) NULL,
  `tipo` VARCHAR(100) NULL,
  PRIMARY KEY (`codQuimico`),
  UNIQUE INDEX `codigo_UNIQUE` (`elemento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db749219188`.`requerimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db749219188`.`requerimiento` ;

CREATE TABLE IF NOT EXISTS `db749219188`.`requerimiento` (
  `cantidad` INT(4) NOT NULL,
  `semestre` VARCHAR(50) NOT NULL,
  `fechaPedido` DATETIME NOT NULL,
  `estado` ENUM('Guardado', 'Enviado') NOT NULL,
  `codUsuario` INT(11) NOT NULL,
  `codCurso` INT(11) NOT NULL,
  `codQuimico` INT(11) NOT NULL,
  PRIMARY KEY (`codUsuario`, `codCurso`, `codQuimico`),
  INDEX `fk_pagos_usuario1_idx` (`codUsuario` ASC),
  INDEX `fk_requerimiento_curso1_idx` (`codCurso` ASC),
  INDEX `fk_requerimiento_quimico1_idx` (`codQuimico` ASC),
  CONSTRAINT `fk_pagos_usuario1`
    FOREIGN KEY (`codUsuario`)
    REFERENCES `db749219188`.`usuario` (`codUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requerimiento_curso1`
    FOREIGN KEY (`codCurso`)
    REFERENCES `db749219188`.`curso` (`codCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requerimiento_quimico1`
    FOREIGN KEY (`codQuimico`)
    REFERENCES `db749219188`.`quimico` (`codQuimico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db749219188`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `db749219188`;
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, NULL, 'admin', '47623721', '47623721', 'Rafael', 'Contreras', 'Martinez', '', 'zirtrex@gmail.com', '966102508', NULL, NULL);
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, NULL, 'docente', '76587651', '76587651', 'Graciela', 'Thupa', 'Velasques', 'Contratado', 'gratv20@gmail.com', '947498997', 'Zoología', NULL);
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09431714', 'docente', '09431714', '09431714', 'Silvia Ysabel', 'Aguilar', 'Luna', '', 'saguilarluna@gmail.com', '975406041', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08555549', 'docente', '08555549', '08555549', 'Joaquina  Adelaida', 'Alban', 'Castillo', '', 'jalbanc@yahoo.es; jalbanc@gmail.com', '980989607', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07576929', 'docente', '07576929', '07576929', 'Debora Elizabeth', 'Alvarado', 'Iparraguirre', '', '', '997793538', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09022430', 'docente', '09022430', '09022430', 'Libertad', 'Alzamora', 'Gonzales', '', 'lalzamorag@gmail.com', '986912733', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08136445', 'docente', '08136445', '08136445', 'Monica', 'Arakaki', 'Makishi', '', '', '980459169', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09348713', 'docente', '09348713', '09348713', 'Cesar Augusto', 'Arana', 'Bustamante', '', 'cesaranab@yahoo.com', '4710117', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '40039759', 'docente', '40039759', '40039759', 'Maribel', 'Baylon', 'Coritoma', '', 'maricoritomabp@hotmail.com', '945229048', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07000137', 'docente', '07000137', '07000137', 'Elba', 'Canahuire', 'Cairo', '', 'ecanahuirec@gmail.com', '962587415', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07639578', 'docente', '07639578', '07639578', 'Asuncion Alipio', 'Cano', 'Echevarria', '', 'asucnau@yahoo.es', '991887513', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09624117', 'docente', '09624117', '09624117', 'Franz Teodosio', 'Cardoso', 'Pacheco', '', '', '967747291', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07816323', 'docente', '07816323', '07816323', 'Julia Esther', 'Castro', 'Hidalgo', '', 'jch4920@hotmail.com ', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09438212', 'docente', '09438212', '09438212', 'Erasmo Honorio', 'Colona', 'Vallejos', '', 'ecolonav@hotmail.com', '5644192', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06563003', 'docente', '06563003', '06563003', 'Cesar Augusto', 'Cordova', 'Castañeda', '', 'vrlo@hotmail.com', '3262864', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07726863', 'docente', '07726863', '07726863', 'Jesus Humberto', 'Cordova', 'Santa Gadea', '', 'jhcordovasantagadea@yahoo.es', '6586421', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06156889', 'docente', '06156889', '06156889', 'Oswaldo Benjamin', 'Cornejo', 'Gonzales', '', '', '997641152', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25757266', 'docente', '25757266', '25757266', 'Alicia Encarnacion', 'Diestro', 'Diestro', '', 'v-saludable@hotmail.com', '5748684', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08066628', 'docente', '08066628', '08066628', 'Enrique  Juan', 'Escobar', 'Guzman', '', '', '997770759', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08859782', 'docente', '08859782', '08859782', 'Juan Ricardo', 'Fernandez', 'Gonzales', '', '', '996004995', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08492369', 'docente', '08492369', '08492369', 'Abad', 'Flores', 'Paucarima', '', '', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08192773', 'docente', '08192773', '08192773', 'Irma Lucrecia', 'Franke', 'Jahncke De Valencia', '', 'irma.franke@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08060631', 'docente', '08060631', '08060631', 'Susana Monica', 'Gutierrez', 'Moreno', '', 'sugutimer@gmail.com', '999937090', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07758954', 'docente', '07758954', '07758954', 'Max Henry', 'Hidalgo', 'Del Aguila', '', 'maxhhidalgo@yahoo.com', '997211825', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08138468', 'docente', '08138468', '08138468', 'Monica Rocio', 'Huaman', 'Iturrizaga', '', 'mhiturrizaga@yahoo.com', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09197024', 'docente', '09197024', '09197024', 'Ana Asuncion', 'Huamantinco', 'Araujo', '', 'ahuamantinco@hotmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08609804', 'docente', '08609804', '08609804', 'Domingo', 'Iparraguirre', 'Leon', '', 'domipal7@gmail.com', '999358763', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08456362', 'docente', '08456362', '08456362', 'Enoc Efer', 'Jara', 'Peña', '', 'ejarap@gmail.com', '992872490', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06281952', 'docente', '06281952', '06281952', 'Juan Atilio', 'Jimenez', 'Chunga', '', 'juanjimenezchunga@yahoo.es', '993022788', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06134564', 'docente', '06134564', '06134564', 'Rafael Simon Oswaldo', 'La Rosa', 'Loli', '', 'rafolarosa@yahoo.es', '993682643', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08246694', 'docente', '08246694', '08246694', 'Amadeo Guillermo', 'Lamas', 'Muller Gerardo', '', '', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07186191', 'docente', '07186191', '07186191', 'Fanny Elizabeth', 'Lazo', 'Manrique', '', '', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06451156', 'docente', '06451156', '06451156', 'Jorge', 'Leon', 'Quispe', '', '', '980938223', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '10472260', 'docente', '10472260', '10472260', 'Alberto Ernesto', 'Lopez', 'Sotomayor', '', 'netto669@hotmail.com', '991293794', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '42826893', 'docente', '42826893', '42826893', 'Miguel', 'Machahua', 'Gonzalez', '', 'm.machahua@gmail.com', '', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08550637', 'docente', '08550637', '08550637', 'Mauro Gilber', 'Mariano', 'Astocondor', '', 'mmarianoa@gmail.com', '993264206', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09409211', 'docente', '09409211', '09409211', 'Manuel Jesus', 'Marin', 'Bravo', '', 'manuelmarinbravo@gmail.com', '999291773', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08426698', 'docente', '08426698', '08426698', 'Rosa Nerida', 'Martinez', 'Rojas', '', '', '999050646', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06175080', 'docente', '06175080', '06175080', 'Egma Marcelina', 'Mayta', 'Huatuco', '', ' egmahuatuco@yahoo.com.br   ', '990588088', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08800393', 'docente', '08800393', '08800393', 'Carmen Rosa', 'Mendez', 'Farro', '', 'cmendezf08@gmail.com; cmendezf08@hotmail.com', '945142727', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09886449', 'docente', '09886449', '09886449', 'Carlos Alejandro', 'Mendoza', 'Valderrama', '', 'tiocarlosmendoza@gmail.com', '992493634', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08038358', 'docente', '08038358', '08038358', 'Fernando Abilio', 'Merino', 'Rafael', '', 'abilio1007@gmail.com', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07598606', 'docente', '07598606', '07598606', 'Haydee', 'Montoya', 'Terreros', '', 'haydmon@yahoo.com', '', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06255696', 'docente', '06255696', '06255696', 'Hilda Yolanda', 'Morante', 'Oliva De Ortiz', '', 'hmoranteo@hotmail.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07601082', 'docente', '07601082', '07601082', 'Asucena Idalia', 'Naupay', 'Igreda', '', '', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07199717', 'docente', '07199717', '07199717', 'Nilda Violeta', 'Oliveros', 'Rodriguez', '', '', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09337584', 'docente', '09337584', '09337584', 'Jasmin Alexandra', 'Opisso', 'Mejia', '', 'jopisso@hotmail.com', '', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06651155', 'docente', '06651155', '06651155', 'Victor Raul', 'Pacheco', 'Torres', '', 'vpachecot@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07901815', 'docente', '07901815', '07901815', 'Monica Yolanda', 'Paredes', 'Anaya', '', 'monica.paredes.anaya@gmail.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25594149', 'docente', '25594149', '25594149', 'Jose Luis Rafael', 'Pino', 'Gaviño', '', '', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '10143497', 'docente', '10143497', '10143497', 'Elena Luzgarda', 'Quillama', 'Polo', '', '', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07622835', 'docente', '07622835', '07622835', 'Eliana Del Pilar', 'Quispitupac', 'Quispitupac', '', '', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07923272', 'docente', '07923272', '07923272', 'Rina Lastenia', 'Ramirez', 'Mesias', '', 'rina_rm@yahoo.com', '996-259-390', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06183797', 'docente', '06183797', '06183797', 'Pablo Sergio', 'Ramirez', 'Roca', '', '', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08212301', 'docente', '08212301', '08212301', 'Fernando Octavio', 'Retuerto', 'Prieto', '', 'fretuertop@hotmail.com', '996902936', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25531577', 'docente', '25531577', '25531577', 'Olga Leonor', 'Riofrio', 'Vargas', '', 'oriofriov@hotmail.com', '941-139-760', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06062272', 'docente', '06062272', '06062272', 'Leonardo', 'Romero', 'Chumpitaz', '', 'lromerochumpitaz@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07215981', 'docente', '07215981', '07215981', 'Iris  Margot', 'Samanez', 'Valer', '', 'isamanez@yahoo.com', '981-7352-238', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08758229', 'docente', '08758229', '08758229', 'Lidia Rosa', 'Sanchez', 'Perez', '', 'lidiarosa06@yahoo.es', '999-723-170', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06002430', 'docente', '06002430', '06002430', 'Hector Javier', 'Sanchez', 'Sotomayor', '', '', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '41020762', 'docente', '41020762', '41020762', 'Gustavo Adolfo', 'Sandoval', 'Peña', '', '', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25721631', 'docente', '25721631', '25721631', 'Ruperto', 'Severino', 'Lopez', '', '', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25739354', 'docente', '25739354', '25739354', 'Betty Elena', 'Shiga', 'Oshige', '', 'bshigao@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25836223', 'docente', '25836223', '25836223', 'Giovanna Elizabeth', 'Sotil', 'Caycho', '', 'gsotil@yahoo.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '25527172', 'docente', '25527172', '25527172', 'Mery Luz', 'Suni', 'Ninataype', '', 'msunin@gmail.com', '', 'Botánica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '33262515', 'docente', '33262515', '33262515', 'Liliana Del Rosario', 'Tapia', 'Ugaz', '', 'tapiaugaz@hotmail.com', '', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '09774658', 'docente', '09774658', '09774658', 'Haydee Virginia', 'Temoche', 'Garcia', '', 'haydeevirginia@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06449624', 'docente', '06449624', '06449624', 'Martha Esther', 'Valdivia', 'Cuya', '', '', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08193812', 'docente', '08193812', '08193812', 'Niels Marciano', 'Valencia', 'Chacon', '', 'niels.valencia@gmail.com', '', 'Zoología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08864602', 'docente', '08864602', '08864602', 'German', 'Vergaray', 'Ulffe', '', 'germanvergaray@gmail.com', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '41951131', 'docente', '41951131', '41951131', 'Dan Erick', 'Vivas', 'Ruiz', '', 'devivasr@hotmail.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '10587728', 'docente', '10587728', '10587728', 'Patricia Gloria', 'Woll', 'Toso', '', 'pwollt@gmail.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '06756224', 'docente', '06756224', '06756224', 'Carmen Rosario', 'Yamashiro', 'Guinoza', '', '', '', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07649561', 'docente', '07649561', '07649561', 'Armando', 'Yarleque', 'Chocas', '', 'ayarleque48@gmail.com', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '07544388', 'docente', '07544388', '07544388', 'Jorge Antonio', 'Zeballos', 'Alva', '', 'jzeballosalva@yahoo.es', '', 'Biología Celular y Genetica', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '08550935', 'docente', '08550935', '08550935', 'Tito', 'Sanchez', 'Rojas', '', 'bioambiente@hotmail.com', '', 'Microbiología y Parasitología', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '10132622', 'docente', '10132622', '10132622', 'Tania Sarith', 'Peña', 'Baca', '', '', '', 'Hidrobiología y Pesquería', '');
INSERT INTO `db749219188`.`usuario` (`codUsuario`, `codigo`, `rol`, `usuario`, `clave`, `nombres`, `primerApellido`, `segundoApellido`, `modalidadDocente`, `correo`, `telefono`, `departamento`, `imagenPerfil`) VALUES (DEFAULT, '41509033', 'docente', '41509033', '41509033', 'Zeze Humberto', 'Bravo', 'Gutierrez', '', '', '', 'Zoología', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db749219188`.`curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `db749219188`;
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Zoología General        ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Metodología de la Investigación ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Genética General ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Zoogeografía', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biología molecular ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Nemátodos y Acantocéfalos Parásitos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Fitogeografía', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Dicotiledoneas II   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biología Animal  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Microb. de los alimentos ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Morf. comparada de cordados ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Hidrobiología General ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ecología de poblaciones vegetales', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ficología ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biología Vegetal ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Transferencia genética horizontal         ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Fitopatología       ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Microbiología en Salud', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Virología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Química Orgánica   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Microbiología Industrial ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Entomología Aplicada ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Principios de control de plagas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Edafología        ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Horticultura   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Inmunología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Fisiología  Microbiana  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biotecnología Ambiental   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Estructura Cromosómica ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Invertebrados Acuáticos ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Evolución', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Microbiología ambienta', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Tecnología Enzimática', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Proteómica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Fisiología animal y vegetal ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biotecnología Vegetal ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Contaminación ambiental', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ecología animal  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Tópicos exp. en parasitología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ecología Microbiana    ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Briofitas y Pteridofitas  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Diversidad Genética              ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Flora y vegetación de la amazonía                 ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Genética humana ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Física de macromoléculas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Histología y embriología animal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Tópicos experimentales en parasitología  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Epidemiología ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Inmunopatología  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ecología de comunidades', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Nutrición de org. acuáticos ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Zoología económica ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Acuicultura   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Introducción a la Medicina Genómica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Tecnología de la reproducción  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Nutrición de organismos acuáticos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Cultivos acuáticos    ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Fisiología Vegetal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Botánica General    ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Sistemática General ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Antropología biológica         ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ecología General  ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Genética microbiana   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Inv. Acelomados y Pseudoacelomados', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Monocotiledoneas           ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Nomenclatura botánica   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Aspectos genómicos de la evolución   ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Zoonosis parasitarias', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Ictioparasitología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Monogenéos tremátodos y céstodos parásitos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Bentos marino          ', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Microbiología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biología Celular', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (DEFAULT, 'Biotecnología Animal   ', '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db749219188`.`quimico`
-- -----------------------------------------------------
START TRANSACTION;
USE `db749219188`;
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agujas entomológicas # 1 ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agujas entomológicas # 2 ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agujas n°18 ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agujas n°20', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Algodón', 'Kilo', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Algodón hidrófilo ', 'Kilo', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Asas de siembra con mango de kolle (metaloop) ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Baguetas ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Balón de fondo plano de 1 litro ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Balón de fondo plano de 500ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 10 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 100 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 1000 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 25 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 250 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 50 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 500 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Beaker / vaso de precipitación 600 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Buretas de 25 ml  ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cámara neubauer ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Chupones para pipetas Pasteur', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cinta de ph en tiras', 'Rollo de 70 unid', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Crioviales con tapa rosca 1.0ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Crioviales con tapa rosca 2.0ml', 'Bolsa x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Crioviales con tapa rosca 4.0ml', 'Bolsa x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Crioviales con tapa rosca 5.0ml ', 'Bolsa x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio  ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio con vástago largo ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio de 100mm de diámetro ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio de 150mm de diámetro', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio de 50mm de diámetro', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio de 55mm de diámetro', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Embudo de vidrio de 80mm de diámetro', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 100 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 1000 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 25 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 250 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 50 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 500 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Erlemeyer o matraz 5000 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para matraz ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para pipetas 05 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para pipetas 10 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para pipetas 1ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para probetas ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para tubos 10 x 75', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para tubos 13 x 100', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para tubos 15 x 125', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Escobilla para tubos 16 x 150', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Esparadrapo', 'Caja 1x10ydasx12cortes', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Espátula de acero para pesos gruesos', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Espátula de acero para pesos livianos', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Espátula de drigalsky', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Filtros de membrana de nitrocelulosa', ' tamaño de poro 0.45µm', ' diámetro 47mm ');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Frasco de vidrio de 1000ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Frasco de vidrio de 250ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Frasco de vidrio de 500ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Frasco goteros de 100 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Frasco tapa rosca de 250 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Gotero de plástico ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Gotero de vidrio', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Gradilla ', 'Unidad x 48 hoyos', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de jebe talla L ', 'Par', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de jebe talla M ', 'Par', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de jebe talla S ', 'Par', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de látex talla L ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de látex talla M ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de látex talla S ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de nitrilo talla L ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de nitrilo talla M ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes de nitrilo talla S ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes quirúrgicos talla L ', 'Caja x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes quirúrgicos talla M ', 'Caja x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Guantes quirúrgicos talla S ', 'Caja x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hisopo con mango largo de madera ', 'Bolsa x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hoja de bisturí n°11  ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Indicador de PH panpha (4-12)', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Jabón líquido', 'Litro', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Jeringa de tuberculina estériles ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Jeringa de vidrio 50 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Jeringas estériles x 10ml-descartables', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Jeringas estériles x 5ml-descartables', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Kitasato de 500 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Lamina cubreobjetos (22x22)   (cajas)', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Lamina excavadas de 12 pocillos ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Laminas portaobjeto  (cajas)', 'Caja x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ligaduras para sangría', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Luna de reloj ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Mango de bisturí n° 4 ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Marcadores de vidrio', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Mascarillas ', 'Caja x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Matraz erlenmeyer de 125 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Matraz tipo balón de 500 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Mechero de alcohol', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micro tubos de  1.5 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micropipeta automática 0.1-10 µl', 'Caja', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micropipeta automática 0.1-2 µl', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micropipeta automática 100-1000 µl', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micropipeta automática 10-100 µl', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Micropipeta automática 20-200 µl', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Mortero de porcelana con pilon de 80mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel aluminio ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel craft', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel filtro (paso lento)  ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel filtro (paso rápido) ', 'Caja x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel filtro Whatman nº 1 ', 'Caja x 100 ', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel Kraft', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Papel lente ', 'Block x 100', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Parafilm ', 'Rollos', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza de madera', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza de Mohr', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza de punta plana 20 cm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza de relojero punta fina ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza dientes de ratón', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pinza hemostática ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta de 01 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta de 02 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta de 05 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta de 10 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta Pasteur plástico', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipeta Pasteur vidrio ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipetas serológicas graduadas 1 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipetas serológicas graduadas 10 ml', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pipetas serológicas graduadas 5 ml  ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pisceta 250 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pisceta 500 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placa de toques de porcelana 12 cavidades', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placas petri plástico 15 x 100 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placas petri plástico 150 x 30 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placas petri vidrio 10 x 100 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placas petri vidrio 15 x 100 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Placas petri vidrio 150 x 30 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 10 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 100 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 1000 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 250 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 50 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Probeta graduada de 500 ml ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Propipetas ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Puntas amarillas (bolsa x 1000 u)', 'Bolsa x 1000', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Puntas azules )', 'Bolsa x 500', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Puntas blancas 10 ul ()', 'Bolsa x 1000', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Puntas descartables para micropipetas (20-200 µl) ', 'Bolsa x 1000', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Termometros (-10 +110 ºc) ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tijera de punta fina', 'Unidad ', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tijera de punta recta ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tips 10 µl ', 'Bolsa x 1000', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tips 1000 µl', 'Bolsa x 1000', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tips 200 µl ', 'Bolsa x 500', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 10x65 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 10x75 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 12x75 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 13x100 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 15x125 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 15x75 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 16x150 mm', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo 22x150 mm ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo cónico descartable de 15ml con tapa rosca ', 'Bolsa x 50', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubo de ensayo cónicos descartable de 50ml con tapa rosca ', 'Racks x 25 ', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos de 13x100 mm con tapa de rosca  ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos de 16x150 mm con tapa rosca ', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos de 16x150mm con tapa rosca', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos de centrífuga 1', '5ml ', 'Bolsa x 500');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos durham', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tubos eppendorf de 1.5ml', 'Bolsa x 500', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Vial con tapa rosca (unidades)', 'Unidad', 'MATERIALES DE LABORATORIO');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aceite de inmersión', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Acetamida ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Acetato de etilo - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Acetato de plomo', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Acetato de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Acetona - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  3 indol acético (AIA) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  bórico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  láctico ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  nalidixidico ', 'Miligramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  oxalico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  periódico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  pícrico (en polvo) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido  propionico', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido acético glacial ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido clorhídrico - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido nítrico - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido pícrico ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido pirogálico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido sulfúrico - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido sulfurico concentrado', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ácido tánico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Adenina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar anaeróbico de brewer ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar baird parker ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar base para sangre ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar base urea ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar BHI / agar infusión cerebro corazón', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar bilis esculina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar cetrimide ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar citrato de simmons ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar czapek', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar DNA ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar EMB / agar eosina azul de metileno ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar LIA / agar lisina hierro ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar Mac Conkey ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar manitol salado  ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar Mann Rogosa Sharpe ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar Muller Hinton ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar noble ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar nutritivo ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar papa dextrosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar plate count ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar sabouraud glucosado ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar selectivo para b. Cereus ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar SIM ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar SPS ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar SS / agar salmonella shigella  ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar sulfito de bismuto ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar TCBS ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar tributirina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar tripticasa soya o tsa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar TSI ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar VRBA ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agar XLD ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agarosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agarosa tipo III (electroforesis adn) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agua destilada ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Agua ultrapura ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol acetona', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol amílico ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol corriente / alcohol etílico 96o ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol etílico 70º ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol etílico absoluto / etanol  absoluto ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol isoamilico ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol isopropilico ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Alcohol metílico / metanol absoluto- bf. Produce', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Almidón soluble ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido  hipoxantina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido alanina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido arginina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido leucina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido prolina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido treonina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Aminoácido valina    ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ampicilina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Anaranjado de metilo ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ácido nalidíxico  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) amoxicilina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) amoxicilina-ac. Clavulánico  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ampicilina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ceftazidima  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ceftazidima-ac. Clavulánico  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ceftriaxona  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) ceftriaxona-ac. Clavulánico  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) cloramfenicol  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) eritromicina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) estreptomicina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) furazolidona  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) gentamicina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) novobiocina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) optoquina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) penicilina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antibiótico (en discos de sensibilidad) vancomicina  ', 'Frasco x 50 unidades', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Antrona', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Arabinosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Asparagina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azida de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul brillante de coomasie ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul de bromotimol ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul de lactofenol ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul de metileno ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul de toluidina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Azul de tripan ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Bálsamo de canada ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Bicarbonato de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Bis-acrilamida ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo azida glucosa  ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo BHI / caldo infusión cerebro corazón ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo brila ó verde brillante ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo EC ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo Giolitti y Cantoni ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo GN (Gram Negativo) según Hajna', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo lactosado ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo lauril sulfato o lauril triptosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo luria bertani', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo MRVP ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo nitrato', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo nutritivo', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo púrpura de bromocresol ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo selenito f ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo tetrationato ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo tioglicolato ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo tripticasa soya o TSB ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caldo triptosa fosfato ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Carbon activado ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Carbonato de sodio anhidro', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Carboximetil celulosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Carmin ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Caseina', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Citrato de amonio férrico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Citrato de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloroformo ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de amonio - BF.SUNAT', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de bario', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de calcio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de calcio anhidro ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de magnesio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de magnesio 6 aguas (mgcl2 2h2o)', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de potasio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de potasio (kcl)', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cloruro férrico', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Creosota ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Cristal violeta ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Diclorometano', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'DNASA ', 'Unidad', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Dodecil sulfato de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'EDTA ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Enzima TAQ ADN polimerasa ( 5U/µl) ', 'Unidad', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Eosina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Eritromicina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Extracto de carne ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Extracto de levadura ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Extracto de malta ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fenilalanina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fenol cristalizado / Ácido  fénico ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fenolftaleína ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fijador de bouin ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Formaldehido ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Formol ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fosfato dibásico de potasio (k2hpo4) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fosfato dibásico de sodio hidratado (na2hpo4.12h2o) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fosfato monobásico de sodio (nah2po4)', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fructosa', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fucsina ácida ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Fucsina basica ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Furazolidona ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Galactosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Giemsa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Glicerina', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Glicina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Glucosa o dextrosa anhidra q.p. ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hematoxilina ', 'Unidad x cristales', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hepes ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hidrato de cloral ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hidroquinona ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Hidroxido de potasio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Histidina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ioduro de potasio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Kits de análisis de nitritos', ' nitratos y amonio', 'Unidad');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Lactosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Lugol ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Maltosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Manitol ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Medio esencial mínimo eagle ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Mercaptoetanol', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Naftol', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Nitrato de calcio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Nitrato de plata ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Nitrato de potasio', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Orceina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Oxalato de amonio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Oxido de mercurio rojo', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Pancreatina', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Para-dimetil amino benzaldehido ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Parafina liquida / vaselina líquida / aceite mineral ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Parafina solida', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Peptona de carne ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Peptona de caseína ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Peptona de soya ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Permanganato de potasio - BF.SUNAT', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Piruvato de sodio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Prolina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Propanodiol ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rafinosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Reactivo de benedic', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Reactivo de kovacs (para indol) - BF.SUNAT', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Ribosa', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rnasa ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rojo de alizarina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rojo de congo', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rojo de fenol ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rojo de metilo ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rojo neutro ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Rosa bengala', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sacarosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Safranina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sephadex ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Serina ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Silica gel 60 cromatografia', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Solución salina estéril ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sucrosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Suero fetal de ternera', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de amonio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de cobre (h20) ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de cobre heptahidratado', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de cobre pentahidratado ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de hierro ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de magnesio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de manganeso ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de potasio anhidro ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato de zinc ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Sulfato ferroso ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Telurito de potasio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Temed ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tetraoxido de osmio ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Timina', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tripsina  DIFCO 1:250 ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Triptofano ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Triptona ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tris base ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Triton ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Trizol invitrogen cat15596026 ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tween 20', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Tween 80 ', 'Mililitro', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Uracilo ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Verde de janus ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Verde de malaquita ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Verde de metilo ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Violeta de cresilo', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Violeta de genciana ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Xilosa ', 'Gramo', 'REACTIVOS QUIMICOS');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (DEFAULT, 'Yoduro de potasio ', 'Gramo', 'REACTIVOS QUIMICOS');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db749219188`.`requerimiento`
-- -----------------------------------------------------
START TRANSACTION;
USE `db749219188`;
INSERT INTO `db749219188`.`requerimiento` (`cantidad`, `semestre`, `fechaPedido`, `estado`, `codUsuario`, `codCurso`, `codQuimico`) VALUES (500, '2018-2', '2018-07-31', 'Guardado', 2, 1, 1);
INSERT INTO `db749219188`.`requerimiento` (`cantidad`, `semestre`, `fechaPedido`, `estado`, `codUsuario`, `codCurso`, `codQuimico`) VALUES (300, '2018-2', '2018-07-31', 'Guardado', 2, 1, 2);
INSERT INTO `db749219188`.`requerimiento` (`cantidad`, `semestre`, `fechaPedido`, `estado`, `codUsuario`, `codCurso`, `codQuimico`) VALUES (10, '2018-2', '2018-07-31', 'Guardado', 2, 2, 1);
INSERT INTO `db749219188`.`requerimiento` (`cantidad`, `semestre`, `fechaPedido`, `estado`, `codUsuario`, `codCurso`, `codQuimico`) VALUES (1, '2018-2', '2018-07-31', 'Guardado', 1, 1, 3);

COMMIT;

