1.
SELECT cities.name AS CityName, regions.name AS RegionName
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

2.
SELECT cities.name AS CityName, regions.name AS RegionName 
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

3.
CREATE TABLE `countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iso_id` int(10) unsigned NOT NULL,
  `abbreviation` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`country_id`)
);

INSERT INTO `countries` (`country_id`, `iso_id`, `abbreviation`, `name`) VALUES
(1, 804, 'UA', 'Україна');

CREATE TABLE `cities_metro` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`city_id`),
  FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
);

INSERT INTO `cities_metro` (`city_id`, `country_id`, `name`) VALUES
(1, 1, 'Харків');

CREATE TABLE `metro_lines` (
  `line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`line_id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`)
);

INSERT INTO `metro_lines` (`line_id`, `city_id`, `name`) VALUES
(1, 1, 'Холодногірсько-Заводська'),
(2, 1, 'Салтівська'),
(3, 1, 'Олексіївська');

DROP TABLE IF EXISTS `metro_stations`;
CREATE TABLE `metro_stations` (
  `station_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `line_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transfer` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`),
  FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`line_id`),
  FOREIGN KEY (`transfer`) REFERENCES `metro_stations` (`station_id`)
);

INSERT INTO `metro_stations` (`country_id`, `city_id`, `line_id`, `name`, `transfer`) VALUES
(1, 1, 1, 'Холодна гора', NULL),
(1, 1, 1, 'Південний вокзал', NULL),
(1, 1, 1, 'Центральний ринок', NULL),
(1, 1, 1, 'Майдан Конституції', 3),
(1, 1, 1, 'Проспект Гагаріна', NULL),
(1, 1, 1, 'Спортивна', 2),
(1, 1, 1, 'Завод імені Малишева', NULL),
(1, 1, 1, 'Турбоатом', NULL),
(1, 1, 1, 'Палац спорту', NULL),
(1, 1, 1, 'Армійська', NULL),
(1, 1, 1, 'Імені О.С. Масельського', NULL),
(1, 1, 1, 'Тракторний завод', NULL),
(1, 1, 2, 'Героїв праці', NULL),
(1, 1, 2, 'Студентська', NULL),
(1, 1, 2, 'Академіка Павлова', NULL),
(1, 1, 2, 'Академіка Барабашова', NULL),
(1, 1, 2, 'Київська', NULL),
(1, 1, 2, 'Пушкінська', NULL),
(1, 1, 2, 'Університет', 1),
(1, 1, 2, 'Історичний музей', 3),
(1, 1, 3, 'Перемога', NULL),
(1, 1, 3, 'Олексіївська', NULL),
(1, 1, 3, '23 Серпня', NULL),
(1, 1, 3, 'Ботанічний сад', NULL),
(1, 1, 3, 'Наукова', NULL),
(1, 1, 3, 'Держпром', 1),
(1, 1, 3, 'Архітектора Бекетова', NULL),
(1, 1, 3, 'Захисників України', NULL),
(1, 1, 3, 'Метробудівників', 2);

DROP TABLE IF EXISTS `interchange_stations`;
CREATE TABLE `interchange_stations` (
  `interchange_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`interchange_id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`)
);

INSERT INTO `interchange_stations` (`interchange_id`, `city_id`, `name`) VALUES
(313, 1, 'Історичний музей'),
(314, 1, 'Індустріальна'),
(315, 1, 'Інститут');

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_1` int(10) unsigned NOT NULL,
  `station_2` int(10) unsigned NOT NULL,
  `distance` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `station_1` (`station_1`),
  KEY `station_2` (`station_2`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`station_1`) REFERENCES `metro_stations` (`station_id`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`station_2`) REFERENCES `metro_stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `section` (`id`, `station_1`, `station_2`, `distance`) VALUES
(1,	1,	2,	1),
(2,	2,	3,	1),
(3,	3,	4,	1),
(4,	4,	5,	1),
(5,	5,	6,	1),
(6,	6,	7,	1),
(7,	7,	8,	1),
(8,	8,	9,	1),
(9,	9,	10,	1),
(10,	10,	11,	1),
(11,	11,	12,	1),
(12,	12,	13,	1),
(13,	14,	15,	1),
(14,	15,	16,	1),
(15,	16,	17,	1),
(16,	17,	18,	1),
(17,	18,	19,	1),
(18,	19,	20,	1),
(19,	20,	21,	1),
(20,	22,	23,	1),
(21,	23,	24,	1),
(22,	24,	25,	1),
(23,	25,	26,	1),
(24,	26,	27,	1),
(25,	27,	28,	1),
(26,	28,	29,	1),
(27,	29,	30,	1);



