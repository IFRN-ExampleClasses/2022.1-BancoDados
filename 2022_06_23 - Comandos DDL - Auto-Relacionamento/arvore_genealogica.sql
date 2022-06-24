CREATE TABLE pessoa (
	id_pessoa				SERIAL,
	nome					VARCHAR(100),
	data_nascimento 		DATE,
	id_pessoa_pai			INTEGER,
	id_pessoa_mae			INTEGER,
	CONSTRAINT pk_pessoa 	PRIMARY KEY (id_pessoa)
);

ALTER TABLE pessoa ADD CONSTRAINT fk_pessoa_pai
	(id_pessoa_pai) REFERENCES pessoa (id_pessoa);

ALTER TABLE pessoa ADD CONSTRAINT fk_pessoa_mae
	(id_pessoa_mae) REFERENCES pessoa (id_pessoa);
