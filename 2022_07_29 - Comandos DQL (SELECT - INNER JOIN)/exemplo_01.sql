/* Usando Sub-Consulta */
SELECT id_diario,
  		 id_componente_curricular,
		 (SELECT descricao_componente_curricular
		    FROM dados_tratados.componente_curricular
		   WHERE componente_curricular.id_componente_curricular = diarios.id_componente_curricular
		 )
    FROM dados_tratados.diarios;

/* ---------------------------------------------------------------------- */
/* Consulta Cartesiana */
   SELECT  diarios.id_diario,
		   diarios.id_componente_curricular,
		   componente_curricular.descricao_componente_curricular
      FROM dados_tratados.diarios,dados_tratados.componente_curricular
	 WHERE diarios.id_componente_curricular = componente_curricular.id_componente_curricular;
	  

/* ---------------------------------------------------------------------- */
/* Usando Junção (join) */
   SELECT  diarios.id_diario,
		   diarios.id_componente_curricular,
		   componente_curricular.descricao_componente_curricular
      FROM dados_tratados.diarios
INNER JOIN dados_tratados.componente_curricular
        ON diarios.id_componente_curricular = componente_curricular.id_componente_curricular;


   SELECT  diarios.id_diario,
		   diarios.id_componente_curricular,
		   componente_curricular.descricao_componente_curricular
      FROM dados_tratados.componente_curricular
INNER JOIN dados_tratados.diarios
        ON diarios.id_componente_curricular = componente_curricular.id_componente_curricular;

/*
diarios: 77.049
componentes curriculares: 7.008
*/

SELECT COUNT(*) FROM dados_tratados.diarios
SELECT COUNT(*) FROM dados_tratados.componente_curricular
