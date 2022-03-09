-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Mrz 2022 um 15:57
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `booklib`
--
CREATE DATABASE IF NOT EXISTS `booklib` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `booklib`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authorsone`
--

CREATE TABLE `authorsone` (
  `author_id` int(11) NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `authorsone`
--

INSERT INTO `authorsone` (`author_id`, `f_name`, `l_name`, `alias`, `city`) VALUES
(2, 'Johann', 'Goethe', NULL, 'Frankfurt'),
(3, 'Terry', 'Pratchett', NULL, 'Beaconsfield'),
(4, 'Homer', NULL, NULL, 'Griechenland'),
(5, 'Joanne', 'Rowling', 'J.K Rowling', 'Yate');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_to_book`
--

CREATE TABLE `author_to_book` (
  `atb_id` int(11) NOT NULL,
  `fk_author_id` int(11) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author_to_book`
--

INSERT INTO `author_to_book` (`atb_id`, `fk_author_id`, `fk_book_id`) VALUES
(1, 2, 1),
(2, 4, 2),
(3, 4, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 2, 14);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `fk_owner_id` int(11) DEFAULT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL,
  `fk_store_id` int(11) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `subtitle` varchar(30) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `pages` int(11) NOT NULL,
  `chapters` int(11) NOT NULL,
  `start_reading` datetime NOT NULL,
  `end_reading` datetime NOT NULL,
  `times_read` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `books`
--

INSERT INTO `books` (`book_id`, `fk_owner_id`, `fk_publisher_id`, `fk_store_id`, `genre`, `title`, `subtitle`, `description`, `pages`, `chapters`, `start_reading`, `end_reading`, `times_read`, `type`) VALUES
(1, 1, 1, 1, 'Fantasy', 'Faust', 'Der Tragödie Erster Teil', 'a looong description', 135, 28, '2022-01-01 12:00:00', '2022-03-01 12:00:00', 1, 'paperback'),
(2, 1, 2, 1, 'Mythologie', 'Ilias', NULL, 'another long description', 448, 24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'leather-bound'),
(3, 1, 2, 1, 'Lyrik', 'Odyssee', NULL, 'a very long description', 336, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'leather-bound'),
(4, 1, 4, 2, 'Fantasy', 'Voll im Bilde / Alles Sense!', 'Zwei Romane von der bizarren S', 'so many descriptions', 625, 10, '2015-03-13 12:00:00', '2015-04-17 12:00:00', 1, 'paperback'),
(5, 2, 3, 3, 'Fantasy', 'Gevatter Tod', NULL, 'its about death himself', 336, 0, '2015-05-03 22:21:21', '2015-05-29 14:54:12', 2, 'paperback'),
(6, 2, 3, 2, 'Fantasy', 'Die Farben der Magie', NULL, 'something about colours?', 256, 0, '2017-06-14 23:12:00', '2017-08-11 11:11:11', 2, 'paperback'),
(7, 1, 5, 1, 'Fantasy', 'Harry Potter', 'und der Stein der Weisen', 'you know harry potter', 335, 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4, 'hardcover'),
(8, 1, 5, 1, 'Fantasy', 'Harry Potter', 'und die Kammer des Schreckens', 'you know harry potter', 352, 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 'hardcover'),
(9, 2, 5, 3, 'Fantasy', 'Harry Potter', 'und der Gefangene von Askaban', 'you know harry potter', 448, 22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'hardcover'),
(10, 1, 5, 2, 'Fantasy', 'Harry Potter', 'und der Feuerkelch', 'you know harry potter', 768, 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'hardcover'),
(11, 2, 5, 2, 'Fantasy', 'Harry Potter', 'und der Orden des Phönix', 'you know harry potter', 1024, 38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'hardcover'),
(12, 2, 5, 1, 'Fantasy', 'Harry Potter', 'und der Halbblutprinz', 'you know harry potter', 656, 30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'hardcover'),
(13, 1, 5, 1, 'Fantasy', 'Harry Potter', 'und die Heiligtümer des Todes', 'you know harry potter', 736, 36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'hardcover'),
(14, 1, 1, 1, 'Fantasy', 'Faust', 'Der Tragödie zweiter Teil', 'super dry description', 215, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'paperback');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `owners`
--

CREATE TABLE `owners` (
  `owner_id` int(11) NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `booksread` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `owners`
--

INSERT INTO `owners` (`owner_id`, `f_name`, `l_name`, `address`, `booksread`) VALUES
(1, 'Manuel', 'Widner', 'Ligusterweg 4', 40),
(2, 'Random', 'Person', 'Fantasyland 13', 255);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishers`
--

CREATE TABLE `publishers` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `publisher_name`, `city`) VALUES
(1, 'Reclam', 'Ditzingen'),
(2, 'Anaconda', 'Köln'),
(3, 'Piper', 'München'),
(4, 'Goldmann', 'München'),
(5, 'Carlsen', 'Hamburg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `ZIP` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `city`, `ZIP`, `address`) VALUES
(1, 'Amazon', 'Online', NULL, NULL),
(2, 'Thalia', 'Vienna', 1160, 'Mariahilfer Str. 99'),
(3, 'Libro', 'Vienna', 1170, 'Elterleinpl. 12');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `authorsone`
--
ALTER TABLE `authorsone`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `author_to_book`
--
ALTER TABLE `author_to_book`
  ADD PRIMARY KEY (`atb_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_owner_id` (`fk_owner_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_store_id` (`fk_store_id`);

--
-- Indizes für die Tabelle `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indizes für die Tabelle `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indizes für die Tabelle `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `authorsone`
--
ALTER TABLE `authorsone`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `author_to_book`
--
ALTER TABLE `author_to_book`
  MODIFY `atb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `owners`
--
ALTER TABLE `owners`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `author_to_book`
--
ALTER TABLE `author_to_book`
  ADD CONSTRAINT `author_to_book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `authorsone` (`author_id`),
  ADD CONSTRAINT `author_to_book_ibfk_2` FOREIGN KEY (`fk_book_id`) REFERENCES `books` (`book_id`);

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_owner_id`) REFERENCES `owners` (`owner_id`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publishers` (`publisher_id`),
  ADD CONSTRAINT `books_ibfk_4` FOREIGN KEY (`fk_store_id`) REFERENCES `stores` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
