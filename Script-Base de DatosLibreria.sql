

USE primerProyectoLibreria;
-- DDL
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla de Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT,
    genero VARCHAR(100),
    stock INT DEFAULT 0,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

-- Tabla de Clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla de Ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE NOT NULL,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de Detalle de Ventas
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_libro INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- LMD
 -- Insertar datos en la tabla Autores
INSERT INTO Autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('J.K. Rowling', 'Británica'),
('José Saramago', 'Portugués'),
('Laura Esquivel', 'Mexicana'),
('Stephen King', 'Estadounidense');

-- Insertar datos en la tabla Libros
INSERT INTO Libros (titulo, id_autor, genero, stock, precio) VALUES
('Cien años de soledad', 1, 'Novela', 10, 300.00),
('Harry Potter y la piedra filosofal', 2, 'Fantasía', 8, 250.00),
('Ensayo sobre la ceguera',3, 'Ficción distópica', 11, 125.50),
('Como agua para chocolate', 4, 'Realismo mágico', 7, 190.00),
('It', 5, 'Terror', 3, 279.00);

-- Insertar datos en la tabla Clientes
INSERT INTO clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juanperez@gmail.com', '123456789'),
('María González', 'mariagonzalez@hotmail.com', '987654321'),
('Carlos López', 'carloslopez@yahoo.com', '555666777'),
('Ana Ramírez', 'ana.ramirez@outlook.com', '888999000'),
('Pedro Torres', 'pedro.torres@gmail.com', '111222333');

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (id_cliente, fecha) VALUES
(1, '2024-02-11'),
(3, '2024-02-10'),
(5, '2024-02-09'),
(2, '2024-02-08'),
(4, '2024-02-07');

-- Insertar registros en Detalle Ventas
-- INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
-- SELECT <id_venta>, id_libro, <cantidad>, <cantidad> * precio 
-- FROM Libros 
-- WHERE id_libro = <id_libro>;

-- Insertar detalles para la venta 1 (Cliente: Juan Pérez)
INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 1, id_libro, 2, 2 * precio FROM Libros WHERE id_libro = 1;

INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 1, id_libro, 1, 1 * precio FROM Libros WHERE id_libro = 3;

-- Insertar detalles para la venta 2 (Cliente: Carlos López)
INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 2, id_libro, 1, 1 * precio FROM Libros WHERE id_libro = 2;

INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 2, id_libro, 3, 3 * precio FROM Libros WHERE id_libro = 5;

-- Insertar detalles para la venta 3 (Cliente: Pedro Torres)
INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 3, id_libro, 2, 2 * precio FROM Libros WHERE id_libro = 4;

-- Insertar detalles para la venta 4 (Cliente: María González)
INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 4, id_libro, 1, 1 * precio FROM Libros WHERE id_libro = 1;

INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 4, id_libro, 2, 2 * precio FROM Libros WHERE id_libro = 3;

INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 4, id_libro, 1, 1 * precio FROM Libros WHERE id_libro = 5;

-- Insertar detalles para la venta 5 (Cliente: Ana Ramírez)
INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 5, id_libro, 1, 1 * precio FROM Libros WHERE id_libro = 2;

INSERT INTO detalle_venta (id_venta, id_libro, cantidad, subtotal) 
SELECT 5, id_libro, 2, 2 * precio FROM Libros WHERE id_libro = 4;


SET SQL_SAFE_UPDATES = 0;
-- "safe update mode", lo que impide actualizar registros sin usar una clave primaria o un índice en el WHERE
UPDATE Ventas v
SET total = (
    SELECT COALESCE(SUM(subtotal), 0) 
    FROM detalle_venta dv
    WHERE dv.id_venta = v.id_venta
);

SET SQL_SAFE_UPDATES = 1;

select * from detalle_venta;

