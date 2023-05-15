DROP DATABASE IF EXISTS lesson5;
CREATE DATABASE IF NOT EXISTS lesson5;

USE lesson5;

DROP TABLE IF EXISTS cars;
CREATE TABLE IF NOT EXISTS cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

#1. Создайте представление, в которое попадут автомобили
# стоимостью до 25 000 долларов

CREATE OR REPLACE VIEW cheaper_cars AS
SELECT *
FROM cars
WHERE cost <= 25000;

#2. Изменить в существующем представлении порог для стоимости: 
# пусть цена будет до 30 000 долларов (ALTER VIEW)

ALTER VIEW cheaper_cars AS
SELECT *
FROM cars
WHERE cost <= 30000;

SELECT * from cheaper_cars;

#3. Создайте представление, в котором будут только 
# автомобили марки “Шкода” и “Ауди”

CREATE VIEW skoda_audi AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT * from skoda_audi;