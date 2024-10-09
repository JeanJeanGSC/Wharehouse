CREATE OR REPLACE PACKAGE entrepot.affichepackage AS
      PROCEDURE listeProduit;
      PROCEDURE listeClient;
      PROCEDURE listeVente;
END affichepackage;
/

CREATE OR REPLACE PACKAGE BODY entrepot.affichepackage AS
-- pour appel nomShema.nomPackage.nomProcedure;

    PROCEDURE listeProduit IS
	BEGIN
        DBMS_OUTPUT.PUT_LINE('Num produit | Nom produit | Quantite en stock | Prix unitaire');
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
		FOR listeProduit IN (SELECT * FROM entrepot.jgsc_produit) LOOP
			DBMS_OUTPUT.PUT_LINE(
				RPAD(listeProduit.numProd, 11) || ' | ' ||
				RPAD(listeProduit.nomProd, 12) || ' | ' ||
				RPAD(listeProduit.quantiteProd, 17) || ' | ' ||
				RPAD(listeProduit.prixProd, 13) || '$'
			);
		END LOOP;
	END listeProduit;

    PROCEDURE listeClient IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Num client | Nom client | Prenom client | Telephone');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR listeClient IN (SELECT * FROM entrepot.jgsc_client) LOOP
			DBMS_OUTPUT.PUT_LINE(
				RPAD(listeClient.numClient, 10) || ' | ' ||
				RPAD(listeClient.nomClient, 11) || ' | ' ||
				RPAD(listeClient.prenomClient, 13) || ' | ' ||
				RPAD(listeClient.tel, 13)
			);
		END LOOP;
    END listeClient;

    PROCEDURE listeVente IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Code vente | Num client | Num produit | Date vente | Quantite vendue | Prix vente');
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------');
		FOR listeVente IN (SELECT * FROM entrepot.jgsc_vente) LOOP
			DBMS_OUTPUT.PUT_LINE(
            RPAD(listeVente.CODEVENTE, 10) || ' | ' ||
            RPAD(listeVente.NUMCLIENT, 10) || ' | ' ||
            RPAD(listeVente.NUMPROD, 11) || ' | ' ||
            RPAD(listeVente.DATEVENTE, 10) || ' | ' ||
            RPAD(listeVente.QUANTITEVENDU, 15) || ' | ' ||
            RPAD(listeVente.PRIXVENTE, 10) || '$'
			);
		END LOOP;
    END listeVente;

END affichepackage;
/