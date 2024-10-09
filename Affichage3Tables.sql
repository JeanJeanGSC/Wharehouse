BEGIN
	DBMS_OUTPUT.PUT_LINE(' ');
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('|                        LISTE CLIENTS                      |');
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
	entrepot.affichepackage.listeClient;
	
	DBMS_OUTPUT.PUT_LINE(' ');
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('|                       LISTE PRODUITS                      |');
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
	entrepot.affichepackage.listeProduit;
	
	DBMS_OUTPUT.PUT_LINE(' ');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('|                                  LISTE VENTES                                 |');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------');
	entrepot.affichepackage.listeVente;
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql