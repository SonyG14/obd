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
CREATE TABLE lines (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE stations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  line INT(10) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (line) REFERENCES lines (id)
);

CREATE TABLE interchange_stations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
);

CREATE TABLE sections (
  id INT PRIMARY KEY AUTO_INCREMENT,
  line INT(10) UNSIGNED NOT NULL,
  station_from INT(10) UNSIGNED NOT NULL,
  station_to INT(10) UNSIGNED NOT NULL,
  distance INT(10) UNSIGNED DEFAULT NULL,
  FOREIGN KEY (line) REFERENCES lines (id),
  FOREIGN KEY (station_from) REFERENCES stations (id),
  FOREIGN KEY (station_to) REFERENCES stations (id)
);

CREATE TABLE transitions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  from_station INT(10) UNSIGNED NOT NULL,
  to_station INT(10) UNSIGNED NOT NULL,
  transition VARCHAR(255) NOT NULL,
  FOREIGN KEY (from_station) REFERENCES stations (id),
  FOREIGN KEY (to_station) REFERENCES stations (id)
);

