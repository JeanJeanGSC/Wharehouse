prompt
prompt         ***MENU D''INSERTION***
prompt 1. Nouveau Produit
prompt 2. Nouveau Client
prompt 3. Nouveau contrat de Vente
prompt 4. MENU PRINCIPAL
accept choixMenu prompt "Votre choix: " 

SET term OFF
COLUMN script NEW_VALUE vScript
SELECT CASE '&choixMenu'
	WHEN '1' THEN 'InsertionTable\AjoutProduit.sql'
	WHEN '2' THEN 'InsertionTable\AjoutClient.sql'
	WHEN '3' THEN 'InsertionTable\Contrat.sql'
	WHEN '4' THEN 'MenuPrincipal.sql'
	ELSE 'sousMenu1.sql'
END AS script
FROM dual;
SET term ON
@C:\ProjetFinalV2\&vScript