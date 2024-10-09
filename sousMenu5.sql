prompt
prompt         ***MENU MODIFICATION***
prompt 1. Supprimer un Client
prompt 2. Modifier Numero Client
prompt 3. MENU PRINCIPAL
accept choixMenu prompt "Votre choix: " 

SET term OFF
COLUMN script NEW_VALUE vScript
SELECT CASE '&choixMenu'
	WHEN '1' THEN 'Suppression\deleteClient.sql'
	WHEN '2' THEN 'UpdateClient\UpdateNumClient.sql'
	WHEN '3' THEN 'MenuPrincipal.sql'
	ELSE 'sousMenu5.sql'
END AS script
FROM dual;
SET term ON
@C:\ProjetFinalV2\&vScript