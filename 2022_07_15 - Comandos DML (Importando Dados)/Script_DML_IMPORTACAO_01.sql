DROP TABLE dados_brutos.servidores_ifrn;
CREATE TABLE dados_brutos.servidores_ifrn (
	matricula 			VARCHAR(100),
	nome 				VARCHAR(200),
	email 				VARCHAR(500),
	cargo 				VARCHAR(500),
	funcoes	 			VARCHAR(500),
	situacao			VARCHAR(500),
	campus_lotacao		VARCHAR(500),
	setor_lotacao		VARCHAR(500),
	campus_exercicio	VARCHAR(500),
	setor_exercicio		VARCHAR(500),
	campus_suap			VARCHAR(500),
	setor_suap			VARCHAR(500),
	disciplina_ingresso VARCHAR(500),
	excluido			VARCHAR(500)
);


COPY dados_brutos.servidores_ifrn 
	(matricula, nome, email, cargo, 
	 funcoes, situacao, campus_lotacao, 
	 setor_lotacao, campus_exercicio, 
	 setor_exercicio, campus_suap, 
	 setor_suap, disciplina_ingresso, excluido) 
FROM 'D:/OneDrive - Instituto Federal do Rio Grande do Norte/(IFRN) DIATINF/(2022.1) Material De Aula/TEC.0022 - Banco De Dados (NCT)/2022.1-BancoDados/2022_07_15 - Comandos DML/SUAP_Relatorio_Servidores.csv' 
DELIMITER ';' 
CSV 
HEADER 
ENCODING 'UTF8' 
QUOTE '\"' 
ESCAPE '''';
