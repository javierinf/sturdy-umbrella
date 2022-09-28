-- DDLs sintax has been modfied in order to be run in postgresql

CREATE TABLE Pizza (
id int NOT NULL,
name varchar(50) NULL,
ingredients varchar(50) NULL);

CREATE TABLE Ingredients (
id int NOT NULL,
name varchar(40) NULL);


CREATE TABLE Orders (
order_id int NOT NULL,
customer_id int NULL,
pizza_id int NULL,
exclusions varchar(4) NULL,
extras varchar(4) NULL,
order_time timestamp NULL);

INSERT INTO Ingredients (id, name) VALUES (1, 'Bacon');
INSERT INTO Ingredients (id, name) VALUES (2, 'BBQ Sauce');
INSERT INTO Ingredients (id, name) VALUES (3, 'Beef');
INSERT INTO Ingredients (id, name) VALUES (4, 'Cheese');
INSERT INTO Ingredients (id, name) VALUES (5, 'Chicken');
INSERT INTO Ingredients (id, name) VALUES (6, 'Mushrooms');
INSERT INTO Ingredients (id, name) VALUES (7, 'Onions');
INSERT INTO Ingredients (id, name) VALUES (8, 'Pepperoni') ;
INSERT INTO Ingredients (id, name) VALUES (9, 'Peppers');
INSERT INTO Ingredients (id, name) VALUES (10, 'Salami');
INSERT INTO Ingredients (id, name) VALUES (11, 'Tomatoes');
INSERT INTO Ingredients (id, name) VALUES (12, 'Tomato Sauce') ;
INSERT INTO Ingredients (id, name) VALUES (13, 'Prosciutto');

INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(1, 101, 1, NULL, NULL, CAST('2021-02-01T18:05:02.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(2, 101, 1, NULL, NULL, CAST('2021-02-01T19:00:52.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(3, 102, 1, NULL, NULL, CAST('2021-03-02T23:51:23.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(3, 102, 2, NULL, NULL, CAST('2021-03-02T23:51:23.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(4, 103, 1, '4', NULL, CAST('2021-05-04T13:23:46.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(4, 103, 2, '4', NULL, CAST('2021-05-04T13:23:46.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(5, 104, 1, 'null', '1', CAST('2021-06-08T21:00:29.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(6, 101, 2, 'null', 'null', CAST('2021-06-08T21:03:13.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(7, 105, 2, 'null', '1', CAST('2021-06-08T21:20:29.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(8, 102, 1, 'null', 'null', CAST('2021-07-09T23:54:33.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(9, 103, 1, '4', '1, 5', CAST('2021-08-10T11:22:59.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(10, 104, 1, 'null', 'null', CAST('2021-09-11T18:34:49.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(10, 104, 1, '2, 6', '1, 4', CAST('2021-09-11T18:34:49.000' AS timestamp));
INSERT INTO Orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(11, 115, 3, NULL, '8', CAST('2021-09-11T19:45:29.000' AS timestamp));

INSERT INTO Pizza (id, name, ingredients) VALUES (1, 'Carnivore', '1, 2, 3, 4, 5, 6, 8, 10');
INSERT INTO Pizza (id, name, ingredients) VALUES (2, 'Vegetaria', '4, 6, 7, 9, 11, 12');
INSERT INTO Pizza (id, name, ingredients) VALUES (3, 'Prosciutto e sql', '11, 12, 13, 6');