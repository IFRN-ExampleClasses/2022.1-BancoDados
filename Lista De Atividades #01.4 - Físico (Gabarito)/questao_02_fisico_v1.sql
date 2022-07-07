-- ------------------------------------------------------------
-- Criando a tabela PESSOAS
CREATE TABLE pessoas (
    cpf           VARCHAR(011),
    nome          VARCHAR(100) NOT NULL,
    rg            VARCHAR(020),
    cnh           VARCHAR(020) NOT NULL,
    tipo_cnh      VARCHAR(001) NOT NULL,
    logradouro 	  VARCHAR(100),
    cep 		  VARCHAR(008),
    complemento   VARCHAR(030),
    numero 		  VARCHAR(010),
    bairro 		  VARCHAR(030),
    cidade 		  VARCHAR(050),
    estado 		  VARCHAR(002),
    celular 	  VARCHAR(009),
    residencial   VARCHAR(009),
    comercial 	  VARCHAR(009),
    data_cadastro DATE,
    CONSTRAINT pk_pessoas   PRIMARY KEY (cpf),
	CONSTRAINT ck_pessoas_1 CHECK (LENGTH(cpf) = 11),
	CONSTRAINT ck_pessoas_2 CHECK (data_cadastro <= CURRENT_DATE)
);

-- ------------------------------------------------------------
-- Criando a tabela FUNCIONARIOS
CREATE TABLE funcionarios (
    id_funcionario   SERIAL,
    salario 		 NUMERIC(10,2),
    data_contratacao DATE,
    cpf 			 VARCHAR(011),
	CONSTRAINT pk_funcionarios PRIMARY KEY (id_funcionario),
	CONSTRAINT fk_funcionarios FOREIGN KEY (cpf) REFERENCES pessoas (cpf)
);

-- ------------------------------------------------------------
-- Criando a tabela MARCAS
CREATE TABLE marcas (
    id_marca   SERIAL,
    nome_marca VARCHAR(050) NOT NULL,
	CONSTRAINT pk_marcas PRIMARY KEY (id_marca)
);

-- ------------------------------------------------------------
-- Criando a tabela MODELOS
CREATE TABLE modelos (
    id_modelo 	SERIAL,
    nome_modelo VARCHAR(50) NOT NULL,
    id_marca 	INTEGER,
	CONSTRAINT pk_modelos PRIMARY KEY (id_modelo),
	CONSTRAINT fk_modelos FOREIGN KEY (id_marca) REFERENCES marcas (id_marca)
);

-- ------------------------------------------------------------
-- Criando a tabela COMBUSTIVEIS
CREATE TABLE combustiveis (
    id_combustivel 	 SERIAL,
    nome_combustivel VARCHAR(050) NOT NULL,
	CONSTRAINT pk_combustiveis PRIMARY KEY (id_combustivel)
);

-- ------------------------------------------------------------
-- Criando a tabela CORES
CREATE TABLE cores (
    id_cor   SERIAL,
    nome_cor VARCHAR(100),
	CONSTRAINT pk_cores PRIMARY KEY (id_cor)
);

-- ------------------------------------------------------------
-- Criando a tabela VEICULOS
CREATE TABLE veiculos (
	renavam		   VARCHAR(050),
    chassi         VARCHAR(050),
    placa 		   VARCHAR(008) NOT NULL,
    ano_modelo     INTEGER,
    ano_fabricacao INTEGER,
    motor 		   VARCHAR(020),
    km_atual 	   INTEGER,
    valor_diaria   NUMERIC(10,2),
    id_modelo 	   INTEGER,
    id_combustivel INTEGER,
    id_cor 		   INTEGER,
	CONSTRAINT pk_veiculos   PRIMARY KEY (renavam),
	CONSTRAINT fk_veiculos_1 FOREIGN KEY (id_modelo) REFERENCES modelos (id_modelo), 
	CONSTRAINT fk_veiculos_2 FOREIGN KEY (id_combustivel) REFERENCES combustiveis (id_combustivel),
	CONSTRAINT fk_veiculos_3 FOREIGN KEY (id_cor) REFERENCES cores (id_cor),
	CONSTRAINT ck_veiculos_1 CHECK (ano_modelo <= EXTRACT(YEAR FROM CURRENT_DATE)+1),
	CONSTRAINT ck_veiculos_2 CHECK (ano_fabricacao <= EXTRACT(YEAR FROM CURRENT_DATE))	
);

-- ------------------------------------------------------------
-- Criando a tabela LOCACAO_PESSOAS_VEICULOS
CREATE TABLE locacao_pessoas_veiculos (
    num_contrato            SERIAL,
    data_locacao            DATE,
    data_prevista_devolucao DATE,
    data_efetiva_devolucao  DATE,
    valor_diaria   			NUMERIC(10,2),
    km_inicial 				INTEGER,
    km_final 				INTEGER,
    cpf 					VARCHAR(011),
    renavam 				VARCHAR(050),
	CONSTRAINT pk_locacao_pessoas_veiculos   PRIMARY KEY (num_contrato),
	CONSTRAINT fk_locacao_pessoas_veiculos_1 FOREIGN KEY (cpf) REFERENCES pessoas (cpf),
	CONSTRAINT fk_locacao_pessoas_veiculos_2 FOREIGN KEY (renavam) REFERENCES veiculos (renavam),
	CONSTRAINT ck_locacao_pessoas_veiculos_1 CHECK (data_locacao <= CURRENT_DATE),
	CONSTRAINT ck_locacao_pessoas_veiculos_2 CHECK (data_prevista_devolucao >= data_locacao),
	CONSTRAINT ck_locacao_pessoas_veiculos_3 CHECK (data_efetiva_devolucao >= data_locacao),
	CONSTRAINT ck_locacao_pessoas_veiculos_4 CHECK (km_final >= km_inicial)
);
