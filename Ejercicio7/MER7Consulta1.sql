use MER7;
select Producto.ID, Producto.Nombre, Producto.Descripcion,Producto.IVA,Producto.Precio_Unitario
FROM Producto
WHERE Producto.IVA = "10%";
