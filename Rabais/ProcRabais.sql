CREATE OR REPLACE PROCEDURE procRabais(vNumClient IN NUMBER, vDateVente IN DATE) IS
    vMontantTotal NUMBER;
    vTauxRabais NUMBER;
BEGIN
    -- Vérification de l'existence du client
    SELECT SUM(prixvente * quantitevendu)
    INTO vMontantTotal
    FROM entrepot.jgsc_vente
    WHERE numclient = vNumClient
    AND datevente = vDateVente;

    -- Vérification du montant pour attribution du rabais correspondant
    IF vMontantTotal <= 100 THEN
		-- Rabais de 5%
        vTauxRabais := 0.05;
    ELSIF vMontantTotal > 100 AND vMontantTotal <= 500 THEN
		-- Rabais de 10%
        vTauxRabais := 0.10; 
    ELSE
		-- Rabais de 15%
        vTauxRabais := 0.15; 
    END IF;

    -- Mise à jour du prix de vente avec le rabais
    UPDATE entrepot.jgsc_vente
    SET prixvente = prixvente * (1 - vTauxRabais)
    WHERE numclient = vNumClient
    AND datevente = vDateVente;

    -- Affichage de la facture apres changement du prix de vente
    DBMS_OUTPUT.PUT_LINE('Un rabais de ' || (vTauxRabais * 100) || '% a ete appliqué.');
    DBMS_OUTPUT.PUT_LINE('Nouvelle facture:');
	entrepot.AfficherFacture(vNumClient);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ERREUR: Le numéro de client ' || vNumClient || ' ou la date de vente ' || vDateVente || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERREUR, good Luck to find it');
END;
/