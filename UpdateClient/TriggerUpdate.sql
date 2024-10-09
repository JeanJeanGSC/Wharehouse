CREATE OR REPLACE TRIGGER jgsc_NumClientTableVente
BEFORE UPDATE OF numclient ON ENTREPOT.jgsc_client
FOR EACH ROW
BEGIN
    UPDATE ENTREPOT.jgsc_vente
    SET numclient = :new.numclient
    WHERE numclient = :old.numclient;
END;
/