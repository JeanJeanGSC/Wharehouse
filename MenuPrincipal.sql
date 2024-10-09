SET serverOutput ON
SET verify OFF

prompt
prompt         ***MENU PRINCIPAL***
prompt 1. Insertion
prompt 2. Affichage
prompt 3. Facturation
prompt 4. Rabais
prompt 5. MaJ et Suppression
prompt 6. Quitter
accept choixMenu prompt "Votre choix: " 

SET term OFF
COLUMN script NEW_VALUE vScript
SELECT CASE '&choixMenu'
	WHEN '1' THEN 'sousMenu1.sql'
	WHEN '2' THEN 'Affichage3Tables.sql'
	WHEN '3' THEN 'Facture\AppelProcFacture.sql'
	WHEN '4' THEN 'Rabais\appelProcRabais.sql'
	WHEN '5' THEN 'sousMenu5.sql'
	WHEN '6' THEN 'Quitter.sql'
	ELSE 'MenuPrincipal.sql'
END AS script
FROM dual;
SET term ON
@C:\ProjetFinalV2\&vScript

SET verify ON