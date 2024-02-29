
USE ejercicio1x

/*INSERT INTO Clientes (nombre, apellido, telefono, direccion)VALUES 
('Juan', 'Valdez', '7023-2124', 'Avenida Aguilares 218 San Salvador CP, San Salvador 1101'),
('Roberto', 'Delgado', '6393-2164', 'Unicentro Metrópolis, Calle Zacamil, Mejicanos'),
('Ricardo', 'Nicolas', '6945-1278', 'Sobre la avenida Bernal, entre Calle Sisimiles y Calle, DELCO BERNAL, San Salvador'),
('Michael', 'Alonso', '7545-6633', 'above Despensa de Don Juan 75 Col. Escalon, end of, Alameda Juan Pablo II, Extension'),
('Juan', 'Rodríguez', '7412-1023', '71 ave. norte # 219 Colonia Escalón., Entre primera y tercera calle poniente., San Salvador CP 1101'),
('María', 'González', '6547-6398', 'Bulevar Del Hipodromo, San Salvador'),
('Roberto', 'Martínez', '7899-4123', '85 Avenida Nte. #637, San Salvador'),
('Laura ', 'Hernández', '6298-4569', 'Calle Del Mirador 3457, San Salvador CP 1101'),
('Ana', 'López', '6522-7777', '1937, 6-10 Calle Poniente & 37 Avenida Sur, San Salvador'),
('Sergio', 'Ramírez', '6775-2456', 'Residencial Monteverde, Calle Motocross cas #3, San Salvador'),
('Isabel', 'Flores', '7410-8523', 'Calle San Salvador 202 A, San Salvador'),
('Eduardo', 'Torres', '6312-4569', '7 Calle Poniente Bis 5214 Colonia Escalon, San Salvador'),
('Gabriela', 'Díaz', '7532-4189', '85 Av. Sur y, Calle Padres Aguilar 437, San Salvador'),
('Raúl', 'Vargas', '6555-7410', 'C. al Parque Nacional el Boqueron 1/2, Santa Tecla'),
('Paula', 'Jiménez', '6001-7102', '65 Avenida Nte. Casa 145, San Salvador')
;
*/


DELIMITER $$

CREATE PROCEDURE insertar_clientes(
IN p_nombre VARCHAR(50),
IN p_apellido VARCHAR(50),
IN p_telefono VARCHAR(50),
IN p_direccion VARCHAR(250)
)

BEGIN 

INSERT INTO Clientes (nombre, apellido, telefono, direccion)VALUES 
(p_nombre, p_apellido, p_telefono, p_direccion);

END
 
$$

DELIMITER $$

CREATE PROCEDURE insertar_empleados(
IN p_nombre VARCHAR(50), 
IN p_apellido VARCHAR(20),
IN p_cargo VARCHAR(50),
IN p_fecha_contratacion DATE,
IN p_salario DECIMAL(10.2)
)

BEGIN 

INSERT INTO empleados (nombre, apellido, cargo, fecha_contratacion, salario)VALUES 
(p_nombre, p_apellido, p_cargo, p_fecha_contratacion, p_salario);

END
 
$$


DELIMITER $$

CREATE PROCEDURE insertar_pedidos(
IN p_fercha_pedido DATE, 
IN p_estado VARCHAR(20),
IN p_id_empleado VARCHAR(36),
IN p_id_cliente VARCHAR(36)
)

BEGIN 

INSERT INTO pedidos (fercha_pedido, estado, id_empleado, id_cliente)VALUES 
(p_fercha_pedido, p_estado, p_id_empleado, p_id_cliente);

END
 
$$


DELIMITER $$

CREATE PROCEDURE insertar_productos(
IN p_nombre VARCHAR(50),
IN p_descripcion VARCHAR(20),
IN p_precio DECIMAL(10.2),
IN p_existencias INT,
IN p_id_pedido VARCHAR(36)
)

BEGIN 

INSERT INTO productos (nombre, descripcion, precio, existencias, id_pedido)VALUES 
(p_nombre, p_descripcion, p_precio, p_existencias, p_id_pedido);

END
 
$$


DELIMITER $$

CREATE PROCEDURE insertar_detalle(
IN p_cantidad INT,
IN p_precio_unitario DECIMAL(10.2),
IN p_subtotal DECIMAL(10.2),
IN p_id_pedido VARCHAR(36),
IN p_id_producto VARCHAR(36)
)

BEGIN 

INSERT INTO detallePedido (cantidad, precio_unitario, subtotal, id_pedido, id_producto)VALUES 
(p_cantidad, p_precio_unitario, p_subtotal, p_id_pedido, p_id_producto);

END
 
$$




SELECT * FROM Clientes 
CALL insertar_clientes('John', 'Doe', '1234567890', '123 Main St');
CALL insertar_clientes('Jane', 'Smith', '9876543210', '456 Oak St');


SELECT * FROM empleados
CALL insertar_empleados('Employee1', 'Last1', 'Manager', '2024-01-01', 50000.00);
CALL insertar_empleados('Employee2', 'Last2', 'Clerk', '2024-02-01', 40000.00);


SELECT * FROM pedidos
CALL insertar_pedidos('2024-01-15', 'Pending', '1899f746-d6a4-11ee-bb12-ec2e9830c156', '15d9de46-d6a4-11ee-bb12-ec2e9830c156');
CALL insertar_pedidos('2024-02-01', 'Processing', '189ac6c6-d6a4-11ee-bb12-ec2e9830c156', '15da5ac8-d6a4-11ee-bb12-ec2e9830c156');


SELECT * FROM productos
CALL insertar_productos('Product1', 'Description1', 20.00, 100, '9dd00fea-d6a4-11ee-bb12-ec2e9830c156');
CALL insertar_productos('Product2', 'Description2', 30.00, 150, '9dd143de-d6a4-11ee-bb12-ec2e9830c156');


SELECT * FROM detallePedido
CALL insertar_detalle(5, 10.00, 50.00, '9dd00fea-d6a4-11ee-bb12-ec2e9830c156', '970c32cf-d6a6-11ee-bb12-ec2e9830c156');
CALL insertar_detalle(8, 15.00, 120.00, '9dd143de-d6a4-11ee-bb12-ec2e9830c156', '970d03a0-d6a6-11ee-bb12-ec2e9830c156');

