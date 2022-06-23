/* questao_01_logico: */

CREATE TABLE publicacoes (
    id_publicacao        SERIAL PRIMARY KEY,
    titulo               VARCHAR(150),
    id_tipo_publicacao   INTEGER
);

CREATE TABLE livrarias (
    cnpj         VARCHAR(014) PRIMARY KEY,
    razao_social VARCHAR(100)
);

CREATE TABLE pessoas (
    cpf      VARCHAR(011) PRIMARY KEY,
    nome     VARCHAR(050),
    id_setor INTEGER,
    id_cargo INTEGER
);

CREATE TABLE setores (
    id_setor   SERIAL PRIMARY KEY,
    nome_setor VARCHAR(050)
);

CREATE TABLE tipo_publicacoes (
    id_tipo_publicacao SERIAL PRIMARY KEY,
    descricao_tipo     VARCHAR(050)
);

CREATE TABLE cargos (
    id_cargo        SERIAL PRIMARY KEY,
    descricao_cargo VARCHAR(50)
);

CREATE TABLE pessoas_publicacoes (
    cpf           VARCHAR(11),
    id_publicacao INTEGER,
	PRIMARY KEY (cpf, id_publicacao)
);

CREATE TABLE publicacoes_livrarias (
    id_publicacao INTEGER,
    cnpj          VARCHAR(14),
	PRIMARY KEY (id_publicacao, cnpj)
);
 
ALTER TABLE publicacoes ADD CONSTRAINT FK_publicacoes_2
    FOREIGN KEY (id_tipo_publicacao)
    REFERENCES tipo_publicacoes (id_tipo_publicacao)
    ON DELETE CASCADE;
 
ALTER TABLE pessoas ADD CONSTRAINT FK_pessoas_2
    FOREIGN KEY (id_setor)
    REFERENCES setores (id_setor)
    ON DELETE CASCADE;
 
ALTER TABLE pessoas ADD CONSTRAINT FK_pessoas_3
    FOREIGN KEY (id_cargo)
    REFERENCES cargos (id_cargo)
    ON DELETE SET NULL;
 
ALTER TABLE pessoas_publicacoes ADD CONSTRAINT FK_pessoas_publicacoes_1
    FOREIGN KEY (cpf)
    REFERENCES pessoas (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE pessoas_publicacoes ADD CONSTRAINT FK_pessoas_publicacoes_2
    FOREIGN KEY (id_publicacao)
    REFERENCES publicacoes (id_publicacao)
    ON DELETE SET NULL;
 
ALTER TABLE publicacoes_livrarias ADD CONSTRAINT FK_publicacoes_livrarias_1
    FOREIGN KEY (id_publicacao)
    REFERENCES publicacoes (id_publicacao)
    ON DELETE SET NULL;
 
ALTER TABLE publicacoes_livrarias ADD CONSTRAINT FK_publicacoes_livrarias_2
    FOREIGN KEY (cnpj)
    REFERENCES livrarias (cnpj)
    ON DELETE SET NULL;