CREATE TABLE employees(
employees_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
address_id INTEGER NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (address_id) REFERENCES address(address_id)
);


CREATE TABLE payment (
payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
employees_id INTEGER,
customer_id INTEGER NOT NULL,
payment VARCHAR(15),
FOREIGN KEY (employees_id) REFERENCES employees(employees_id)
);

CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address_id INTEGER,
email VARCHAR(50),
phone VARCHAR(50),
FOREIGN KEY (address_id) REFERENCES address(address_id));

CREATE TABLE city (
city_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_name VARCHAR(50) NOT NULL);


CREATE TABLE address (
address_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_id INTEGER,
address_name VARCHAR(50),
FOREIGN KEY (city_id) REFERENCES city (city_id));

CREATE TABLE drinks (
drinks_id INTEGER PRIMARY KEY AUTOINCREMENT,
drinks_name VARCHAR(50) NOT NULL
);

CREATE TABLE "category" (
	"category_id"	INTEGER,
	"meals_id"	INTEGER NOT NULL,
	"drinks_id"	INTEGER NOT NULL,
	"meals_cat"	INTEGER NOT NULL,
	"drinks_cat"	INTEGER NOT NULL,
	FOREIGN KEY(meals_id) REFERENCES "meals"(meals_id),
	FOREIGN KEY(drinks_id) REFERENCES "drinks"(drinks_id),
	PRIMARY KEY("category_id" AUTOINCREMENT)
);

CREATE TABLE meals (
meals_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_name VARCHAR(50) NOT NULL,
price DECIMAL(8,2),
payment_id INTEGER NOT NULL,
FOREIGN KEY(payment_id) REFERENCES payment (payment_id)
);


//

INSERT INTO city (city_name)
VALUES ("Buenos Aires");

//
INSERT INTO address (address_name, city_id)
VALUES ('Canada 2454',23),
('Ordoñez 6537',23),
('Av.Fernandez de la Cruz 6953',23),
('Troilo 132',23),
('Madre selva 645',23),
('Canada 1720',23),
('Manuela Garandilla 7891',23),
('Comodoro Ceferino Ramirez 5524',23),
(' Cafayate 5986',23),
('Chilavert 4870',23);

//
INSERT INTO customers (first_name, last_name, address_id, email,phone)
VALUES ('Mary Luz', 'Llusco',1, 'mary@gmail.com', '1131175565'),
('Lucia','Acuña',3, 'luci@gmail.com', '1141719615'),
('Abril','Herbas',4, 'abril@gmail.com','1167377704'),
('Rocio','Albarracion',5, 'rocio@gmail.com','1136118005'),
('Valentin','Velazquez',6, 'valen@gmail.com','1161138645'),
('Dylan','Aragon',7, 'dylan@gmail.com','1152603980'),
('Thomas','Avila',8, 'thomas@gmail.com','1152297349'),
('Enzo','Materazzi',9, 'enzo@gmail.com','1123539461'),
('ayelen','quispe',10, 'ayelen@gmail.com','1140430201'),
('Ariana','Villa', 11 , 'ariana@gmail.com','1161929792');

//
INSERT INTO employees (first_name,last_name,address_id,email)
VALUES ('Federico','Villace',1,'fede@gmail.com'),
('Tomas','Mayorga',3,'tomas@gmail.com'),
('Julian','Impelluso',4,'julian@gmail.com'),
('Andres','Navarro',5,'andres@gmail.com'),
('Mauricio','Uribe',6,'mauricio@gmail.com'),
('Natan','Jaibe',7,'natan@gmail.com'),
('Eduardo','Mestrovich',8, 'eduardo@gmail.com'),
('Alejandro','Salomon',9,'alejandro@gmail.com'),
('Enrico','Provoleta',10,'enrico@gmail.com'),
('Adrian','Corvalan',11,'adrian@gmail.com');

//
INSERT INTO payment (employees_id,customer_id,payment)
VALUES (1,23,'Mercado pago'),
(3,23,'Efectivo'),
(4,23,'Tarjeta de credito'),
(5,23,'Tarjeta de debito'),
(6,23,'Uala'),
(7,23,'Naranja'),
(8,23,'Mercado pago'),
(9,23,'Efectivo'),
(10,23,'Tarjeta de credito'),
(11,23,'Tarjeta de debito'),

//
INSERT INTO drinks (drinks_id,drinks_name)
VALUES (1,'agua'),
(2,'Coca Cola'),
(3,'Sprite'),
(4,'Fanta'),
(5,'Agua saborizada'),
(6,'Agua con gas'),
(7,'Limonada'),
(8,'Cerveza'),
(9,'Caipirinha'),

//
INSERT INTO category (meals_id,drinks_id,meals_cat,drinks_cat)
VALUES (1,1,'Pasta','Agua'),
(2,2,'Plato principal','Gaseosas'),
(3,3,'Minuta','Gaseosas'),
(4,4,'Minuta','Gaseosas'),
(5,5,'Minuta','Jugos'),
(6,6,'Guarniciones','Agua'),
(7,7,'Pizzas','Jugos'),
(8,8,'Pizzas','Bebidas Alcoholicas'),
(9,9,'Especial de la Casa','Bebidas Alcoholicas');

//
INSERT INTO meals(meals_name, price, payment_id)
VALUES('Fideos con Bolognesa', 11000, 2), 
('Risoto', 9500, 3),
('Milanesa (pollo/carne) a la Napolitana', 17000, 4),
('Hamburguesa completa con papas', 15000, 5), 
('Empanadas (variedad)', 1200, 6 ), 
('Porcion de papas', 5500, 1), 
('Pizza Muzzarella', 8000, 2), 
('Pizza Fugazzata', 9500, 3), 
('BurgerPizza (especial de la Casa)', 19000, 4)

/ACTUALIZAR DATOS/
SELECT employees_id, first_name, last_name FROM employees
WHERE first_name IN ('Federico', 'Tomas', 'Julian'); 
UPDATE employees set first_name = 'Eduardo', last_name = 'Basille' WHERE employees_id = 1;
UPDATE employees set first_name = 'Marcela', last_name = 'Gleiser' WHERE employees_id = 2;
UPDATE employees set first_name = 'Diego', last_name = 'Lopez' WHERE employees_id = 3;

/BORRAR DATOS/
DELETE FROM customers WHERE customer_id IN (8, 9, 10);

/INNER JOIN/
SELECT m.meals_name, m.price, p.payment_id FROM meals m 
INNER JOIN payment p ON m.meals_id = p.payment_id

//
SELECT c.meals_cat, m.meals_name, m.price, p.payment FROM meals m 
INNER JOIN payment p on p.payment_id = m.payment_id
INNER JOIN category c on c.meals_id = m.meals_id

