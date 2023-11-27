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
   line_id int(10) unsigned NOT NULL,
   name VARCHAR(255) NOT NULL,
   FOREIGN KEY (line_id) REFERENCES lines (id)
);

CREATE TABLE interchange_stations (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(255) NOT NULL,
  FOREIGN KEY (`city_id`) REFERENCES `cities_metro` (`city_id`)
);

CREATE TABLE section (
   id INT PRIMARY KEY AUTO_INCREMENT,
   station_1 int(10) unsigned NOT NULL,
   station_2 int(10) unsigned NOT NULL,
   distance int(10) unsigned DEFAULT NULL,
  KEY station_1 (station_1),
  KEY station_2 (station_2),
  FOREIGN KEY (station_1) REFERENCES stations (id),
  FOREIGN KEY (station_2) REFERENCES stations (id)
);
