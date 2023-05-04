USE test2;

DROP TABLE IF EXISTS Sales_size;
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE,
  count_product INT
);

INSERT INTO Sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);


CREATE TABLE if not exists Sales_size (
id_заказа INT,
Тип_заказа VARCHAR(15),
FOREIGN KEY (id_заказа) REFERENCES Sales(id)
);


INSERT INTO Sales_size (id_заказа, Тип_заказа)
SELECT
  id,
  CASE 
    WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product > 300 THEN 'Большой заказ'
    ELSE 'Средний заказ'
  END AS Тип_заказа
FROM Sales;

SELECT * from Sales_size;


DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id VARCHAR(4),
  amount DECIMAL(10, 2),
  order_status VARCHAR(10)
);

INSERT INTO Orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT
  *,
  CASE order_status
    WHEN 'OPEN' THEN 'Order is in open state'
    WHEN 'CLOSED' THEN 'Order is closed'
    WHEN 'CANCELLED' THEN 'Order is cancelled'
  END AS full_order_status
FROM Orders;