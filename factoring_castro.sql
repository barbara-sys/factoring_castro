-- Creación de la base de datos
CREATE DATABASE gestion_riesgo_operativo;

USE gestion_riesgo_operativo;

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    fecha_registro DATE,
    limite_credito DECIMAL(10, 2)
);

-- Creación de la tabla Factura
CREATE TABLE Factura (
    factura_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    monto_factura DECIMAL(10, 2),
    fecha_vencimiento DATE,
    estado_factura VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Creación de la tabla Transacción
CREATE TABLE Transaccion (
    transaccion_id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT,
    monto_transaccion DECIMAL(10, 2),
    fecha_transaccion DATE,
    FOREIGN KEY (factura_id) REFERENCES Factura(factura_id)
);

-- Creación de la tabla Operador de Riesgo
CREATE TABLE OperadorRiesgo (
    operador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_operador VARCHAR(100),
    departamento VARCHAR(50)
);

-- Creación de la tabla Evaluación de Riesgo
CREATE TABLE EvaluacionRiesgo (
    evaluacion_id INT AUTO_INCREMENT PRIMARY KEY,
    factura_id INT,
    cliente_id INT,
    operador_id INT,
    nivel_riesgo VARCHAR(50),
    fecha_evaluacion DATE,
    FOREIGN KEY (factura_id) REFERENCES Factura(factura_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (operador_id) REFERENCES OperadorRiesgo(operador_id)
);


