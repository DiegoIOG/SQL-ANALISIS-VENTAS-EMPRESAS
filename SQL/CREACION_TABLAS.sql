Use EMPRESA


CREATE TABLE empresa (
empresa_id INT PRIMARY KEY,
nombre_empresa VARCHAR(255),
industria_empres VARCHAR(100),
pais VARCHAR(100)
);

CREATE TABLE clientes(
cliente_id INT PRIMARY KEY,
nombre VARCHAR(100),
apellido VARCHAR(100),
EMAIL VARCHAR(100),
empresa_id INT
);

CREATE TABLE productos(
producto_id INT PRIMARY KEY ,
nombre_producto VARCHAR(255),
categoria VARCHAR(100),
precio_base DECIMAL(10,2)
);

CREATE TABLE ventas(
venta_id INT PRIMARY KEY,
cliente_id INT,
producto_id INT,
cantidad INT,
fecha DATE,
region VARCHAR(50),
precio_unitario DECIMAL(10,2),
total DECIMAL(12,2)
);
