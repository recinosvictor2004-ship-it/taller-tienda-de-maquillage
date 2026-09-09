# 🛍️ Tienda de Maquillaje — Base de Datos  
Sistema de gestión para productos, clientes, ventas, empleados y proveedores.

Este proyecto implementa una base de datos relacional para una tienda de maquillaje que comercializa cosméticos, productos de cuidado de la piel, perfumes y accesorios.  
Incluye el **diagrama E‑R**, **DDL**, **DML con datos reales**, **procedimientos almacenados (DQL)** y la documentación completa del sistema.

---

## 📑 Contenido
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Modelo Entidad–Relación](#modelo-entidad–relación)
- [Diagrama E‑R](#diagrama-e-r)
- [Estructura de Tablas](#estructura-de-tablas)
- [DDL — Creación de Tablas](#ddl--creación-de-tablas)
- [DML — Inserción de Datos Reales](#dml--inserción-de-datos-reales)
- [DQL — Procedimientos Almacenados](#dql--procedimientos-almacenados)
- [Consultas Solicitadas](#consultas-solicitadas)
- [Estructura del Repositorio](#estructura-del-repositorio)
- [Autores](#autores)

---

## 📘 Descripción del Proyecto
El objetivo es diseñar y modelar una base de datos que permita administrar:

- Productos (cosméticos, cuidado de la piel, perfumes, accesorios)
- Clientes
- Empleados
- Ventas y detalles de venta
- Proveedores
- Órdenes de compra y detalles de orden

El sistema soporta consultas avanzadas mediante **procedimientos almacenados**, permitiendo obtener información clave como productos más vendidos, ventas por cliente, stock disponible, empleados con antigüedad, etc.

---

## 🧩 Modelo Entidad–Relación
El modelo E‑R está compuesto por las siguientes entidades:

### **Entidades principales**
- **Producto**
- **Cliente**
- **Empleado**
- **Venta**
- **DetalleVenta**
- **Proveedor**
- **OrdenCompra**
- **DetalleOrdenCompra**
- **Categoria**

### **Relaciones**
- Un cliente realiza muchas ventas  
- Un empleado atiende muchas ventas  
- Una venta contiene muchos detalles  
- Un producto aparece en muchos detalles de venta  
- Un proveedor recibe muchas órdenes de compra  
- Una orden contiene muchos detalles de orden  
- Un producto aparece en muchas órdenes de compra  

---

## 🖼️ Diagrama E‑R

Incluye las relaciones, llaves primarias y llaves foráneas del modelo de la base de datos.

### 📌 Vista del diagrama
![Diagrama ER](diagrama-er.png)
<p align="center">
  <img src="diagrama-er.png" width="650">
</p>


---

## 🏗️ Estructura de Tablas
Cada tabla fue diseñada con:
- Llaves primarias (`PRIMARY KEY`)
- Llaves foráneas (`FOREIGN KEY`)
- Restricciones de integridad
- Campos específicos según categoría de producto

---

## 🧱 DDL — Creación de Tablas
Archivo: **ddl.sql**

```sql
create database IF NOT EXISTS TiendaCosmeticos;
USE TiendaCosmeticos;

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_categoria INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    tipo VARCHAR(50),
    tono_color VARCHAR(50),
    tipo_piel VARCHAR(50),
    componentes TEXT,
    fecha_exp DATE,
    tipo_aroma VARCHAR(50),
    tamaño VARCHAR(50),
    material VARCHAR(50),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE DetalleVenta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(200)
);

CREATE TABLE OrdenCompra (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE DetalleOrdenCompra (
    id_detalle_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_orden) REFERENCES OrdenCompra(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

---

## 📦 DML — Inserción de Datos Reales
Archivo: dml.sql

Incluye:

10 productos reales por categoría (Maybelline, MAC, Dior, Fenty, etc.)

10 clientes reales ficticios

10 empleados

10 proveedores reales (L’Oréal, Dior, Estée Lauder, etc.)

```sql
('Cosméticos'),
('Cuidado de la piel'),
('Perfumes'),
('Accesorios');

INSERT INTO Producto (nombre, descripcion, id_categoria, precio, stock, tipo, tono_color, tipo_piel, componentes, fecha_exp, tipo_aroma, tamaño, material)
VALUES
-- Cosméticos
('Maybelline Fit Me Foundation', 'Base líquida acabado natural', 1, 89.00, 50, 'base', '120 Classic Ivory', NULL, NULL, '2026-12-01', NULL, NULL, NULL),
('MAC Lipstick Ruby Woo', 'Labial rojo icónico', 1, 165.00, 30, 'labial', 'Ruby Woo', NULL, NULL, '2027-05-01', NULL, NULL, NULL),
('Fenty Beauty Gloss Bomb', 'Gloss universal luminador', 1, 140.00, 40, 'gloss', 'Fenty Glow', NULL, NULL, '2027-03-01', NULL, NULL, NULL),
('Urban Decay Naked Palette', 'Paleta de sombras neutras', 1, 420.00, 20, 'sombra', 'Naked', NULL, NULL, '2027-08-01', NULL, NULL, NULL),
('NARS Blush Orgasm', 'Rubor rosado con brillo', 1, 210.00, 25, 'rubor', 'Orgasm', NULL, NULL, '2027-02-01', NULL, NULL, NULL),

-- Cuidado de la piel
('CeraVe Moisturizing Cream', 'Crema hidratante para piel seca', 2, 110.00, 60, NULL, NULL, 'seca', 'ceramidas, ácido hialurónico', '2026-11-01', NULL, NULL, NULL),
('Clinique Dramatically Different Gel', 'Gel hidratante para piel grasa', 2, 230.00, 40, NULL, NULL, 'grasa', 'glicerina, extractos botánicos', '2027-01-01', NULL, NULL, NULL),
('The Ordinary Niacinamide 10%', 'Suero para piel mixta', 2, 95.00, 70, NULL, NULL, 'mixta', 'niacinamida, zinc', '2026-10-01', NULL, NULL, NULL),
('La Roche-Posay Sunscreen SPF 50', 'Protector solar', 2, 180.00, 50, NULL, NULL, 'todos', 'antioxidantes, filtros UV', '2027-06-01', NULL, NULL, NULL),
('Estée Lauder Advanced Night Repair', 'Suero reparador nocturno', 2, 520.00, 30, NULL, NULL, 'todos', 'ácido hialurónico, antioxidantes', '2027-04-01', NULL, NULL, NULL),

-- Perfumes
('Dior Sauvage', 'Fragancia masculina fresca', 3, 850.00, 20, NULL, NULL, NULL, NULL, 'amaderado', '100ml', NULL),
('Carolina Herrera Good Girl', 'Perfume femenino dulce', 3, 780.00, 15, NULL, NULL, NULL, NULL, 'floral dulce', '80ml', NULL),
('Versace Dylan Blue', 'Fragancia masculina intensa', 3, 690.00, 18, NULL, NULL, NULL, NULL, 'cítrico amaderado', '100ml', NULL),
('YSL Black Opium', 'Perfume femenino oriental', 3, 820.00, 12, NULL, NULL, NULL, NULL, 'vainilla café', '90ml', NULL),
('Burberry Her', 'Perfume femenino frutal', 3, 760.00, 14, NULL, NULL, NULL, NULL, 'frutal dulce', '100ml', NULL),

-- Accesorios
('Beauty Blender Original', 'Esponja para maquillaje', 4, 150.00, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'esponja'),
('Real Techniques Brush Set', 'Set de brochas profesionales', 4, 320.00, 25, NULL, NULL, NULL, NULL, NULL, NULL, 'fibra sintética'),
('Tweezerman Slant Tweezer', 'Pinza de cejas', 4, 180.00, 30, NULL, NULL, NULL, NULL, NULL, NULL, 'acero inoxidable'),
('Sephora Eyelash Curler', 'Rizador de pestañas', 4, 140.00, 20, NULL, NULL, NULL, NULL, NULL, NULL, 'metal'),
('NYX Makeup Bag', 'Bolsa de maquillaje', 4, 95.00, 35, NULL, NULL, NULL, NULL, NULL, 'mediana', 'vinilo');

INSERT INTO Cliente (nombre, correo, direccion, telefono) VALUES
('María López', 'maria.lopez@gmail.com', 'Zona 1, Ciudad de Guatemala', '5555-1234'),
('Ana Pérez', 'ana.perez@hotmail.com', 'Mixco, Zona 4', '5555-5678'),
('Carla Gómez', 'carla.gomez@yahoo.com', 'Villa Nueva', '5555-8765'),
('Luis Martínez', 'luis.mtz@gmail.com', 'Zona 10, Guatemala', '5555-1122'),
('Sofía Ramírez', 'sofia.rz@gmail.com', 'San Cristóbal', '5555-3344'),
('Daniel Herrera', 'daniel.herrera@gmail.com', 'Zona 5, Guatemala', '5555-9988'),
('Paola Díaz', 'paola.dz@gmail.com', 'Zona 7, Guatemala', '5555-4433'),
('Andrea Castillo', 'andrea.castillo@gmail.com', 'Zona 12, Guatemala', '5555-2211'),
('Fernando Ruiz', 'fernando.ruiz@gmail.com', 'Zona 9, Guatemala', '5555-7788'),
('Gabriela Torres', 'gabriela.torres@gmail.com', 'Zona 14, Guatemala', '5555-8899');


INSERT INTO Empleado (nombre, fecha_ingreso) VALUES
('Valeria Méndez', '2023-01-10'),
('Carlos López', '2022-05-20'),
('Jimena Aguilar', '2021-11-15'),
('Ricardo Pérez', '2020-03-01'),
('Lucía Hernández', '2024-02-10'),
('Diego Morales', '2023-07-25'),
('Camila Soto', '2022-09-30'),
('Javier Ramos', '2021-04-18'),
('Elena Vargas', '2020-12-05'),
('Mateo Castillo', '2023-03-22');

INSERT INTO Proveedor (empresa, contacto, telefono, direccion) VALUES
('L’Oréal Paris', 'Jean Dupont', '4444-1111', 'París, Francia'),
('Maybelline New York', 'Sarah Johnson', '4444-2222', 'New York, USA'),
('Fenty Beauty', 'Robyn Fenty', '4444-3333', 'Los Ángeles, USA'),
('MAC Cosmetics', 'Emily Carter', '4444-4444', 'Toronto, Canadá'),
('Urban Decay', 'Michael Smith', '4444-5555', 'California, USA'),
('NARS Cosmetics', 'Laura Kim', '4444-6666', 'Nueva York, USA'),
('Clinique', 'Robert Wilson', '4444-7777', 'Illinois, USA'),
('Dior Beauty', 'Pierre Martin', '4444-8888', 'París, Francia'),
('YSL Beauty', 'Camille Laurent', '4444-9999', 'París, Francia'),
('Estée Lauder', 'Helen Brown', '4444-0000', 'Nueva York, USA');
, Empleados, Proveedores

```

---

##  🔍 DQL — Procedimientos Almacenados

Archivo: dql.sql

Incluye procedimientos para:

Listar productos de cosméticos por tipo

Productos con stock menor a un valor

Ventas por cliente en rango de fechas

Total de ventas por empleado en un mes

Productos más vendidos en un período

Stock disponible por nombre o ID

Órdenes de compra de un proveedor en el último año

Empleados con más de un año de antigüedad

Total de productos vendidos en un día

Ventas de un producto específico

```sql
---Productos de cosméticos por tipo

CREATE PROCEDURE productos_por_tipo(IN tipoCosmetico VARCHAR(50))
BEGIN
    SELECT * FROM Producto
    WHERE id_categoria = 1 AND tipo = tipoCosmetico;
END;



---Productos con stock menor a un valor

CREATE PROCEDURE productos_stock_bajo(IN categoriaID INT, IN limite INT)
BEGIN
    SELECT * FROM Producto
    WHERE id_categoria = categoriaID AND stock < limite;
END;



---Ventas por cliente en rango de fechas

CREATE PROCEDURE ventas_cliente_rango(IN clienteID INT, IN fechaInicio DATE, IN fechaFin DATE)
BEGIN
    SELECT * FROM Venta
    WHERE id_cliente = clienteID
    AND fecha BETWEEN fechaInicio AND fechaFin;
END;


---Total de ventas por empleado en un mes

CREATE PROCEDURE total_ventas_empleado(IN empleadoID INT, IN mes INT, IN anio INT)
BEGIN
    SELECT SUM(dv.cantidad * p.precio) AS total
    FROM Venta v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    JOIN Producto p ON dv.id_producto = p.id_producto
    WHERE v.id_empleado = empleadoID
    AND MONTH(v.fecha) = mes
    AND YEAR(v.fecha) = anio;
END;


---Productos más vendidos en un período

CREATE PROCEDURE productos_mas_vendidos(IN fechaInicio DATE, IN fechaFin DATE)
BEGIN
    SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
    FROM DetalleVenta dv
    JOIN Producto p ON dv.id_producto = p.id_producto
    JOIN Venta v ON dv.id_venta = v.id_venta
    WHERE v.fecha BETWEEN fechaInicio AND fechaFin
    GROUP BY p.id_producto
    ORDER BY total_vendido DESC;
END;



---Stock disponible por nombre o ID

CREATE PROCEDURE stock_producto(IN productoID INT, IN nombreProd VARCHAR(100))
BEGIN
    SELECT nombre, stock
    FROM Producto
    WHERE id_producto = productoID OR nombre = nombreProd;
END;


---Órdenes de compra de un proveedor en el último año

CREATE PROCEDURE ordenes_proveedor_anio(IN proveedorID INT)
BEGIN
    SELECT * FROM OrdenCompra
    WHERE id_proveedor = proveedorID
    AND fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END;


---Empleados con más de un año trabajando

CREATE PROCEDURE empleados_antiguos()
BEGIN
    SELECT * FROM Empleado
    WHERE fecha_ingreso <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END;


---Cantidad total de productos vendidos en un día

CREATE PROCEDURE productos_vendidos_dia(IN fechaBuscada DATE)
BEGIN
    SELECT SUM(cantidad) AS total
    FROM DetalleVenta dv
    JOIN Venta v ON dv.id_venta = v.id_venta
    WHERE v.fecha = fechaBuscada;
END;



---Ventas de un producto específico

CREATE PROCEDURE ventas_producto(IN productoID INT, IN nombreProd VARCHAR(100))
BEGIN
    SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
    FROM DetalleVenta dv
    JOIN Producto p ON dv.id_producto = p.id_producto
    WHERE p.id_producto = productoID OR p.nombre = nombreProd;
END;


```
---

##  📚 Consultas Solicitadas

Cada consulta está implementada como un procedimiento almacenado para facilitar su ejecución.

Ejemplo:

```sql
CALL productos_por_tipo('labial');
CALL ventas_cliente_rango(3, '2024-01-01', '2024-12-31');
CALL productos_mas_vendidos('2024-01-01', '2024-06-30');
```

---

## 📁 Estructura del Repositorio

``` text
📦 tienda-maquillaje-db
│
├── 📄 README.md
├── 📁 diagramas
│   └── diagrama-er.png
│
├── 📁 sql
│   ├── ddl.sql
│   ├── dml.sql
│   └── dql.sql
│
└── 📁 documentación
    └── especificación.pdf
```

---

## 👥 Autor

Victor Manuel Recinos Gómez

Proyecto académico — Campuslands 
