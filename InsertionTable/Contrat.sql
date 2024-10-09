ACCEPT num_client PROMPT "Entrez le numero du client: "
ACCEPT num_produit PROMPT "Entrez le numero du produit vendu: "
ACCEPT quantite_vendu PROMPT "Entrez la quantite vendu: "

DECLARE
    vPrixVente entrepot.jgsc_vente.prixvente%TYPE;
    vStockActuel entrepot.jgsc_produit.quantiteprod%TYPE;
BEGIN
    -- Récupération du prix de vente unitaire du produit
    SELECT prixprod INTO vPrixVente FROM entrepot.jgsc_produit
    WHERE numprod = &num_produit;
    
    -- Récupération du stock actuel du produit
    SELECT quantiteprod INTO vStockActuel FROM entrepot.jgsc_produit
    WHERE numprod = &num_produit;
    
    IF vStockActuel < &quantite_vendu THEN
        DBMS_OUTPUT.PUT_LINE('La quantité de produits vendus dépasse la quantité actuellement en stock');
    ELSIF vStockActuel = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Le produit est en rupture de stock');
    ELSE
        BEGIN
            -- Mise à jour du stock dans la table jgsc_produit
            UPDATE entrepot.jgsc_produit
            SET quantiteprod = quantiteprod - &quantite_vendu
            WHERE numprod = &num_produit;
            
            
            INSERT INTO entrepot.jgsc_vente (CODEVENTE, NUMCLIENT, NUMPROD, DATEVENTE, QUANTITEVENDU, PRIXVENTE)
				VALUES (NULL, '&num_client', '&num_produit', SYSDATE, '&quantite_vendu', vPrixVente * 8);
            
            -- Validation de la transaction
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Contrat de vente créé.');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERREUR, good Luck to find it');
				ROLLBACK;
        END;
    END IF;
    
    --Affichage apres insertion en passant par affichePackage
	entrepot.affichepackage.listeVente;
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql