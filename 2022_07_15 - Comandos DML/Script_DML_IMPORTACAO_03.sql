CREATE TABLE campus (
	id_campus SERIAL,
	sigla_campus VARCHAR(05),
	nome_campus  VARCHAR(60),
	CONSTRAINT pk_campus PRIMARY KEY (id_campus)
);

INSERT INTO campus (sigla_campus)
	SELECT campus_lotacao FROM (
		  SELECT campus_lotacao, LENGTH(campus_lotacao)
			FROM dados_brutos.servidores_ifrn 
		   WHERE campus_lotacao IS NOT NULL

		UNION

		  SELECT campus_exercicio, LENGTH(campus_exercicio)
			FROM dados_brutos.servidores_ifrn 
		   WHERE campus_exercicio IS NOT NULL

		UNION

		  SELECT campus_suap, LENGTH(campus_suap)
			FROM dados_brutos.servidores_ifrn 
		   WHERE campus_suap IS NOT NULL
	) AS lista_campus
	ORDER BY length  DESC
	
SELECT * FROM campus