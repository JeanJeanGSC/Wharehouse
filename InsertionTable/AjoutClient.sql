/*
	--(numClient, nomClient, prenomClient, telephone, noRue, nomRue, ville, province, codePostal, Pays)
	INSERT INTO entrepot.jgsc_client VALUES (
		"ENTREPOT"."NumClient_SEQ".NEXTVAL, 'Couturier', 'Jean', '(514)660-0280',
		3780, 'Adam', 'Montréal', 'Qc', 'H1W 1Z4', 'Canada');
*/

ACCEPT nom_client PROMPT "Entrez le nom du client: "
ACCEPT prenom_client PROMPT "Entrez le prénom du client: "
ACCEPT saisie_tel PROMPT "Entrez le numero de téléphone ((000)000-0000): "
ACCEPT num_rue PROMPT "Entrez le numero de rue: "
ACCEPT nom_rue PROMPT "Entrez le nom de la rue: "
ACCEPT ville PROMPT "Entrez la ville: "
ACCEPT province PROMPT "Entrez la province (2 lettres): "
ACCEPT saisie_code_postal PROMPT "Entrez le code postal (A1B 2C3): "
ACCEPT pays PROMPT "Entrez le pays: "

DECLARE
    vTel entrepot.jgsc_client.tel%TYPE;
    vCodePostal entrepot.jgsc_client.codePostal%TYPE;
BEGIN
    -- Vérification du format du téléphone
    vTel := '&saisie_tel';
    IF REGEXP_LIKE(vTel, '^\(\d{3}\)\d{3}-\d{4}$') THEN
        -- Vérification du format du code postal
        vCodePostal := '&saisie_code_postal';
        IF REGEXP_LIKE(vCodePostal, '^[A-Z]\d[A-Z] \d[A-Z]\d$') THEN
		
            INSERT INTO entrepot.jgsc_client (NUMCLIENT, NOMCLIENT, PRENOMCLIENT, TEL, NUMRUE, NOMRUE, VILLE, PROVINCE, CODEPOSTAL, PAYS)
				VALUES (NULL, '&nom_client', '&prenom_client', vTel, '&num_rue', '&nom_rue', '&ville', '&province', vCodePostal, '&pays');
			
            DBMS_OUTPUT.PUT_LINE('Client ajoute.');
			COMMIT;
			
            --Affichage apres insertion en passant par affichePackage
			entrepot.affichepackage.listeClient;
        ELSE
            DBMS_OUTPUT.PUT_LINE('ERREUR, Le code postal doit etre au format A1B 2C3');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('ERREUR, Le numéro de telephone doit etre au format (000)000-0000');
    END IF;
	EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERREUR, numClient existe deja');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('ERREUR, good Luck to find it');
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql