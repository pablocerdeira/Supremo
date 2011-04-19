/*
Verifique se esta procedure já não existe no banco.
Caso já exista, para executá-la basta o comando
call cria_gr_lei_lei()
*/

DROP PROCEDURE IF EXISTS SEN_Grafo.cria_gr_lei_lei;

DELIMITER //

CREATE PROCEDURE SEN_Grafo.cria_gr_lei_lei()

BEGIN
	DROP TABLE IF EXISTS SEN_Grafo.gr_lei_lei;

	CREATE TABLE SEN_Grafo.gr_lei_lei (
	    latch   SMALLINT  UNSIGNED NULL,
	    origid  BIGINT    UNSIGNED NULL,
	    destid  BIGINT    UNSIGNED NULL,
	    weight  DOUBLE    NULL,
	    seq     BIGINT    UNSIGNED NULL,
	    linkid  BIGINT    UNSIGNED NULL,
	    KEY (latch, origid, destid) USING HASH,
	    KEY (latch, destid, origid) USING HASH
	) ENGINE=OQGRAPH;

	INSERT INTO 
	    SEN_Grafo.gr_lei_lei 
	    (origid, destid, weight)
	SELECT lei_id_1, lei_id_2, peso 
	FROM SEN_Grafo.gr_lei_lei_disk;

	INSERT INTO 
	    SEN_Grafo.gr_lei_lei 
	    (origid, destid, weight)
	SELECT lei_id_2, lei_id_1, peso 
	FROM SEN_Grafo.gr_lei_lei_disk;

END //