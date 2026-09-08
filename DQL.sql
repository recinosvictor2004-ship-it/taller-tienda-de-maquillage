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
