/* questao_01_logico: */

-- ----------------------------------------------------------------------
-- Dados dos tipos das publicações
CREATE TABLE tipo_publicacoes (
    id_tipo_publicacao SERIAL,
    descricao_tipo     VARCHAR(050),
	CONSTRAINT pk_tipo_publicacoes PRIMARY KEY (id_tipo_publicacao)
);


-- ----------------------------------------------------------------------
-- Dados das publicações
CREATE TABLE publicacoes (
    id_publicacao        SERIAL,
    titulo               VARCHAR(150),
    id_tipo_publicacao   INTEGER,
	CONSTRAINT pk_publicacoes PRIMARY KEY (id_publicacao),
	CONSTRAINT FK_publicacoes FOREIGN KEY (id_tipo_publicacao)
    	REFERENCES tipo_publicacoes (id_tipo_publicacao) ON DELETE RESTRICT
);


-- ----------------------------------------------------------------------
-- Dados das livrarias
CREATE TABLE livrarias (
    cnpj         VARCHAR(014),
    razao_social VARCHAR(100),
	CONSTRAINT pk_livrarias PRIMARY KEY (cnpj)
);


-- ----------------------------------------------------------------------
-- Dados dos setores
CREATE TABLE setores (
    id_setor   SERIAL,
    nome_setor VARCHAR(050),
	CONSTRAINT pk_setores PRIMARY KEY (id_setor)
);


-- ----------------------------------------------------------------------
-- Dados cargos
CREATE TABLE cargos (
    id_cargo        SERIAL,
    descricao_cargo VARCHAR(50),
	CONSTRAINT pk_cargos PRIMARY KEY (id_cargo)
);


-- ----------------------------------------------------------------------
-- Dados das pessoas
CREATE TABLE pessoas (
    cpf      VARCHAR(011),
    nome     VARCHAR(050),
    id_setor INTEGER,
    id_cargo INTEGER,
	CONSTRAINT pk_pessoas PRIMARY KEY (cpf),
	CONSTRAINT fk_pessoas_1 FOREIGN KEY (id_setor)
    	REFERENCES setores (id_setor) ON DELETE CASCADE,
	CONSTRAINT fk_pessoas_2 FOREIGN KEY (id_cargo)
    	REFERENCES cargos (id_cargo) ON DELETE RESTRICT
);


-- ----------------------------------------------------------------------
-- Associação PESSOAS x PUBLICAÇÕES
CREATE TABLE pessoas_publicacoes (
    cpf           VARCHAR(11),
    id_publicacao INTEGER,
	CONSTRAINT pk_pessoas_publicacoes PRIMARY KEY (cpf, id_publicacao),
	CONSTRAINT fk_pessoas_publicacoes_1 FOREIGN KEY (cpf)
   		REFERENCES pessoas (cpf) ON DELETE RESTRICT,
	CONSTRAINT fk_pessoas_publicacoes_2 FOREIGN KEY (id_publicacao)
   		REFERENCES publicacoes (id_publicacao) ON DELETE RESTRICT
);


-- ----------------------------------------------------------------------
-- Associação PUBLICAÇÕES x LIVRARIAS
CREATE TABLE publicacoes_livrarias (
    id_publicacao INTEGER,
    cnpj          VARCHAR(14),
	CONSTRAINT pk_publicacoes_livrarias PRIMARY KEY (id_publicacao, cnpj),
	CONSTRAINT fk_publicacoes_livrarias_1 FOREIGN KEY (id_publicacao)
    	REFERENCES publicacoes (id_publicacao) ON DELETE RESTRICT,
 	CONSTRAINT fk_publicacoes_livrarias_2 FOREIGN KEY (cnpj)
    	REFERENCES livrarias (cnpj) ON DELETE RESTRICT
);