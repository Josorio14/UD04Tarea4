use MER4;
SELECT Cliente.Nombre as "Nombre Cliente", Cliente.Apellido as "Apellido Cliente" , Polissa.Num_Polissa as "Numero de polissa"
FROM Cliente, Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and
Cliente.Nombre = "Miquel";

