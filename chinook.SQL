ejercicio 1:
/*Nombre y Apellido de todos los empleados, en orden alfabético.*/
SELECT FirstName, LastName FROM employees
ORDER BY  LastName ASC

ejercicio 2:
/*Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto.*/
SELECT Title, t.name, t.Milliseconds FROM tracks t
INNER JOIN albums a ON t.AlbumId = t.AlbumId 
WHERE Title like "Big Ones"
ORDER BY Milliseconds ASC

ejercicio 3:
SELECT g.Name, COUNT(t.TrackId) AS cantidad_canciones
FROM  genres g
INNER JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY  cantidad_canciones DESC;


ejercicio 4:
SELECT a.Title, count(t.TrackId)/muestra en la pantalla/
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId, a.Title
HAVING COUNT(t.TrackId) >= 5;

ejercicio 5: 
SELECT a.Title AS albums, SUM(t.UnitPrice) AS Preciototal
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId
ORDER BY Preciototal ASC
LIMIT 10;

ejercicio 7:
SELECT  t.name, t.Milliseconds, a.Title, at.name
FROM  tracks t
INNER JOIN albums a ON t.AlbumId = a.AlbumId
INNER JOIN artists at ON a.ArtistId = at.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20;

ejercicio 8:
SELECT e.LastName AS "Empleado", e.Title AS "Puesto", m.LastName AS "Apellido del jefe",
COUNT(c.CustomerId) AS "Cantidad de clientes" FROM employees e
INNER JOIN employees m ON e.ReportsTo = m.EmployeeId
INNER JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId, e.LastName, e.Title, m.LastName
ORDER BY "Cantidad de Clientes" DESC;

ejercicio 9:
INSERT INTO tracks (TrackId,Name, MediaTypeId, Milliseconds, UnitPrice)
VALUES 
(3512,'Bohemian Rhapsody' ,1, 354000, 0.99),
(3513,'rockstar' ,1, 354001, 0.99),
(3514,'campos eliseos' ,1, 354002, 0.99),
(3515,'cicatrices' ,1, 354003, 0.99);

ejercicio 10:
SELECT t.TrackId, t.Name
FROM tracks t
ORDER BY  t.TrackId DESC
LIMIT 4;

ejercicio 11:
UPDATE tracks
SET Name = 'Ramen para dos'
WHERE TrackId = 3516;

UPDATE tracks
SET Name = 'Verte de cerca'
WHERE TrackId = 3517;

ejercicio 12:
SELECT * FROM tracks
WHERE TrackId IN (3512, 3513);

ejercicio 13:
DELETE FROM tracks
WHERE TrackId IN (3512, 3513);