ACCEPT oldNumclient PROMPT "Entrez le numéro de client a modifier: "
ACCEPT newNumClient PROMPT "Entrez le nouveau numéro : "

DECLARE
    vOldNumclient NUMBER := &oldNumclient;
    vNewNumClient NUMBER := &newNumClient;
BEGIN
    UPDATE entrepot.jgsc_client
    SET numclient = vNewNumClient
    WHERE numclient = vOldNumclient;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERREUR: Le numéro de client ' || vOldNumclient || ' n''existe pas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Mise à jour du numéro de client effectuée.');
        FOR client IN (SELECT * FROM entrepot.jgsc_client WHERE numclient = vNewNumClient) LOOP
            DBMS_OUTPUT.PUT_LINE('Ancien numéro: ' || vOldNumclient);
            DBMS_OUTPUT.PUT_LINE('Nouveau numéro: ' || client.numclient ||
				' Nom du client: ' || client.nomclient || ' ' || client.prenomclient);
        END LOOP;
    END IF;
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql