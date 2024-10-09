ACCEPT nom_produit PROMPT "Entrez le nom du prduit: "
ACCEPT quantite_produit PROMPT "Entrez la quantité en stock: "
ACCEPT prix_unitaire PROMPT "Entrez le prix unitaire: "
BEGIN
    INSERT INTO entrepot.jgsc_produit (NUMPROD, NOMPROD, QUANTITEPROD, PRIXPROD)
		VALUES (NULL, '&nom_produit', '&quantite_produit', '&prix_unitaire');
		
    DBMS_OUTPUT.PUT_LINE('Produit ajoute.');
	COMMIT;
	
    --Affichage apres insertion en passant par affichePackage
	entrepot.affichepackage.listeProduit;
	
	EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('ERREUR, numProduit existe deja');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('ERREUR, good Luck to find it');
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql