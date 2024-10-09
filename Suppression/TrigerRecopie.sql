CREATE OR REPLACE TRIGGER jgsc_DeleteClient
BEFORE DELETE ON entrepot.jgsc_client
FOR EACH ROW
BEGIN
    -- Sauvegarde des ventes du client spécifier
    INSERT INTO entrepot.jgsc_ventesupp (codeVente, numClient, numProd, dateVente, quantiteVendu, prixVente)
    SELECT codeVente, :OLD.numClient, numProd, dateVente, quantiteVendu, prixVente
    FROM entrepot.jgsc_vente
    WHERE numClient = :OLD.numClient;

    -- Supprission des ventes du client dans la table jgsc_vente
    DELETE FROM entrepot.jgsc_vente
    WHERE numClient = :OLD.numClient;
END;
/