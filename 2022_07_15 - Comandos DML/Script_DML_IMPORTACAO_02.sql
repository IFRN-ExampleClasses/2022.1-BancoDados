-- Obtendo a relação de disciplinas (sem repetição)
-- e o tamanho máximo do nome da disciplina
SELECT DISTINCT disciplina_ingresso, LENGTH(disciplina_ingresso)
  FROM dados_brutos.servidores_ifrn
ORDER BY LENGTH(disciplina_ingresso) DESC

-- ----------------------------------------------------------------------
-- Criando a tabela normalizada DISCIPLINAS_INGRESSO
CREATE TABLE disciplinas_ingresso (
	id_disciplina_ingresso   SERIAL,
	nome_disciplina_ingresso VARCHAR(100),
	CONSTRAINT pk_disciplinas_ingresso PRIMARY KEY (id_disciplina_ingresso)
);

-- ----------------------------------------------------------------------
-- Inserir os dados na tabela DISCPLINAS_INGRESSO
INSERT INTO disciplinas_ingresso (nome_disciplina_ingresso)
	SELECT DISTINCT disciplina_ingresso
	  FROM dados_brutos.servidores_ifrn
	ORDER BY disciplina_ingresso;
