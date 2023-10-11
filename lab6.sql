SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

SELECT cities.name AS city_name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

CREATE TABLE `metro_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `metro_stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`line_id`) REFERENCES `metro_lines`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;