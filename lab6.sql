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
CREATE TABLE `metro_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`line_id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`)
);

INSERT INTO `metro_lines` (`line_id`, `name`) VALUES
(1, 'Холодногірсько-Заводська'),
(2, 'Салтівська'),
(3, 'Олексіївська');

CREATE TABLE `metro_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`line_id`) REFERENCES `metro_lines` (`id`),
  FOREIGN KEY (`transfer`) REFERENCES `metro_stations` (`station_id`)
);

INSERT INTO `metro_stations` (`line_id`, `name`) VALUES
( 1, 'Холодна гора', NULL),
( 1, 'Південний вокзал', NULL),
( 1, 'Центральний ринок', NULL),
( 1, 'Майдан Конституції', 3),
( 1, 'Проспект Гагаріна', NULL),
( 1, 'Спортивна', 2),
( 1, 'Завод імені Малишева', NULL),
( 1, 'Турбоатом', NULL),
( 1, 'Палац спорту', NULL),
( 1, 'Армійська', NULL),
( 1, 'Імені О.С. Масельського', NULL),
( 1, 'Тракторний завод', NULL),
( 2, 'Героїв праці', NULL),
( 2, 'Студентська', NULL),
( 2, 'Академіка Павлова', NULL),
( 2, 'Академіка Барабашова', NULL),
( 2, 'Київська', NULL),
( 2, 'Пушкінська', NULL),
( 2, 'Університет', 1),
( 2, 'Історичний музей', 3),
( 3, 'Перемога', NULL),
( 3, 'Олексіївська', NULL),
( 3, '23 Серпня', NULL),
( 3, 'Ботанічний сад', NULL),
( 3, 'Наукова', NULL),
( 3, 'Держпром', 1),
( 3, 'Архітектора Бекетова', NULL),
( 3, 'Захисників України', NULL),
( 3, 'Метробудівників', 2);

CREATE TABLE `interchange_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`interchange_id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`)
);

INSERT INTO `interchange_stations` (`id`, `name`) VALUES
(313, 'Історичний музей'),
(314, 'Індустріальна'),
(315, 'Інститут');

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_1` int(10) unsigned NOT NULL,
  `station_2` int(10) unsigned NOT NULL,
  `distance` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `station_1` (`station_1`),
  KEY `station_2` (`station_2`),
  FOREIGN KEY (`station_1`) REFERENCES `metro_stations` (`id`),
  FOREIGN KEY (`station_2`) REFERENCES `metro_stations` (`id`)
) 

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



