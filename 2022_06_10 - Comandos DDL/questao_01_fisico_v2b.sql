ALTER TABLE publicacoes ADD COLUMN estoque INTEGER DEFAULT 0;

ALTER TABLE publicacoes ADD CONSTRAINT cK_publicacoes CHECK (estoque >= 0);

ALTER TABLE pessoas ADD COLUMN data_nascimento DATE;

ALTER TABLE pessoas ADD CONSTRAINT ck_pessoas CHECK (data_nascimento < CURRENT_DATE);
