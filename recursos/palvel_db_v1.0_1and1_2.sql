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
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (1, 'Zoología General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (2, 'Metodología de la Investigación', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (3, 'Genética General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (4, 'Zoogeografía', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (5, 'Biología molecular', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (6, 'Nemátodos y Acantocéfalos Parásitos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (7, 'Fitogeografía', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (8, 'Dicotiledoneas II', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (9, 'Biología Animal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (10, 'Microbiología de los alimentos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (11, 'Morfología comparada de cordados', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (12, 'Hidrobiología General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (13, 'Ecología de poblaciones vegetales', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (14, 'Ficología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (15, 'Biología Vegetal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (16, 'Transferencia genética horizontal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (17, 'Fitopatología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (18, 'Microbiología en Salud', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (19, 'Virología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (20, 'Química Orgánica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (21, 'Microbiología Industrial', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (22, 'Entomología Aplicada', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (23, 'Principios de control de plagas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (24, 'Edafología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (25, 'Horticultura', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (26, 'Inmunología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (27, 'Fisiología Microbiana', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (28, 'Biotecnología Ambiental', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (29, 'Estructura Cromosómica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (30, 'Invertebrados Acuáticos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (31, 'Evolución', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (32, 'Microbiología ambiental', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (33, 'Tecnología Enzimática', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (34, 'Proteómica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (35, 'Fisiología Animal y Vegetal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (36, 'Biotecnología Vegetal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (37, 'Contaminación ambiental', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (38, 'Ecología animal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (39, 'Tópicos exp. en parasitología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (40, 'Ecología Microbiana', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (41, 'Briofitas y Pteridofitas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (42, 'Diversidad Genética', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (43, 'Flora y vegetación de la Amazonía', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (44, 'Genética humana', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (45, 'Física de macromoléculas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (46, 'Histología y embriología animal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (47, 'Tópicos experimentales en parasitología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (48, 'Epidemiología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (49, 'Inmunopatología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (50, 'Ecología de comunidades', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (51, 'Nutrición de org. Acuáticos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (52, 'Zoología económica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (53, 'Acuicultura', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (54, 'Introducción a la Medicina Genómica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (55, 'Tecnología de la reproducción', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (56, 'Nutrición de organismos acuáticos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (57, 'Cultivos acuáticos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (58, 'Fisiología Vegetal', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (59, 'Botánica General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (60, 'Sistemática General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (61, 'Antropología biológica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (62, 'Ecología General', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (63, 'Genética microbiana', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (64, 'Inv. Acelomados y Pseudoacelomados', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (65, 'Monocotiledoneas', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (66, 'Nomenclatura botánica', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (67, 'Aspectos genómicos de la evolución', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (68, 'Zoonosis parasitarias', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (69, 'Ictioparasitología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (70, 'Monogenéos tremátodos y céstodos parásitos', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (71, 'Bentos marino', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (72, 'Microbiología', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (73, 'Biología Celular', '', '');
INSERT INTO `db749219188`.`curso` (`codCurso`, `nombreCurso`, `ciclo`, `departamento`) VALUES (74, 'Biotecnología Animal   ', '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db749219188`.`quimico`
-- -----------------------------------------------------
START TRANSACTION;
USE `db749219188`;
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (1, 'Agujas entomológicas # 1 ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (2, 'Agujas entomológicas # 2 ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (3, 'Agujas n°18 ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (4, 'Agujas n°20', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (5, 'Algodón', 'Kilo', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (6, 'Algodón hidrófilo ', 'Kilo', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (7, 'Asas de siembra con mango de kolle (metaloop) ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (8, 'Baguetas ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (9, 'Balón de fondo plano de 1 litro ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (10, 'Balón de fondo plano de 500ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (11, 'Beaker / vaso de precipitación 10 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (12, 'Beaker / vaso de precipitación 100 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (13, 'Beaker / vaso de precipitación 1000 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (14, 'Beaker / vaso de precipitación 25 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (15, 'Beaker / vaso de precipitación 250 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (16, 'Beaker / vaso de precipitación 50 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (17, 'Beaker / vaso de precipitación 500 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (18, 'Beaker / vaso de precipitación 600 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (19, 'Buretas de 25 ml  ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (20, 'Cámara neubauer ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (21, 'Chupones para pipetas Pasteur', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (22, 'Cinta de ph en tiras', 'Rollo de 70 unid', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (23, 'Crioviales con tapa rosca 1.0ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (24, 'Crioviales con tapa rosca 2.0ml', 'Bolsa x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (25, 'Crioviales con tapa rosca 4.0ml', 'Bolsa x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (26, 'Crioviales con tapa rosca 5.0ml ', 'Bolsa x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (27, 'Embudo de vidrio  ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (28, 'Embudo de vidrio con vástago largo ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (29, 'Embudo de vidrio de 100mm de diámetro ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (30, 'Embudo de vidrio de 150mm de diámetro', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (31, 'Embudo de vidrio de 50mm de diámetro', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (32, 'Embudo de vidrio de 55mm de diámetro', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (33, 'Embudo de vidrio de 80mm de diámetro', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (34, 'Erlemeyer o matraz 100 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (35, 'Erlemeyer o matraz 1000 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (36, 'Erlemeyer o matraz 25 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (37, 'Erlemeyer o matraz 250 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (38, 'Erlemeyer o matraz 50 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (39, 'Erlemeyer o matraz 500 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (40, 'Erlemeyer o matraz 5000 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (41, 'Escobilla para matraz ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (42, 'Escobilla para pipetas 05 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (43, 'Escobilla para pipetas 10 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (44, 'Escobilla para pipetas 1ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (45, 'Escobilla para probetas ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (46, 'Escobilla para tubos 10 x 75', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (47, 'Escobilla para tubos 13 x 100', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (48, 'Escobilla para tubos 15 x 125', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (49, 'Escobilla para tubos 16 x 150', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (50, 'Esparadrapo', 'Caja 1x10ydasx12cortes', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (51, 'Espátula de acero para pesos gruesos', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (52, 'Espátula de acero para pesos livianos', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (53, 'Espátula de drigalsky', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (54, 'Filtros de membrana de nitrocelulosa', ' tamaño de poro 0.45µm', ' diámetro 47mm ');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (55, 'Frasco de vidrio de 1000ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (56, 'Frasco de vidrio de 250ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (57, 'Frasco de vidrio de 500ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (58, 'Frasco goteros de 100 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (59, 'Frasco tapa rosca de 250 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (60, 'Gotero de plástico ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (61, 'Gotero de vidrio', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (62, 'Gradilla ', 'Unidad x 48 hoyos', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (63, 'Guantes de jebe talla L ', 'Par', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (64, 'Guantes de jebe talla M ', 'Par', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (65, 'Guantes de jebe talla S ', 'Par', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (66, 'Guantes de látex talla L ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (67, 'Guantes de látex talla M ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (68, 'Guantes de látex talla S ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (69, 'Guantes de nitrilo talla L ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (70, 'Guantes de nitrilo talla M ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (71, 'Guantes de nitrilo talla S ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (72, 'Guantes quirúrgicos talla L ', 'Caja x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (73, 'Guantes quirúrgicos talla M ', 'Caja x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (74, 'Guantes quirúrgicos talla S ', 'Caja x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (75, 'Hisopo con mango largo de madera ', 'Bolsa x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (76, 'Hoja de bisturí n°11  ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (77, 'Indicador de PH panpha (4-12)', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (78, 'Jabón líquido', 'Litro', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (79, 'Jeringa de tuberculina estériles ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (80, 'Jeringa de vidrio 50 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (81, 'Jeringas estériles x 10ml-descartables', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (82, 'Jeringas estériles x 5ml-descartables', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (83, 'Kitasato de 500 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (84, 'Lamina cubreobjetos (22x22)   (cajas)', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (85, 'Lamina excavadas de 12 pocillos ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (86, 'Laminas portaobjeto  (cajas)', 'Caja x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (87, 'Ligaduras para sangría', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (88, 'Luna de reloj ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (89, 'Mango de bisturí n° 4 ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (90, 'Marcadores de vidrio', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (91, 'Mascarillas ', 'Caja x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (92, 'Matraz erlenmeyer de 125 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (93, 'Matraz tipo balón de 500 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (94, 'Mechero de alcohol', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (95, 'Micro tubos de  1.5 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (96, 'Micropipeta automática 0.1-10 µl', 'Caja', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (97, 'Micropipeta automática 0.1-2 µl', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (98, 'Micropipeta automática 100-1000 µl', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (99, 'Micropipeta automática 10-100 µl', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (100, 'Micropipeta automática 20-200 µl', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (101, 'Mortero de porcelana con pilon de 80mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (102, 'Papel aluminio ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (103, 'Papel craft', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (104, 'Papel filtro (paso lento)  ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (105, 'Papel filtro (paso rápido) ', 'Caja x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (106, 'Papel filtro Whatman nº 1 ', 'Caja x 100 ', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (107, 'Papel Kraft', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (108, 'Papel lente ', 'Block x 100', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (109, 'Parafilm ', 'Rollos', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (110, 'Pinza de madera', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (111, 'Pinza de Mohr', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (112, 'Pinza de punta plana 20 cm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (113, 'Pinza de relojero punta fina ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (114, 'Pinza dientes de ratón', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (115, 'Pinza hemostática ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (116, 'Pipeta de 01 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (117, 'Pipeta de 02 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (118, 'Pipeta de 05 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (119, 'Pipeta de 10 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (120, 'Pipeta Pasteur plástico', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (121, 'Pipeta Pasteur vidrio ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (122, 'Pipetas serológicas graduadas 1 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (123, 'Pipetas serológicas graduadas 10 ml', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (124, 'Pipetas serológicas graduadas 5 ml  ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (125, 'Pisceta 250 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (126, 'Pisceta 500 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (127, 'Placa de toques de porcelana 12 cavidades', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (128, 'Placas petri plástico 15 x 100 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (129, 'Placas petri plástico 150 x 30 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (130, 'Placas petri vidrio 10 x 100 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (131, 'Placas petri vidrio 15 x 100 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (132, 'Placas petri vidrio 150 x 30 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (133, 'Probeta graduada de 10 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (134, 'Probeta graduada de 100 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (135, 'Probeta graduada de 1000 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (136, 'Probeta graduada de 250 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (137, 'Probeta graduada de 50 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (138, 'Probeta graduada de 500 ml ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (139, 'Propipetas ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (140, 'Puntas amarillas (bolsa x 1000 u)', 'Bolsa x 1000', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (141, 'Puntas azules )', 'Bolsa x 500', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (142, 'Puntas blancas 10 ul ()', 'Bolsa x 1000', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (143, 'Puntas descartables para micropipetas (20-200 µl) ', 'Bolsa x 1000', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (144, 'Termometros (-10 +110 ºc) ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (145, 'Tijera de punta fina', 'Unidad ', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (146, 'Tijera de punta recta ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (147, 'Tips 10 µl ', 'Bolsa x 1000', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (148, 'Tips 1000 µl', 'Bolsa x 1000', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (149, 'Tips 200 µl ', 'Bolsa x 500', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (150, 'Tubo de ensayo 10x65 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (151, 'Tubo de ensayo 10x75 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (152, 'Tubo de ensayo 12x75 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (153, 'Tubo de ensayo 13x100 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (154, 'Tubo de ensayo 15x125 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (155, 'Tubo de ensayo 15x75 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (156, 'Tubo de ensayo 16x150 mm', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (157, 'Tubo de ensayo 22x150 mm ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (158, 'Tubo de ensayo cónico descartable de 15ml con tapa rosca ', 'Bolsa x 50', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (159, 'Tubo de ensayo cónicos descartable de 50ml con tapa rosca ', 'Racks x 25 ', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (160, 'Tubos de 13x100 mm con tapa de rosca  ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (161, 'Tubos de 16x150 mm con tapa rosca ', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (162, 'Tubos de 16x150mm con tapa rosca', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (163, 'Tubos de centrífuga 1', '5ml ', 'Bolsa x 500');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (164, 'Tubos durham', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (165, 'Tubos eppendorf de 1.5ml', 'Bolsa x 500', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (166, 'Vial con tapa rosca (unidades)', 'Unidad', 'Material de laboratorio');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (167, 'Aceite de inmersión', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (168, 'Acetamida ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (169, 'Acetato de etilo - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (170, 'Acetato de plomo', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (171, 'Acetato de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (172, 'Acetona - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (173, 'Ácido  3 indol acético (AIA) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (174, 'Ácido  bórico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (175, 'Ácido  láctico ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (176, 'Ácido  nalidixidico ', 'Miligramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (177, 'Ácido  oxalico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (178, 'Ácido  periódico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (179, 'Ácido  pícrico (en polvo) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (180, 'Ácido  propionico', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (181, 'Ácido acético glacial ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (182, 'Ácido clorhídrico - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (183, 'Ácido nítrico - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (184, 'Ácido pícrico ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (185, 'Ácido pirogálico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (186, 'Ácido sulfúrico - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (187, 'Ácido sulfurico concentrado', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (188, 'Ácido tánico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (189, 'Adenina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (190, 'Agar anaeróbico de brewer ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (191, 'Agar baird parker ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (192, 'Agar base para sangre ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (193, 'Agar base urea ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (194, 'Agar BHI / agar infusión cerebro corazón', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (195, 'Agar bilis esculina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (196, 'Agar cetrimide ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (197, 'Agar citrato de simmons ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (198, 'Agar czapek', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (199, 'Agar DNA ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (200, 'Agar EMB / agar eosina azul de metileno ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (201, 'Agar LIA / agar lisina hierro ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (202, 'Agar Mac Conkey ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (203, 'Agar manitol salado  ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (204, 'Agar Mann Rogosa Sharpe ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (205, 'Agar Muller Hinton ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (206, 'Agar noble ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (207, 'Agar nutritivo ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (208, 'Agar papa dextrosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (209, 'Agar plate count ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (210, 'Agar sabouraud glucosado ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (211, 'Agar selectivo para b. Cereus ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (212, 'Agar SIM ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (213, 'Agar SPS ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (214, 'Agar SS / agar salmonella shigella  ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (215, 'Agar sulfito de bismuto ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (216, 'Agar TCBS ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (217, 'Agar tributirina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (218, 'Agar tripticasa soya o tsa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (219, 'Agar TSI ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (220, 'Agar VRBA ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (221, 'Agar XLD ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (222, 'Agarosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (223, 'Agarosa tipo III (electroforesis adn) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (224, 'Agua destilada ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (225, 'Agua ultrapura ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (226, 'Alcohol acetona', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (227, 'Alcohol amílico ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (228, 'Alcohol corriente / alcohol etílico 96o ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (229, 'Alcohol etílico 70º ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (230, 'Alcohol etílico absoluto / etanol  absoluto ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (231, 'Alcohol isoamilico ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (232, 'Alcohol isopropilico ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (233, 'Alcohol metílico / metanol absoluto- bf. Produce', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (234, 'Almidón soluble ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (235, 'Aminoácido  hipoxantina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (236, 'Aminoácido alanina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (237, 'Aminoácido arginina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (238, 'Aminoácido leucina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (239, 'Aminoácido prolina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (240, 'Aminoácido treonina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (241, 'Aminoácido valina    ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (242, 'Ampicilina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (243, 'Anaranjado de metilo ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (244, 'Antibiótico (en discos de sensibilidad) ácido nalidíxico  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (245, 'Antibiótico (en discos de sensibilidad) amoxicilina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (246, 'Antibiótico (en discos de sensibilidad) amoxicilina-ac. Clavulánico  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (247, 'Antibiótico (en discos de sensibilidad) ampicilina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (248, 'Antibiótico (en discos de sensibilidad) ceftazidima  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (249, 'Antibiótico (en discos de sensibilidad) ceftazidima-ac. Clavulánico  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (250, 'Antibiótico (en discos de sensibilidad) ceftriaxona  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (251, 'Antibiótico (en discos de sensibilidad) ceftriaxona-ac. Clavulánico  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (252, 'Antibiótico (en discos de sensibilidad) cloramfenicol  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (253, 'Antibiótico (en discos de sensibilidad) eritromicina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (254, 'Antibiótico (en discos de sensibilidad) estreptomicina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (255, 'Antibiótico (en discos de sensibilidad) furazolidona  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (256, 'Antibiótico (en discos de sensibilidad) gentamicina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (257, 'Antibiótico (en discos de sensibilidad) novobiocina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (258, 'Antibiótico (en discos de sensibilidad) optoquina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (259, 'Antibiótico (en discos de sensibilidad) penicilina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (260, 'Antibiótico (en discos de sensibilidad) vancomicina  ', 'Frasco x 50 unidades', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (261, 'Antrona', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (262, 'Arabinosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (263, 'Asparagina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (264, 'Azida de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (265, 'Azul brillante de coomasie ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (266, 'Azul de bromotimol ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (267, 'Azul de lactofenol ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (268, 'Azul de metileno ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (269, 'Azul de toluidina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (270, 'Azul de tripan ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (271, 'Bálsamo de canada ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (272, 'Bicarbonato de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (273, 'Bis-acrilamida ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (274, 'Caldo azida glucosa  ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (275, 'Caldo BHI / caldo infusión cerebro corazón ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (276, 'Caldo brila ó verde brillante ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (277, 'Caldo EC ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (278, 'Caldo Giolitti y Cantoni ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (279, 'Caldo GN (Gram Negativo) según Hajna', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (280, 'Caldo lactosado ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (281, 'Caldo lauril sulfato o lauril triptosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (282, 'Caldo luria bertani', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (283, 'Caldo MRVP ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (284, 'Caldo nitrato', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (285, 'Caldo nutritivo', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (286, 'Caldo púrpura de bromocresol ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (287, 'Caldo selenito f ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (288, 'Caldo tetrationato ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (289, 'Caldo tioglicolato ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (290, 'Caldo tripticasa soya o TSB ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (291, 'Caldo triptosa fosfato ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (292, 'Carbon activado ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (293, 'Carbonato de sodio anhidro', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (294, 'Carboximetil celulosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (295, 'Carmin ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (296, 'Caseina', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (297, 'Citrato de amonio férrico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (298, 'Citrato de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (299, 'Cloroformo ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (300, 'Cloruro de amonio - BF.SUNAT', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (301, 'Cloruro de bario', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (302, 'Cloruro de calcio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (303, 'Cloruro de calcio anhidro ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (304, 'Cloruro de magnesio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (305, 'Cloruro de magnesio 6 aguas (mgcl2 2h2o)', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (306, 'Cloruro de potasio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (307, 'Cloruro de potasio (kcl)', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (308, 'Cloruro de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (309, 'Cloruro férrico', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (310, 'Creosota ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (311, 'Cristal violeta ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (312, 'Diclorometano', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (313, 'DNASA ', 'Unidad', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (314, 'Dodecil sulfato de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (315, 'EDTA ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (316, 'Enzima TAQ ADN polimerasa ( 5U/µl) ', 'Unidad', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (317, 'Eosina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (318, 'Eritromicina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (319, 'Extracto de carne ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (320, 'Extracto de levadura ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (321, 'Extracto de malta ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (322, 'Fenilalanina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (323, 'Fenol cristalizado / Ácido  fénico ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (324, 'Fenolftaleína ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (325, 'Fijador de bouin ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (326, 'Formaldehido ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (327, 'Formol ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (328, 'Fosfato dibásico de potasio (k2hpo4) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (329, 'Fosfato dibásico de sodio hidratado (na2hpo4.12h2o) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (330, 'Fosfato monobásico de sodio (nah2po4)', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (331, 'Fructosa', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (332, 'Fucsina ácida ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (333, 'Fucsina basica ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (334, 'Furazolidona ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (335, 'Galactosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (336, 'Giemsa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (337, 'Glicerina', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (338, 'Glicina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (339, 'Glucosa o dextrosa anhidra q.p. ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (340, 'Hematoxilina ', 'Unidad x cristales', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (341, 'Hepes ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (342, 'Hidrato de cloral ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (343, 'Hidroquinona ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (344, 'Hidroxido de potasio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (345, 'Histidina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (346, 'Ioduro de potasio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (347, 'Kits de análisis de nitritos', ' nitratos y amonio', 'Unidad');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (348, 'Lactosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (349, 'Lugol ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (350, 'Maltosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (351, 'Manitol ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (352, 'Medio esencial mínimo eagle ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (353, 'Mercaptoetanol', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (354, 'Naftol', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (355, 'Nitrato de calcio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (356, 'Nitrato de plata ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (357, 'Nitrato de potasio', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (358, 'Orceina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (359, 'Oxalato de amonio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (360, 'Oxido de mercurio rojo', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (361, 'Pancreatina', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (362, 'Para-dimetil amino benzaldehido ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (363, 'Parafina liquida / vaselina líquida / aceite mineral ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (364, 'Parafina solida', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (365, 'Peptona de carne ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (366, 'Peptona de caseína ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (367, 'Peptona de soya ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (368, 'Permanganato de potasio - BF.SUNAT', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (369, 'Piruvato de sodio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (370, 'Prolina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (371, 'Propanodiol ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (372, 'Rafinosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (373, 'Reactivo de benedic', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (374, 'Reactivo de kovacs (para indol) - BF.SUNAT', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (375, 'Ribosa', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (376, 'Rnasa ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (377, 'Rojo de alizarina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (378, 'Rojo de congo', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (379, 'Rojo de fenol ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (380, 'Rojo de metilo ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (381, 'Rojo neutro ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (382, 'Rosa bengala', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (383, 'Sacarosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (384, 'Safranina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (385, 'Sephadex ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (386, 'Serina ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (387, 'Silica gel 60 cromatografia', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (388, 'Solución salina estéril ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (389, 'Sucrosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (390, 'Suero fetal de ternera', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (391, 'Sulfato de amonio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (392, 'Sulfato de cobre (h20) ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (393, 'Sulfato de cobre heptahidratado', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (394, 'Sulfato de cobre pentahidratado ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (395, 'Sulfato de hierro ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (396, 'Sulfato de magnesio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (397, 'Sulfato de manganeso ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (398, 'Sulfato de potasio anhidro ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (399, 'Sulfato de zinc ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (400, 'Sulfato ferroso ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (401, 'Telurito de potasio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (402, 'Temed ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (403, 'Tetraoxido de osmio ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (404, 'Timina', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (405, 'Tripsina  DIFCO 1:250 ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (406, 'Triptofano ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (407, 'Triptona ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (408, 'Tris base ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (409, 'Triton ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (410, 'Trizol invitrogen cat15596026 ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (411, 'Tween 20', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (412, 'Tween 80 ', 'Mililitro', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (413, 'Uracilo ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (414, 'Verde de janus ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (415, 'Verde de malaquita ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (416, 'Verde de metilo ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (417, 'Violeta de cresilo', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (418, 'Violeta de genciana ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (419, 'Xilosa ', 'Gramo', 'Reactivo químico');
INSERT INTO `db749219188`.`quimico` (`codQuimico`, `elemento`, `unidadMedida`, `tipo`) VALUES (420, 'Yoduro de potasio ', 'Gramo', 'Reactivo químico');

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

