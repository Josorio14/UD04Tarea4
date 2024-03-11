use MER7;
select Ticket.Num_factura, Ticket.Fecha, Empleado.Nombre, Empleado.Apellido
FROM Ticket, Empleado, Producto, Linia_ticket
WHERE Producto.ID = Linia_ticket.Producto_ID and 
Ticket.Num = Linia_ticket.Ticket_Num and 
Empleado.ID = Ticket.Empleado_ID and
Producto.Nombre = "Leche Asturiana";