CREATE TABLE employees(
employees_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
address_id INTEGER NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE metodos_pago(
metodos_id INTEGER PRIMARY KEY AUTOINCREMENT,
pago_name VARCHAR(15) NOT NULL, ---referencio que metodo quiere elegir (mp, tarjeta credito o debito)
employees_id INTEGER NOT NULL,
payment_id INTEGER NOT NULL,
FOREIGN KEY (employees_id) REFERENCES employees(employees_id),
FOREIGN KEY (payment_id) REFERENCES payment(payment_id));


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

CREATE TABLE category (
category_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_id INTEGER NOT NULL, 
drinks_id INTEGER NOT NULL,
FOREIGN KEY (drinks_id) REFERENCES drinks(drinks_id),
FOREIGN KEY (meals_id) REFERENCES meals(meals_id)
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