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
  line_id INT(10) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (line_id) REFERENCES lines (id)
);

CREATE TABLE interchange_stations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  FOREIGN KEY (city_id) REFERENCES cities_metro (city_id)
);

CREATE TABLE sections (
  id INT PRIMARY KEY AUTO_INCREMENT,
  line_id INT(10) UNSIGNED NOT NULL,
  station_from INT(10) UNSIGNED NOT NULL,
  station_to INT(10) UNSIGNED NOT NULL,
  distance INT(10) UNSIGNED DEFAULT NULL,
  FOREIGN KEY (line_id) REFERENCES lines (id),
  FOREIGN KEY (station_from_id) REFERENCES stations (id),
  FOREIGN KEY (station_to_id) REFERENCES stations (id)
);

