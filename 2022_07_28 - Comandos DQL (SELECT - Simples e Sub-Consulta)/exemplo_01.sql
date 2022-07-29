/*
SELECT lista_campos
    FROM nome_tabela
   WHERE condicao_filtro
ORDER BY lista_campos_ordenacao ASC | DESC
*/

  SELECT id_campus, nome_campus, sigla_campus
    FROM dados_tratados.campus
   WHERE id_campus = (SELECT id_campus FROM dados_tratados.campus WHERE sigla_campus = 'CN')
   
   
  SELECT id_diario,
  		 id_componente_curricular,
		 (SELECT descricao_componente_curricular
		    FROM dados_tratados.componente_curricular
		   WHERE componente_curricular.id_componente_curricular = diarios.id_componente_curricular
		 )
    FROM dados_tratados.diarios 
   WHERE id_campus = 18 AND ano_letivo = 2021

/*
SELECT	CAST('1974-11-10' AS DATE) AS "data_nascimento",
		CURRENT_DATE,
		CURRENT_DATE - CAST('1974-11-10' AS DATE)
*/