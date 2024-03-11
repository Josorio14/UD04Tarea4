use MER4;
SELECT Cliente.Nombre as "Nombre cliente", Cliente.Apellido as "Apellido del cliente", Vendedor.Nombre as "Nombre del Vendedor",
Num_Polissa, Tipos_Polissa.Nombre as "Tipo de Polissa"
FROM Cliente, Vendedor, Polissa, Tipos_Polissa
WHERE Cliente.DNI = Polissa.Cliente_DNI and Vendedor.ID=Polissa.Vendedor_ID and
Tipos_Polissa.ID = Polissa.Tipos_Polissa_ID;
