SET SERVEROUTPUT ON
SET VERIFY OFF

PROMPT "Application d'un rabais pour une vente a une date precise"
ACCEPT vDateVente CHAR PROMPT "Entrez la date: "
ACCEPT vNumClient NUMBER PROMPT "Entrez le numero de client: "

BEGIN
    entrepot.procRabais(&vNumClient, TO_DATE('&vDateVente', 'RR-MM-DD'));
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql

/*
	PROBLEME DE DATE:
	Aucune de ces script ne fonctionne:
	
	SELECT *
    FROM entrepot.jgsc_vente
    WHERE entrepot.jgsc_vente.numclient = 1000000000
    AND entrepot.jgsc_vente.datevente = '07-05-24';
    
    SELECT *
    FROM entrepot.jgsc_vente
    WHERE entrepot.jgsc_vente.datevente = '06-05-24';
	
	SAUF CELUI-CI:
	SELECT *
    FROM entrepot.jgsc_vente
	
	mais inutile !
*/