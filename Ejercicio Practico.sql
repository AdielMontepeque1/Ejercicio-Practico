CREATE DATABASE ejercicio1x;

USE ejercicio1x

CREATE TABLE Clientes(
id_cliente VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
nombre VARCHAR(50),
apellido VARCHAR(50),
telefono VARCHAR(10),
direccion VARCHAR(255)
);

CREATE TABLE empleados(
id_empleado VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
nombre VARCHAR(50),
apellido VARCHAR(20), 
cargo VARCHAR(50),
fecha_contratacion DATE,
salario DECIMAL(10.2)
);

CREATE TABLE pedidos(
id_pedido VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
fercha_pedido DATE, 
total DECIMAL(10.2),
estado VARCHAR(20),
id_empleado VARCHAR(36),
id_cliente VARCHAR(36),
CONSTRAINT fk_cl FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
CONSTRAINT fk_em FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE productos(
id_producto VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
nombre VARCHAR(50),
descripcion VARCHAR(20), 
precio DECIMAL(10.2),
existencias INT,
id_pedido VARCHAR(36)
);


CREATE TABLE detallePedido(
id_detalle VARCHAR(36) PRIMARY KEY DEFAULT(UUID()),
cantidad INT,
precio_unitario DECIMAL(10.2),
subtotal DECIMAL(10.2),
id_pedido VARCHAR(36),
id_producto VARCHAR(36), 
CONSTRAINT fk_pedid FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido),
CONSTRAINT fk_produ FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);


