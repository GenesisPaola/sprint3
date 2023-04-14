# los computines 

-- crear base telovendo3
CREATE DATABASE telovendo3;
-- para usar la tabla 
USE telovendo3;

-- Creando tabla Proveedores 
CREATE TABLE proveedor (
    ID_Proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_representante VARCHAR(50) NOT NULL,
    nombre_corporativo VARCHAR(50) NOT NULL,
    telefono_1 VARCHAR(20) NOT NULL,
    telefono_2 VARCHAR(20),
    categoria_p VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- Insertando datos de los proveedor
INSERT INTO proveedor (nombre_representante, nombre_corporativo, telefono_1, telefono_2, categoria_p, email) 
VALUES 
('Carlos Ramirez', 'ElectroTech', '9-2345-6789', '9-3456-7890', 'Tecnología', 'carlos@electrotech.com'),
('Laura Gomez', 'Gadget Galaxy', '9-3456-7890', '9-3456-7890', 'Electrónicos', 'laura@gadgetgalaxy.com'),
('Ricardo Torres', 'Tech Innovators', '9-4567-8901', '9-3456-7890', 'Electrónicos', 'ricardo@techinnovators.com'),
('Carmen Garcia', 'Electronics Depot', '9-5678-9012', '9-3456-7890', 'Electrónicos', 'carmen@electronicsdepot.com'),
('Mario Fernandez', 'Innovative Gadgets', '9-6789-0123', '9-3456-7890', 'Hogar', 'mario@innovativegadgets.com');

select * from proveedor;

-- Creando tabla Cliente 
CREATE TABLE cliente (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

-- Insertando datos de los clientes
INSERT INTO cliente (nombre, apellido, direccion)
VALUES
('Juan', 'Perez', 'Calle 123, Colonia Centro'),
('Ana', 'Lopez', 'Avenida Principal 456, Colonia del Sol'),
('María', 'Hernandez', 'Boulevard 789, Colonia Los Pinos'),
('Pedro', 'Martinez', 'Callejón 456, Colonia San Juan'),
('Sofía', 'Gonzalez', 'Avenida 789, Colonia Santa Fe');

select * from cliente;

-- Creando tabla Producto 
CREATE TABLE producto(
	ID_produc INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    stock_produc INT NOT NULL,
    precio_produc INT NOT NULL,
    categoria_produc VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
);

-- Agregar datos a la tabla de producto
INSERT INTO producto (stock_produc, precio_produc, categoria_produc, color) 
VALUES 
(10, 10000, 'Electrónicos', 'Azul'),
(5, 25000, 'Hogar', 'Rojo'),
(15, 40000, 'Mueblería', 'Negro'),
(8, 55000, 'Electrónicos', 'Blanco'),
(20, 70000, 'Hogar', 'Verde'),
(12, 85000, 'Mueblería', 'Marrón'),
(6, 100000, 'Electrónicos', 'Gris'),
(18, 115000, 'Hogar', 'Amarillo'),
(25, 120000, 'Mueblería', 'Blanco'),
(3, 129000, 'Electrónicos', 'Plateado');

select * from producto;

-- Creación de producto_proveedor y sus relaciones
CREATE TABLE producto_proveedor (
    ID_produc INT NOT NULL,
    ID_Proveedor INT NOT NULL,
    FOREIGN KEY (ID_produc) REFERENCES producto (ID_produc),
    FOREIGN KEY (ID_Proveedor) REFERENCES proveedor (ID_Proveedor)
);

-- Agregar de producto_proveedor
INSERT INTO producto_proveedor (ID_produc, ID_Proveedor)
VALUES
(2, 2),(1, 3),(3, 4),(6, 1),(4, 1),(8, 5),(4, 2),(7, 3),(9, 2),(5, 5),(4, 3),(6, 4),(1, 1),(10, 4),(10, 1);

select * from producto_proveedor;

-- Consultas MYSQL del Sprint 3

-- Cuál es la categoría de productos que más se repite.
SELECT categoria_produc, COUNT(*) AS cantidad
FROM producto
GROUP BY categoria_produc
ORDER BY cantidad DESC
LIMIT 1;

-- Cuáles son los productos con mayor stock
SELECT ID_produc, stock_produc, precio_produc, categoria_produc, color
FROM producto
ORDER BY stock_produc DESC
LIMIT 1;

-- Qué color de producto es más común en nuestra tienda.
SELECT color, COUNT(*) as cantidad
FROM producto
GROUP BY color
ORDER BY cantidad DESC
LIMIT 1;

-- Cual o cuales son los proveedores con menor stock de productos.
 select *
 from producto
 where stock_produc = (select MIN(stock_produc) from producto); 

-- Cambien la categoría de productos más popular por 'Electrónica y computación'.
UPDATE producto
SET categoria_produc = 'Electrónica y computación'
WHERE ID_produc IN (1,4,7,10); 


select * from proveedor;
select * from cliente;
select * from producto;
select * from producto_proveedor;