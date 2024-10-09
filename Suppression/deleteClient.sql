ACCEPT vNumClient NUMBER PROMPT "Entrez le numéro du client à supprimer: "

BEGIN
    DELETE FROM entrepot.jgsc_client
    WHERE numclient = &vNumClient;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Le client ' || &vNumClient || ' n''existe pas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Suppression du client ' || &vNumClient || ' effectuee.');
    END IF;
	
	--Affichage apres suppression en passant par affichePackage
	entrepot.affichepackage.listeClient;
			
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('ERREUR, good Luck to find it');
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql