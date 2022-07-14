-- INSERT INTO nome_tabela (lista_campos) VALUES (lista_valores);

SELECT * FROM marcas;

-- ----------------------------------------------------------------------
-- Inserindo registros na tabela MARCAS
INSERT INTO marcas (nome_marca) VALUES ('Volkswagen');

INSERT INTO marcas (nome_marca) VALUES ('General Motors');

INSERT INTO marcas (nome_marca) VALUES ('Hyundai') RETURNING id_marca;

INSERT INTO marcas (nome_marca) VALUES ('Honda') RETURNING *;

INSERT INTO marcas (nome_marca) 
    VALUES ('Nissan'),
		   ('Ford'),
		   ('Citroën'),
		   ('Peugeot'),
		   ('Renault'),
		   ('Fiat'),
		   ('Toyota')
 RETURNING *;
 
INSERT INTO marcas (nome_marca) VALUES ('Gurgel') RETURNING *;
 
-- ----------------------------------------------------------------------
-- Inserindo registros na tabela MODELOS

INSERT INTO modelos (nome_modelo, id_marca) 
    VALUES ('Gol', 1),
		   ('Uno',10),
		   ('Palio',10),
		   ('Fox',1),
		   ('Siena',10),
		   ('Celta',2),
		   ('Voyage',1),
		   ('HB20',3),
		   ('Corsa Sedan',2),
		   ('Onix',2),
		   ('Sandero',9),
		   ('Fiesta',6),
		   ('Cobalt',2),
		   ('Ka',6),
		   ('Corolla',11),
		   ('Civic',4),
		   ('Fit',4),
		   ('C3',7),
		   ('Logan',9),
		   ('March',5),
		   ('207',8),
		   ('Versa',5),
		   ('C3 Picasso',7),
		   ('207 Sedan',8),
		   ('Etios',11)
 RETURNING *;

INSERT INTO modelos (nome_modelo, id_marca) 
    VALUES ('BR-800', (SELECT id_marca FROM marcas WHERE nome_marca = 'Gurgel') );

SELECT * FROM modelos;


INSERT INTO marcas (nome_marca) 
    VALUES ('Abarth'),
		   ('Aiways'),
		   ('Bentley'),
		   ('Jaguar'),
		   ('JEEP'),
		   ('KIA'),
		   ('BMW')
 RETURNING *;
		  