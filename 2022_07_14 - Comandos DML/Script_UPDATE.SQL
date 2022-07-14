-- UPDATE nome_tabela
--    SET campo1 = novo_valor,
--        campo2 = novo_valor,
--        ...,
--        campoN = novo_valor
--  WHERE conficao_filtro; 

SELECT* FROM marcas;

UPDATE marcas 
   SET nome_marca = 'General Motors (Chevrolet)'
 WHERE id_marca = 2;