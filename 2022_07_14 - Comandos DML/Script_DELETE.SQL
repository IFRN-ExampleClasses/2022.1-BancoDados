-- DELETE FROM nome_tabela WHERE condicao_exclusao

DELETE FROM marcas 
     WHERE id_marca NOT IN (SELECT DISTINCT id_marca FROM modelos ORDER BY id_marca)
 RETURNING *;