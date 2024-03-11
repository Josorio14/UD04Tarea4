use MER6;
SELECT Pasajeros.DNI, Pasajeros.Apellido, Vuelo.Num_vuelo, Vuelo.Origen, Vuelo.Destino, Reservas.Importe
FROM  Pasajeros, Vuelo, Reservas
WHERE Pasajeros.ID = Reservas.Pasajeros_ID and
	Vuelo.ID=Reservas.Vuelo_ID;