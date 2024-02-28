CREATE DATABASE ejercicio1x;

USE ejercicio1x

CREATE TABLE Clientes(
id_cliente INT PRIMARY KEY NOT NULL,
nombre VARCHAR(50),
apellido VARCHAR(50),
telefono VARCHAR(10),
direccion VARCHAR(255)
);

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY NOT NULL,
nombre VARCHAR(50),
apellido VARCHAR(20), 
cargo VARCHAR(50),
fecha_contratacion DATE,
salario DECIMAL(10.2)
);


CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY NOT NULL,
fercha_pedido DATE, 
total DECIMAL(10.2),
estado VARCHAR(20),
id_empleado INT,
id_cliente INT,
CONSTRAINT fk_cl FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
CONSTRAINT fk_em FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE productos(
id_producto INT PRIMARY KEY NOT NULL,
nombre VARCHAR(50),
descripcion VARCHAR(20), 
precio DECIMAL(10.2),
existencias INT,
id_pedido INT,
id_detalle INT
);

CREATE TABLE detallePedido(
id_detalle INT PRIMARY KEY NOT NULL,
cantidad INT,
precio_unitario DECIMAL(10.2),
subtotal DECIMAL(10.2),
id_pedido INT,
id_producto INT, 
CONSTRAINT fk_pedid FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido),
CONSTRAINT fk_produ FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);




a
