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
Incluye las relaciones, llaves primarias y llaves foráneas.

> **Nota:** Inserta aquí la imagen del diagrama exportado desde Draw.io, MySQL Workbench o dbdiagram.io.

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
-- Aquí va todo el DDL completo que ya generamos
-- Incluye: Categoria, Producto, Cliente, Empleado, Venta, DetalleVenta,
-- Proveedor, OrdenCompra, DetalleOrdenCompra
```
---

## 📦 DML — Inserción de Datos Reales
Archivo: dml.sql

Incluye:

10 productos reales por categoría (Maybelline, MAC, Dior, Fenty, etc.)

10 clientes reales ficticios

10 empleados

10 proveedores reales (L’Oréal, Dior, Estée Lauder, etc.)

```sql
-- Aquí va todo el DML real que ya generamos
-- Productos, Clientes, Empleados, Proveedores

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
-- Aquí van todos los procedimientos almacenados generados

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

Proyecto académico — Universidad de San Carlos de Guatemala
