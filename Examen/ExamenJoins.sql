SELECT * FROM Clientes;
SELECT * FROM Comics;
SELECT * FROM Inventario;
SELECT * FROM Autores;



CREATE TABLE Autores (
id_autor bigint identity(300,1) PRIMARY KEY,
nombre VARCHAR(100),
pais_origen VARCHAR(100)
);


ALTER TABLE Comics
ADD id_autor bigint,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);

INSERT INTO Autores(nombre, pais_origen) VALUES 
('Frank Miller', 'Estados Unidos'),
('Alan Moore', 'Reino Unido'),
('Art Spiegellman', 'Suecia'),
('Neil Gaiman', 'Reino Unido');




SELECT a.nombre AS Autor, c.nombre AS Comic, i.cantidad_disponible
FROM Inventario i 
JOIN Comics c ON i.id_comic = c.id_comic
JOIN Autores a ON c.id_autor = a.id_autor;





SELECT a.pais_origen AS Autores, a.nombre, c.nombre
FROM Comics c
JOIN Autores a ON a.id_autor = c.id_autor;

UPDATE Comics 
SET id_autor = 300
WHERE id_comic = 16;
 
UPDATE Comics 
SET id_autor = 301
WHERE id_comic = 18;

UPDATE Comics 
SET id_autor = 302
WHERE id_comic = 20;

UPDATE Comics 
SET id_autor = 303
WHERE id_comic = 22;

UPDATE Comics 
SET id_autor = 300
WHERE id_comic = 26;

UPDATE Comics 
SET id_autor = 301
WHERE id_comic = 28;

UPDATE Comics 
SET id_autor = 302
WHERE id_comic = 32;

UPDATE Comics 
SET id_autor = 303
WHERE id_comic = 36;

UPDATE Comics 
SET id_autor = 300
WHERE id_comic = 40;

UPDATE Comics 
SET id_autor = 301
WHERE id_comic = 42;

UPDATE Comics 
SET id_autor = 302
WHERE id_comic = 44;

SELECT * from comics;



