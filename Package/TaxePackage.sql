CREATE OR REPLACE PACKAGE TaxePackage IS
    FUNCTION coutVente(num_client IN NUMBER) RETURN NUMBER;
    FUNCTION taxe(cout_vente IN NUMBER) RETURN NUMBER;
END TaxePackage;
/

CREATE OR REPLACE PACKAGE BODY TaxePackage IS

    FUNCTION coutVente(num_client IN NUMBER) RETURN NUMBER IS
        vCoutVente NUMBER;
    BEGIN
        -- Vérifier si le numéro de client existe
        SELECT SUM(quantitevendu * prixvente)
        INTO vCoutVente
        FROM entrepot.jgsc_vente
        WHERE numclient = num_client;

        -- Si le numéro de client n'existe pas, renvoyer NULL
        IF vCoutVente IS NULL THEN
            RETURN NULL;
        ELSE
            RETURN vCoutVente;
        END IF;
    END coutVente;

    FUNCTION taxe(cout_vente IN NUMBER) RETURN NUMBER IS
        vTaxe NUMBER;
    BEGIN
        -- Calcul du montant de la taxe (15% du coût de vente)
        vTaxe := cout_vente * 0.15;
        RETURN vTaxe;
    END taxe;

END TaxePackage;
/