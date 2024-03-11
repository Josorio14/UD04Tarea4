use MER4;
SELECT Polissa.Num_Polissa as "Numero de polissa", Tipos_Polissa.Nombre as "Nombre Polissa",Cliente.DNI, Cliente.Nombre as "Nombre del cliente", 
Cliente.Apellido as "Apellido del cliente"
FROM Cliente,Polissa, Tipos_Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and
Tipos_Polissa.ID = Polissa.Tipos_Polissa_ID and
Tipos_Polissa.Nombre = "Viaje";
