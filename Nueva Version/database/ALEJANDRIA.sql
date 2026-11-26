-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2026 at 01:14 PM
-- Server version: 8.0.45-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ALEJANDRIA`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOK`
--

CREATE TABLE `BOOK` (
  `ID` mediumint NOT NULL,
  `TITLE` char(255) DEFAULT NULL,
  `ISBN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CHAPTER` char(255) DEFAULT NULL,
  `NAME_AUDIO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BOOK`
--

INSERT INTO `BOOK` (`ID`, `TITLE`, `ISBN`, `CHAPTER`, `NAME_AUDIO`) VALUES
(1, 'Queremos que seas Rico', '978-607-11-1612-3', 'Introducción', 'Introduccion.mp3'),
(2, 'Queremos que seas Rico', '978-607-11-1612-3', 'Capitulo 1', 'Capitulo1.mp3'),
(3, 'Queremos que seas Rico', '978-607-11-1612-3', 'Capitulo 2', 'Capitulo2.mp3'),
(9, 'El negociador', '000000000000', 'Capitulo1', 'El Negociador Audio Libro Parte 1  (Arturo Elias Ayub).mp3'),
(10, 'El negociador', '000000000000', 'Capitulo 2', 'El Negociador Audio Libro Parte 2 (Arturo Elias Ayub).mp3'),
(11, 'El negociador', '000000000000', 'Capitulo 3', 'El Negociador Audio Libro Parte 3 (Arturo Elias Ayub).mp3'),
(12, 'El negociador', '000000000000', 'Capitulo 4', 'El Negociador Audio Libro Parte 4 (Arturo Elias Ayub).mp3'),
(13, 'El negociador', '000000000000', 'Capitulo 5', 'El Negociador Audio Libro Parte 5 (Arturo Elias Ayub).mp3'),
(14, 'El negociador', '000000000000', 'Capitulo 6', 'El Negociador Audio Libro Parte 6 (Arturo Elias Ayub).mp3'),
(15, 'El negociador', '000000000000', 'Capitulo 7', 'El Negociador Audio Libro Parte 7 (Arturo Elias Ayub).mp3'),
(16, 'El negociador', '000000000000', 'Capitulo 8', 'El Negociador Audio Libro Parte 8 (Arturo Elias Ayub).mp3'),
(17, 'El negociador', '000000000000', 'Capitulo 9', 'El Negociador Audio Libro Parte 9 (Arturo Elias Ayub).mp3'),
(18, 'El negociador', '000000000000', 'Capitulo 10', 'El Negociador Audio Libro Parte 10 (Arturo Elias Ayub).mp3'),
(19, 'El negociador', '000000000000', 'Capitulo 11', 'El Negociador Audio Libro Parte 11 (Arturo Elias Ayub).mp3'),
(20, 'El negociador', '000000000000', 'Capitulo 12', 'El Negociador Audio Libro Parte 12 (Arturo Elias Ayub).mp3'),
(21, 'El negociador', '000000000000', 'Capitulo 13', 'El Negociador Audio Libro Parte 13 (Arturo Elias Ayub).mp3'),
(22, 'El negociador', '000000000000', 'Capitulo 14', 'El Negociador Audio Libro Parte 14 (Arturo Elias Ayub).mp3'),
(23, 'El negociador', '000000000000', 'Capitulo 15', 'El Negociador Audio Libro Parte 15 FINAL!!! (Arturo Elias Ayub).mp3'),
(24, 'LAS 38 CARTAS DE ROCKEFELLER', '111111', 'Las 38 Cartas de Rockefeller', 'REVELADO_ LAS 38 CARTAS DE ROCKEFELLER A SU HIJO [EL MANUAL DE LA RIQUEZA PARA QUE APRENDAS HOY] [h7cZOXcvrI0].mp3'),
(26, '¿Quién se ha llevado mi queso?', '2222222', '¿Quién se ha llevado mi queso?', 'QUIEN SE HA LLEVADO MI QUESO.mp3'),
(27, 'LOS DIOSES MAS LOCOS', '33333333', 'Capitulo 1', 'Los dioses mas locos LOKI Audio Libro Parte 1 (Pascu y rodri).mp3'),
(28, 'LOS DIOSES MAS LOCOS', '33333333', 'Capitulo 2', 'Destripando la historia KALI Audio Libro Parte 2 (Pascu y rodri) VOZ HUMANA.mp3'),
(29, 'LOS DIOSES MAS LOCOS', '33333333', 'Capitulo 3', 'Destripando la historia Rajin y Fujin Audio Libro Parte 3 (Pascu y rodri) VOZ HUMANA.mp3'),
(30, 'LOS DIOSES MAS LOCOS', '33333333', 'Capitulo 4', 'Destripando la historia Totochtin Audio Libro Parte 4 (Pascu y rodri) VOZ HUMANA.mp3'),
(31, 'LOS DIOSES MAS LOCOS', '33333333', 'Capitulo 5', 'Destripando la historia Apofis Audio Libro Parte 5 (Pascu y rodri) VOZ HUMANA.mp3'),
(32, '', '', 'Capitulo Final', 'Destripando la historia Amaterasu Audio Libro Parte 6 (Pascu y rodri) VOZ HUMANA.mp3'),
(33, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Prologo', 'Prologo.mp3'),
(34, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 1', 'Capitulo2.mp3'),
(35, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 2', 'Capitulo2_.mp3'),
(39, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 3', 'Capitulo3.mp3'),
(40, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 4', 'Capitulo4.mp3'),
(41, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 5', 'Capitulo5.mp3'),
(42, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 6', 'Capitulo6.mp3'),
(43, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Capitulo 7', 'Capitulo7.mp3'),
(44, 'Las Lecciones del Tesoro Inteligente', '4444444', 'Epilogo', 'Eplilogo.mp3'),
(45, 'Bajo el Cielo de Cristal', '55555555', 'Capitulo 1', 'Capitulo1.mp3'),
(46, 'Bajo el Cielo de Cristal', '55555555', 'Capitulo 2', 'Capitulo2.mp3'),
(47, 'Bajo el Cielo de Cristal', '55555555', 'Capitulo 3', 'Capitulo3.mp3'),
(48, 'Bajo el Cielo de Cristal', '55555555', 'Capitulo 4', 'Capitulo4.mp3'),
(49, 'Bajo el Cielo de Cristal', '55555555', 'Capitulo 5', 'Capitulo5.mp3'),
(50, 'El Principito', '6666666', 'The Litle Prince', 'EL PRINCIPITO AUDIOLIBRO COMPLETO EN ESPAÑOL _ ANTOINE DE SAINT EXUPERY _ NARRADO CON IMAGENES [_LyQH01rfo8].mp3'),
(52, 'Mi Lucha (Resumen)', '1945', 'Resumen', 'Mi Lucha - Audiolibro  Adolf Hitler (Resumen en 15 Minutos).mp3'),
(53, 'Como Hablar Con Cualquiera: 10 Consejos Secretos Que Desearías Saber', '978-8396951533', 'Completo', 'como hablar con cualquiera - 10 CONSEJOS SECRETOS - audiolibro completo en español [0oPgjRswQn8].mp3'),
(54, 'Seminario Fenix', '777', 'La Psicología del Logro', 'https://afp-78245-injected.calisto.simplecastaudio.com/6a9ed930-e735-4e6c-be9d-1f3787ffe85b/episodes/1bf13027-bd81-47f8-bebf-82f169b625cf/audio/128/default.mp3/default.mp3_ywr3ahjkcgo_2c67ee0335d383539789d7defee52d86_19053479.mp3?aid=rss_feed&awCollectionId=6a9ed930-e735-4e6c-be9d-1f3787ffe85b&awEpisodeId=1bf13027-bd81-47f8-bebf-82f169b625cf&feed=RR_j2pGA&pscrb_ip=2806:10a6:1a:f174:6439:6e1f:cc52:6d13&hash_redirect=1&x-total-bytes=19053479&x-ais-classified=streaming&listeningSessionID=0CD_382_58__c6bfa137cfa931305affdfb9a592df2748f7cc6a#t=93'),
(55, '', '777', ' Leyes Mentales', 'https://afp-78245-injected.calisto.simplecastaudio.com/6a9ed930-e735-4e6c-be9d-1f3787ffe85b/episodes/24c2e213-11b0-41f0-b38a-cb5fbf72d219/audio/128/default.mp3/default.mp3_ywr3ahjkcgo_8a4dc59481766a7c2629c51f879570b1_32774983.mp3?aid=rss_feed&awCollectionId=6a9ed930-e735-4e6c-be9d-1f3787ffe85b&awEpisodeId=24c2e213-11b0-41f0-b38a-cb5fbf72d219&feed=RR_j2pGA&pscrb_ip=2806:10a6:1a:f174:6439:6e1f:cc52:6d13&hash_redirect=1&x-total-bytes=32774983&x-ais-classified=streaming&listeningSessionID=0CD_382_58__3a3434bc3acc8d210d0bca3e0a73379f12970461#t=93'),
(56, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 1', 'capitulo1.mp3'),
(57, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 2', 'capitulo2.mp3'),
(58, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 3', 'capitulo3.mp3'),
(59, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 4', 'capitulo4.mp3'),
(60, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 5', 'capitulo5.mp3'),
(61, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 6', 'capitulo6.mp3'),
(62, 'El Capitalismo y sus Bondades Una Mirada Positiva', '6666666666666666', 'Capitulo 7', 'capitulo7.mp3'),
(63, 'El bosque de los colores perdidos', '777777777777', 'Capitulo 1', 'capitulo 1.mp3'),
(64, 'El bosque de los colores perdidos', '777777777777', 'Capitulo 2', 'capitulo 2.mp3'),
(65, 'El bosque de los colores perdidos', '777777777777', 'Capitulo 3', 'capitulo 3.mp3'),
(66, 'El bosque de los colores perdidos', '777777777777', 'Capitulo 4', 'capitulo 4.mp3'),
(67, 'El bosque de los colores perdidos', '777777777777', 'Capitulo 5', 'capitulo 5.mp3'),
(68, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Introducción', 'Introduccion.mp3'),
(69, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 1', 'Capitulo1.mp3'),
(70, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 2', 'Capitulo2.mp3'),
(71, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 3', 'Capitulo3.mp3'),
(72, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 4', 'Capitulo4.mp3'),
(73, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 5', 'Capitulo5.mp3'),
(74, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 6', 'Capitulo6.mp3'),
(75, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 7', 'Capitulo7.mp3'),
(76, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 8', 'Capitulo8.mp3'),
(77, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 9', 'Capitulo9.mp3'),
(78, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Capitulo 10', 'Capitulo10.mp3'),
(79, 'EL PODER DE LOS HÁBITOS', '44444444444444444444444', 'Conclusión', 'Conclusion.mp3'),
(80, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo1', 'Capitulo 1.mp3'),
(81, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 2', 'Capitulo2.mp3'),
(82, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 3', 'Capitulo3.mp3'),
(83, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 4', 'Capitulo4.mp3'),
(84, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 5', 'Capitulo5.mp3'),
(85, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 6', 'Capitulo6.mp3'),
(86, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 7', 'Capitulo7.mp3'),
(87, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 8', 'Capitulo8.mp3'),
(88, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 9', 'Capitulo9.mp3'),
(89, 'El Umbral de Neuschwabenland', '0-0-0-0-0-0-0-0-0', 'Capitulo 10', 'Capitulo10.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS`
--

CREATE TABLE `BOOKS` (
  `ID` mediumint NOT NULL,
  `PICTURE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `TITLE` char(255) DEFAULT NULL,
  `AUTHOR` char(255) DEFAULT NULL,
  `ISBN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BOOKS`
--

INSERT INTO `BOOKS` (`ID`, `PICTURE`, `TITLE`, `AUTHOR`, `ISBN`) VALUES
(1, '../images/book.png', 'EL PODER DE LOS HÁBITOS', 'IA', '44444444444444444444444'),
(3, 'https://m.media-amazon.com/images/I/81MdxBJZZIL._SY385_.jpg', 'Queremos que seas Rico', 'Robert', '978-607-11-1612-3'),
(6, 'https://m.media-amazon.com/images/I/412Wo+UyN0L._SY445_SX342_ML2_.jpg', 'El negociador', 'Arturo Elias Ayub', '000000000000'),
(7, 'https://m.media-amazon.com/images/I/71FTHBf0XNL._SL1499_.jpg', 'LAS 38 CARTAS DE ROCKEFELLER', 'Jonh D. Rockefeller', '111111'),
(8, 'https://m.media-amazon.com/images/I/71vhymd5aCL._SY425_.jpg', '¿Quién se ha llevado mi queso?', 'SPENCER JONHSON', '2222222'),
(9, 'https://m.media-amazon.com/images/I/81BntxtjGgL._SL1500_.jpg', 'LOS DIOSES MAS LOCOS', 'PASCU Y RODRI', '33333333'),
(10, 'https://preview.redd.it/m2budpjq6grg1.png?width=848&format=png&auto=webp&s=66d47a4724c6e70d66e2043e0c5756c358e346d7', 'Las Lecciones del Tesoro Inteligente', 'IA', '4444444'),
(11, 'https://preview.redd.it/r90n539q7grg1.png?width=768&format=png&auto=webp&s=63b9f3dc9c9bd82823cdc5c9f19371ade2b0e840', 'Bajo el Cielo de Cristal', 'IA', '55555555'),
(12, 'https://m.media-amazon.com/images/I/71RXYyYp77L._SL1500_.jpg', 'El Principito', 'Antoine de Saint-Exupéry', '6666666'),
(14, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARYAAAC1CAMAAACtbCCJAAAAilBMVEX///8AAAD5+fm3t7fq6ura2trv7+/y8vLR0dHf399ubm6np6efn5/29vb8/PyJiYlSUlIgICDCwsKVlZWtra3m5ubS0tKrq6szMzPKysq6urpISEhjY2MVFRWBgYGXl5dAQEB5eXkpKSkiIiJbW1sLCwsrKys5OTlLS0tZWVl9fX0TExNra2sxMTHeagPxAAAXx0lEQVR4nO1dh4KiyhJtskhSgoqigjnN///e7eoATZTZnRkX55737u7siEAfqit1dYHQ//gfg4JqH86n9ZRgMUbyzHz1Hf0DGE2kEnQP/xG/+q5eDQeoGKtRZGqaif/T0IGQ8+r7ejE0IiKTxy1ESAlc/ovHq+/rxVDy2bN0JenKWJEk49U39loEhVbRLpIS83+Er76x1+IhaNs4KkjKXn1jr8VJasbi1Tf2WrSwIt1ffF9yT/Dj3ZYPfSVUlNCuods3U8tkbExdj8yZj30Xt+UbTowvY1Uugi+tyO1jcT4zUHrhadvzapBqv+3DFKF56xe7tGdcO3y6uiaZgc7Nx88ubZdZN52MAU5md4ytBJ9caNv3cDx0lLR9iN3SrPWb63aJCWsH35aapuLbajx83H572KLvOj7rzYrELnXue/wKH5y2fah3cNbhhXjVI7lOUT/JStTxqSm6R8+g8Ysd+n4DXM82Id51nmjTRsu1dmiHH6e331rUIfZax/SqYVRczur7nazjiaVdT/OjbaTr2qFKOy2tqm2vt+u2Kf5s1DkqAdfSQzFqstyCBLXLI8yxthl8bBmoWz+0IxpqoyXruDJ8tuweVI7JqHpFdz6+XlYp/l+bf8XGFwGJzdYLPlObBSZtGajZcGw7Lc1T4QDaoGX+jkHZW9P9dLdb4/833/Zut0tXl0f4N2EYcyccRzXrgE9kzQ/D0N56t01x6TZXvuk5tudaBCfnsfG2Vqgs/VHE7seo3oyqOn8xzm+Elo+izXVpUpPj9hPmx3jfcr9VOLquqz2BDwVpg4xRCfiXhqoKv8aqbsaHEbVcuHHKtd8ndwFA+MRrq2DO8QjKd4RvwFX7jwwGVpKvBsXXDTyTVg0PuaK4BcPYNs5F09mXrbSwABsUf/n6a7dBTfmdjk4jylKtPv9CCV45IZCfUSt7NXFuttomUePZp22sOFTVX7AC+xC/8EGIrD0oE0WfHJdduaB6/Nz39apB3DLxKwtMmHv31QtStFjOSXOYyOQhxfPlXjqefe5XfMOGZ9eNBpdp8/xbAjJkCP96QHTlWIu0No/snJcmRdrukTfNI8Yhdo+qQuDiyZqAATMsQWSsRvPfjqQxrW7YfWNpgMo9x+mNRJwRobUe43i5D53WzGWXD1lnkR29EhQ5h0sI3ocgZLqS5Gdojbbr2G/aw9nCjMwoRiXEccx+0kzIsGh+bJKxmlbK78QIKss+40IotPLV6uGQiGn5NmV22knN1/2AATG5SBTyxGXDMIAiMC6dcAjaMjt/CNeJtDgMCgeTuokf5du+FryICkbdP3uA4kznHtChPvMo2VlO5yNQRlr0ZetMwem0m96n030/7TuuWb8z8RMQqoiLlLr5Az7kV+sTvN3yo3ksO26IfVTsV6O6Y2ggc33C2AH2OabN2J8+0mZaOqL2RpiVFBK2OlEG6iWrHrlzcnXAE1L90h8py5RyL27TpI8ibC32+OJ66SkdO1JDzWjLfWjPvyriJsZnU3xfJlEW+ETOqBqTqYXxmBPJ7HsR8I41Lr5B3T3zDH42PEHVrPhA659MoGhfgHFunzpRLtxTDwfkLr1j6rfVQh2z8IyukdutbEsI1ZzCsEFL0xuncoGNurykd5EYXTnUBqSdtQDy/BN3THwLLR6BMdIZEaAmTaMhMTJCTmumtR/8hmlxpnqFqbOUuApGNCIJz/5n3nvPK0ccpQVLXwD8m9tbIw54OniGCUqkXdN8XDZ455/BrInXDIIuCxWikdgaN7dh20CqaAtj/xwmNs+F4bro1FCMG9cK55058GeIkN5gIUfEUOy1Uhixwyb6i8fp2FZv2HJJdR6xPKhEbMBncIwaB8FnI4wCU73BkZ8RNymDH7HAuKVz4+fzGPfFw3/Ky2duNhGCkyPoWpplZo+qnmG8fcIElYA9n5rDT1LHAOIWToxSvjT4nB1qz2Rw1C/fAZ+bnDNQEVHdQfmxm9afko61xw4cGpPbMXKkFOsFh05Y8KDVIm6617/QiqDHNJI/YaWnWCa8R0aWmY0bv1tiGCBTFG6rztelY1GjFVl97TGxfJU6oCD/zH2yiIza263yiaVSLIpaFx0Feq+OYB+EL9ibGf0FBADEYjA/oGo8zu5n3Sxp2zBIpgwgQgYp4bFBwI1Kf5nsdlgqEhMmLYsHVeAnqfvWmIssZJ6JbsRqJPKUhol0cj6ZBbGaFLWGoofN8i7gtJuc/tMtCF0Urdd9kiTrlddTUupwjS44YmR4gosQTfsgUU+K/xxXXbCj/qlUYkM+9rCxSYLlQ6f+EYk/BYGqrYGxgRRFGj+B/IbI3CYTMKNyzVJJ1TS2/omo1Ko7/PQBm/RMhOEp/ErNj/vOwTqHBCz65AlWGi2sxSoAHkR4ZGMh3hXYvVndKO8/Ea9E9XQspgRUCMySD6wISXZnTEJK6inNe8TOR4y19NxdaeClmjZpvXHd2lrkCiHVRzELxrGdklf4LmuyYfZXifUhzsG32jLiwd5RMhKwhqpi2XFvZ7plsj1DvSKnESwP5rDJdFJ5igIL0p2utJvLktb0e1ujSdm/PPggFeBaeWxywdmZHbrwh9/Pw3j8sZqp++9NmOLzyzGXdUhbUNfERi4IekLPJc6kgE+8pwhKK1is7IEo9TmSye8wcXlCZr2NUE9Hev9Xmwq0PsRchfUYP7+vMYuYN5ABh1KpItKbNJW1NGIphhApnidLn6/1xczQT4GK/DajXu7i6a9roeWlMreswOvAJvcsEmyvnQsf+pjdfsgTgibPLPQuwDJzOzcjZzCIo0y1nsopgzHyABrbJn+plALaQMAW/0Lxvz6T0AJqJ/3i/s58ytMifp6sZosCWt+QMZcDph4dqdgWsHZ5RjgBNUE8g58pZGDQ41E3NKTaNpAis1FgfaPxxwd/YpM9W2BtI6dS5kOM3a8+6QNm20aZ7GfI2N1B5GAmzlFGPp0UVgFY0y0bK/l6XXCpdleZfSEvT5dymePG5/XaYQoR80GGQL0bVkBn4YfaLwAY46+t6ZfAdnls8jnMPHnCSgkNzp6z/ZW0PNdjJ1kwXHeDB0MTNn5qNaHgWVGQi4fbz8+1sHoNURRobF3JoKtEY27gFaEaEjTM06mZfbXz/yxS/yi4Oxq5SjWoesyoRb4SbamgeMSF6QnwvLSI5+LTOblhVkjjy0WjYh5dn9/jrbHW9+/gzrvLmhOuHs9yrih9ltUy6XP0yF90QaYXLcS5IIQwT0emTtw5D7S0/GnoT3zEtf1dlXRR0LVu7CN3zUbNoraMzaUHY8FH0h/QQqZhSD0dm01KJZ+FWKAisG/Lbl8o+1KdUmdm3lp2tYMEeYh9gpjd355Pdp1JukwevIfktdaPlhFKPSonB+bS8yhTz7Xr2IGU3Khj/TYN/jD6+Rz0OPSyyWpRXaBg/nTOG/c4PZZZPdAIcY71ptLPzZ0hIILyQadIyGbTQojCWYK6UiixTyfJxgt/zncrwTAiVgbLQsY84vW5F8rVok/1b4wumJrKIJoBQqXRM85ohl/iJQsToaiHLTWoZgRQaW3LPwaeDQr5IoLCnved1ZWBg2f1KycwEXw9gx89xq3NN0BdiycwhE32JGyWjiPOyooXX8zZcwaW7FoRTDMtLvBh5V8DyNziXPmJn6/y/AtwNwtYpuPL0LyG40g9d2yWZkBLr5yFKkNoSGnwmbjc8oQKdgl0O5kMqu8AT2NbXNYVpoCJ0AT9aNGdQkwmfElslO8j/NHA8GvAPJwxf7Y7XrAQwd9Bv4pZxyE0TNgXmU1W89zUEJRKGXQIlzxombFZtSMW1utXdS7DsQHzSDIud1M+Qz/k5/fxr0EPrlcrX6C/8eTRlgzSQ1lvWhZ8S0IuJViLm97jZ5y07wFLIOzy0kqdRJGbfiUdrkPpoBwmeVyYvHpYfwkeuRhc2Ryol7rprOCu0GJzWx/mhZbzVw/s70Dt0crJvbwR1TU9aaEc3vOl7JjLywBtUAl6EEAYx+1xyqytV8+N7E6nUzVAZ2kZK48LMS/uMtgOWKuUkLFhaeynbbkY+1aE/TPRoeHZKj1fxx6eSe4A32QT8JyRJdKyc5EaY2hapMpi5vHIHf5V7qk0txgYKvg6I19N1ERaLqXMtJA3XudeYYAi4rO0br4fKNxYGbl5zJuWdjSsxNXutUDLtMgPawipfvym7cXYVFg4pf4FJVp2ZVr4lHo3ManADL0xqSzoQ8seDtRD24oH6OX/Gdpo+ajS8rvQplvO/9PSREv6u2nhk+hYoeXyu2khTHxE8EOJlgnQYmux9ztpIR6coW6RW6YlwbSskB6BOO1efZM/j5hQkEoKKtPywLQk2OfXtY7OSe8LSKFYCGLp9UWkJcO0PPDvfbO9RdAbA9J2sFR/QNOJGBONsRzNgRbnV/bMhZQBqWpCcYxlh+9cWJtItyGpt0THP6qyHjrGR4XkojZLsnhOY585Qo45mqcwuTTr1bf4GhQJuomlIiNbW8gvklCDWiz8OlRK5xeQd9tj927FSzxOv3AOaflumlTTtfA2TmYIRdYINqtqPKV7/22Np0GTrDcBLCrT1JKjRlHex6vYP3L/VRIDuV2o1XlAQOQezCIOSlF8Ij4NfDzKpF9ljVS6Uw1lYHE8HB7m24wTdJBMSOIhR9Ewf9tvqBn9p6FJZ1hDU8B3kfPqZez0Ei9vAr/+3urIfxPYgQMTbcLC4ygvvLQRrKliemBaLZGaJbdfM42khwbVLhYUL8gxCY541aYfwerHWRrNSWEC+V2fTe3vgDspaXLIcgfxXzZ5Kd0ohrDoKsme0PHoHyyc/GLICykCTQu8wD6pIx76ZnxAj81YsqRQUu1Ak5y1BMWl+VYs5K7S96YmpjEyuC17ycPSYGE3318jz4olWUKSPJ7V9jFmIFHvrWFMsMGVhqumKSELC4mBaUGTWa0dqw3e3ztLSwQe3KyyD+KMbbUbJ7oUSeiIFsvadgAPbSBw3Hx1C59/BDJWGaRBT94lNF2aqgGhgKPh2TSWRgu0SJHmBaHi05rDjztYJC8hy9fvKTFkaSjU9XgvzWWSXyFtMbWA1Q5KNLu7UuJ46bPiBgX5U1LUAov6/2hr7b9EXnOKzQp1a/PNhchN9x+r1WqblzHzYkQfhMm2yc6J91yJ5hXKY8S7gp1dEAZpL5iZiHgway3v/GLnjZmOaLb6434r/yhshdecekL7TNjs6TKVobGEnGxqEecQUlIHFzlEhhZgqN8rdPQxGzZnBUfIl8OFJKKKpw+F2UWi0mQfklJNrFviBfjCPn2lztvAgOw18eICGCrtD+v6dqEt6EQpeAl32ARlFhUx+LW2dEk08E6J7wk8cpg6IRELPL7DuBQB8oSLmNh2wMGlMy+fOh1vuRoeQloiednN6GTRScGCML6i253o5Ju2yzQvZiu6naVLjKZdb6QZFhxhtLQPkIOMpbC3UuwBWHZONG6NWDCNDfiP3fZ3Yw6KMiD9m3gcWDIoIiuVemT9utjAxOLFuihRkPEuVvqRkDjIRrwsu9TKuIMVgAt0sk3OKVLBSL1LLTd7w8cG87KdTMpN8EbdrACfCi+Ph8X63VtYI3dKso50FjSoy2eskDXZMd/9TavL3mAhFqZIumS6ATpFZHb1405WMBEHeCmysC/rHcqBxGTbnC0NFWiRlbC6t9lUhNYFb7FvRthQhYVF10QL3MKKUklSlluQPDBJP3Tv3wZZ7MtdTci2s1I+ljfboH1NHXn4md17WnknlGCFulgp83LmcvIB/nI0/HxUgq0PqU9gwxf0bTcrZV5C77AGt8WiS7DDf+P6KoX4OYE1s50iDkdsYS44vUJ3mspUURckZ2cj/QD7zocMEg664GkkYIFcYQrpQmebor6n1LNH4GW7iTAnZNMi+d6g42gDXhMVJ+CGrXEQuC31+HWmdV4qnYwKXjbQjwSbZlZwN/AN4mx4pNGciqx1aV44NXmp9XcqHe8XvXIGrnQ9PjqF9KGpQOQFNsI3dL3KeYm9hLTbIr8dfAwdk5StTBc6att1xXk0b+4FxnkhR15pbxwFapoHDF0nj5dXqrBgRrDGorxkxY+7fY0XFwRvTfbfH8CKDXnRaIltRwI2lWTwWTA0EqMip6kh/9ER39rI5cVIgQwbzJqUDDsuiiPwUDVYPdwx52QkSU94gaaYegMvEZxp9h5ZKHBxIWlydBH0nma+rchLtTPfkTh9DbyooFWwEzSBl0a9YChfhhGpaNpAPuGIGXILj1/gRZ42sNLAy/JElploPVnbW9oHgYwMISZjIa2GC49flBfx3Vf7PECo8gIttyZs8+diyBqXalp4sFALBypBIEDgRXwbgmB5BV6IcHhSotJzDH0Dln6lXQSj5E5fXXpu4KW8WaSJlx2efrkLJ29HyJgMfJuEXrTRUGFdvc5L1Yur87KDKUP2/2rezYYo8dT1Rvp/HvoCRMTxaXtW8gqHGi9137bKy54okhDeWUk+JypqyG7uDPxSMjQT1C5dX01LvDS9qUQYskFnEANdQFB5NmqoiGEMRByW+C/uhgm8BM0t6EV5WVGjM1Jc3tWS0PPzg/k6aPBUY/qER0VqrrHZ+drcN/LCgGOIMXVZltCg/FA7YECQSSIFRJ9MhDlfyGhoInx0Sn5djZdcBdXzE8ODR/K0Y+qP6UV3wRovd6Kbu+SF95h+TXPtL0Zsswo4z7uS10IwpA2slOPGEi/m2OWuIKZleb6hNwDLNO7FvHSJlztPQorzSExamfkbISjSH7v374E20swlG6uKDKFHZ9rACkKusNYs1msURakEQ996lRVDgbbR4rJ8zstdWD4Sel0K4SBdSNmsednCkF1cAt7saD3BJiRelz5La7IivjNGUETY50t0eYbFDeuod0hCITd/n8h4DatpmqhfVlVWBFk5iwfKZGptMMkhUm3PG3icSODMtmvpiH2YGGz0SvwoLc+gFlkxQ5rCk9ERyqGyx2PwhRwMF8yJLcXatLLylUrPZxDy6Rt9yE7Yn7ndH0BiqRAcXdiiSLlo3xW6dwYtMwjPLaypgSlM6i20vbeQFQmiGA1Ku4j/7iG/OT3dJisGSeTKONDM/f932Caixia8IQ/EJCUUKVnTYW2s4Ck0xcZnvMmb577BWisFzdWGpDi3Zd2rlRWyLAmdB7CwZNl4cjoe38LzL3bjuTB46p9WKw7aWFFHzLnFf7+LkHD4K+rR3+g0OmOvQyp7Hl6brGDrhZzrEbzjbYqN8y3bDr9ATIQer6UZDgWvvgqpyPKTL/JSld1l89yAGxJ7N+y7NVrWi/JrA6sKXfTiV02yghkJ8yK5G62AGgWDLg8rI55kKowMTLNi00WffakWY1VnxYWXzeBvbDP4Gp6H3/ZmxFfBzECXWPDA96zMxQQ1ahQSsyrPoBhqE0YopOuzK5e9Wq/Rtg8b8Z1XPEFe4AL5t62QN1mVZGVlYYfFRW7+RuPR9B1pMSZkcKW3zU6QnSAn5VOjSKLMfTTFMRRNQxAnDvLasvNukwh6goWkLX3pJbyuKkUmFRJd0+CliDREOgagbhOifKjtHno27hlKbzxWkCbP6No9S0iStENAirSx8jnebhMeBcnndNV96qEiGG9l5NgkMeUTKYiJCwyWl2XqTohWBh3mRKw20ZYLS/Im+4jqgN27AZ4Y0QWqJZHP+2TBSzF4xh8VTW8W0CZWmo9GsLBvvy0rWMGcqDEx6QxC6pZ2/HSLvkg6ewPWYgu2e0aLHEhDkzeLiErIyDIHTeCnMFDVOkDCLt+6p2GZ2t+WRPWaD2LLZc/eSOc3fdsMgzIRNhKltITSLF5lCuqXmeElXV2Ff8XBoAsre4LG01k4x55rQDNtcZJJK1s6bdkS6yzjPE39QVcPfgLgx5PEArHWE0jNWqYKxdlbBG6svsUKeBP7SkDt01usDD2HQdZ5liNudLAl8gwkRWi6RAlrrcXKNRzvzTrZPMMDSwd7DfADeyUOwkYojYGWmDkwGlEoxi+RFYalxeQiUHE8eMG0qOgco6vLXngGlnr3W9RKGdhQP2Qc9YzQWoZULbZDdwd9+OoalI97HPx25z9EpLKOG5KmwZ821jAuZBys7HfNnTrmYGoW54V0x8HAVdIM6fc0VO4CdO/RtoF3u202G/t3qpP/MWD8BwKXVqxDy2NZAAAAAElFTkSuQmCC', 'Mi Lucha (Resumen)', 'Adolf Hitler', '1945'),
(15, 'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1529542590i/40593051.jpg', 'Como Hablar Con Cualquiera: 10 Consejos Secretos Que Desearías Saber', 'John S. Lawson', '978-8396951533'),
(16, 'https://m.media-amazon.com/images/I/51zvChC9A9L.jpg', 'Seminario Fenix', 'Brian Tracy', '777'),
(17, 'https://preview.redd.it/hiclwbjs5grg1.png?width=848&format=png&auto=webp&s=fb3c014d5caab9e04556f85ffecabe0978a9ea28', 'El Capitalismo y sus Bondades Una Mirada Positiva', 'IA', '6666666666666666'),
(18, 'https://preview.redd.it/y3jgtedc7grg1.png?width=768&format=png&auto=webp&s=3b0e37c658c291f02f40c634864215c8de7fc6d5', 'El bosque de los colores perdidos', 'IA', '777777777777'),
(20, 'https://preview.redd.it/x612e0b08grg1.png?width=864&format=png&auto=webp&s=0228d88acda05a8475511b51dc15479f1c34b9cf', 'El Umbral de Neuschwabenland', 'IA', '0-0-0-0-0-0-0-0-0');

-- --------------------------------------------------------

--
-- Table structure for table `NAME_PROJECT`
--

CREATE TABLE `NAME_PROJECT` (
  `ID` mediumint NOT NULL,
  `NAME` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `NAME_PROJECT`
--

INSERT INTO `NAME_PROJECT` (`ID`, `NAME`) VALUES
(1, 'Alejandria');

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int NOT NULL,
  `user_id` text,
  `monto` int DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `user_id`, `monto`, `estado`, `stripe_id`, `fecha`) VALUES
(7, 'emmanuelacoltzi311@gmail.com', 60, 'pagado', NULL, '2026-03-17 18:24:12'),
(8, 'basedeemma@gmail.com', 60, 'pagado', NULL, '2026-03-19 18:40:37'),
(9, 'emmanuelacoltzi311@gmail.com', 60, 'pagado', NULL, '2026-03-19 19:42:15'),
(10, 'emmanuelacoltzi311@gmail.com', 60, 'pagado', NULL, '2026-03-19 19:42:53'),
(11, 'basedeemma@gmail.com', 60, 'pagado', NULL, '2026-03-24 15:50:53'),
(12, 'basedeemma@gmail.com', 60, 'pagado', NULL, '2026-03-24 18:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `ID` mediumint NOT NULL,
  `USER` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EMAIL` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`ID`, `USER`, `EMAIL`) VALUES
(1, 'Emmanuel', 'emma@gmail.com'),
(11, 'IT', 'juanirvingtapiaortega3@gmail.com'),
(12, 'Jesus Angel Rodríguez Fernández', 'jesusdx086@gmail.com'),
(13, 'Brandon', 'hola@gmail.com'),
(27, 'emmanuel Acoltzi', 'emmanuelacoltzi311@gmail.com'),
(31, 'emmanuel acoltzi', 'basedeemma@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOK`
--
ALTER TABLE `BOOK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `NAME_PROJECT`
--
ALTER TABLE `NAME_PROJECT`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BOOK`
--
ALTER TABLE `BOOK`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `BOOKS`
--
ALTER TABLE `BOOKS`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `NAME_PROJECT`
--
ALTER TABLE `NAME_PROJECT`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `ID` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
