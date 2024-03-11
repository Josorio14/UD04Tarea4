use MER6;
select Reservas.Fecha,Reservas.Importe, Vuelo.Num_vuelo, Pasajeros.Nombre, Pasajeros.Apellido
FROM Reservas, Vuelo, Pasajeros
WHERE Pasajeros.ID=Reservas.Pasajeros_ID and Vuelo.ID = Reservas.Vuelo_ID and Pasajeros.Nombre= 'Mariano';