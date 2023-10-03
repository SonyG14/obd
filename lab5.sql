SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM regions
LEFT JOIN cities ON regions.uuid = cities.region
GROUP BY regions.name;

SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM regions
LEFT JOIN cities ON regions.uuid = cities.region
GROUP BY regions.name
HAVING COUNT(cities.id) >= 10;

SELECT cities.name AS city_name, cities.population
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity >= 5
ORDER BY cities.population DESC
LIMIT 5 OFFSET 10;

SELECT regions.name AS region_name, SUM(cities.population) AS total_population
FROM regions
LEFT JOIN cities ON regions.uuid = cities.region
WHERE cities.population > 300000
GROUP BY regions.name;

SELECT cities.name AS city_name, cities.population
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.area_quantity <= 5
AND cities.population NOT BETWEEN 150000 AND 500000;