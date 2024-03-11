use MER7;
select count(*)
FROM Linia_ticket, Ticket, Empleado
WHERE Ticket.Num = Linia_ticket.Ticket_Num and
Empleado.ID = Ticket.Empleado_ID and Empleado.ID LIKE '2';