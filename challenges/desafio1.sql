DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `planos` (
  `planos_id` INT NOT NULL AUTO_INCREMENT,
  `planos` VARCHAR(50) NOT NULL,
  `valor_plano` DECIMAL(6, 2) NOT NULL,
  PRIMARY KEY (`planos_id`))
ENGINE = InnoDB;

INSERT INTO planos(planos, valor_plano)
VALUE
('gratuito', '0'),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

SELECT * FROM SpotifyClone.planos;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome_usuarios` VARCHAR(50) NOT NULL,
  `idade` INT(3) NOT NULL,
  `data_assinatura` DATE NOT NULL,
  `planos_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `planos_id_idx` (`planos_id` ASC) VISIBLE,
  CONSTRAINT `planos_id`
    FOREIGN KEY (`planos_id`)
    REFERENCES `planos` (`planos_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'fk_tabelas_pessoas_usuarias_1';

INSERT INTO usuarios(
nome_usuarios,
idade,
data_assinatura,
planos_id)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

CREATE TABLE IF NOT EXISTS `artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

INSERT INTO artistas(nome_artista)
VALUES('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE IF NOT EXISTS `album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(50) NOT NULL,
  `ano_lancamento` INT(4) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_idx_artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_idx_artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `artistas` (`artista_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO album(nome_album, ano_lancamento, artista_id)
VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

CREATE TABLE IF NOT EXISTS `musicas` (
  `musicas_id` INT NOT NULL AUTO_INCREMENT,
  `nome_musicas` VARCHAR(50) NOT NULL,
  `duracoes_segundos` INT(3) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`musicas_id`),
  INDEX `album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `album` (`album_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO musicas(nome_musicas, duracoes_segundos, album_id)
VALUES
('BREAK MY SOUL', 279, 1),
('VIRGOS GROOVE', 369, 1),
('ALIEN SUPERSTAR', 116, 1),
('DONT STOP ME NOW', 203, 2),
('UNDER PRESSURE', 152, 3),
('COMO NOSSOS PAIS', 105, 4),
('O MEDO DE AMAR E O MEDO DE SER LIVRE', 207, 5),
('SAMBA EM PARIS', 267, 6),
('THE BARDS SONG', 244, 7),
('FEELING GOOD', 100, 8);

CREATE TABLE IF NOT EXISTS `historico_de_reproducao` (
  `historico_reproducao` VARCHAR(50) NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  INDEX `fk_idx_musica_id_idx` (`musica_id` ASC) VISIBLE,
  PRIMARY KEY (`musica_id`, `usuario_id`),
  CONSTRAINT `fk_idx_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`usuario_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_idx_musica_id`
    FOREIGN KEY (`musica_id`)
    REFERENCES `musicas` (`musicas_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO historico_de_reproducao(historico_reproducao, data_reproducao, usuario_id, musica_id)
VALUES
('SAMBA EM PARIS', '2022-02-28 10:45:55', 1, 8),
('VIRGOS GROOVE', '2020-05-02 05:30:35', 1, 2),
('FEELING GOOD', '2020-03-06 11:22:33', 1, 10),
('FEELING GOOD', '22-08-05 08:05:17', 2, 10),
('O MEDO DE AMAR E O MEDO DE SER LIVRE', '2020-01-02 07:40:33', 2, 7),
('FEELING GOOD', '2020-11-13 16:55:13', 3, 10),
('VIRGOS GROOVE', '2020-12-05 18:38:13', 3, 2),
('SAMBA EM PARIS', '2021-08-15 17:10:10', 4, 8),
('SAMBA EM PARIS', '2022-01-09 01:44:33', 5, 8),
('UNDER PRESSURE', '2020-008-06 15:23:43', 5, 5),
('O MEDO DE AMAR E O DE SER LIVRE', '2017-01-24 00:31:17', 6, 7),
('BREAK MY SOUL', '2017-10-12 12:35:20', 6, 1),
('DONT STOP ME NOW', '2011-12-15 22:30:49', 7, 4),
('DONT STOP ME NOW', '2012-03-17 14:56:41', 8, 4),
('THE BARDS SONG', '2022-02-24 21:14:22', 9, 9),
('ALIEN SUPERSTAR', '2015-12-13 08:30:22', 10, 3);

CREATE TABLE IF NOT EXISTS `seguindo_artistas` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  INDEX `fk_idx_usuario_seguidor` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_idx_artista_seguidor` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_idx_usuario_id_seguidor_idx`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`usuario_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_idx_artista_id_seguidor`
    FOREIGN KEY (`artista_id`)
    REFERENCES `artistas` (`artista_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 5),
(9, 3),
(10, 2);
