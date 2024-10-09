SET serveuroutput ON

create or replace PROCEDURE AfficherFacture(vNumClient IN INT) IS

    vNomClient entrepot.jgsc_client.nomclient%TYPE;
    vNumRue entrepot.jgsc_client.numRue%TYPE;
    vNomRue entrepot.jgsc_client.nomRue%TYPE;
    vVille entrepot.jgsc_client.ville%TYPE;
    vCodePostal entrepot.jgsc_client.codePostal%TYPE;
    vTotal NUMBER;
    vTaxe NUMBER;
    
BEGIN
    SELECT nomclient, numRue, nomRue, ville, codePostal
    INTO vNomClient,  vNumRue, vNomRue, vVille, vCodePostal
    FROM entrepot.jgsc_client
    WHERE numclient = vNumClient;

    -- Vérifier si le numéro de client existe
    IF vNumClient IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Numero Client: '||vNumClient);
        DBMS_OUTPUT.PUT_LINE('Nom: '||vNomClient);
        DBMS_OUTPUT.PUT_LINE('Adresse: '||vNumRue||' rue '||vNomRue
								||', '||vVille||'; '||vCodePostal);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Num produit | Prix vendus | Quantite vendue | Sous-total');
        
        -- Parcourir les ventes du client pour remplir la facture
        FOR vente IN (
			SELECT numprod, prixvente, quantitevendu
            FROM entrepot.jgsc_vente
            WHERE numclient = vNumClient)
		LOOP
            -- Affichage des détails de la vente
            DBMS_OUTPUT.PUT_LINE(
                RPAD(vente.numprod, 11)|| ' | ' ||
                RPAD(vente.prixvente||'$', 11)|| ' | ' ||
                RPAD(vente.quantitevendu, 15)|| ' | ' ||
                RPAD((vente.prixvente * vente.quantitevendu)||'$', 12)
            );
        END LOOP;

        -- Calcul du total via la fonction coutVente
		vTotal := entrepot.taxePackage.coutVente(vNumClient);
        -- Calcul de la taxe via la fonction taxe
        vTaxe := entrepot.taxePackage.TAXE(vTotal);

        -- Affichage du total
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE(LPAD('Total: ', 46) || RPAD(vTotal || '$', 8));
        DBMS_OUTPUT.PUT_LINE(LPAD('Taxes (15%): ', 46) || RPAD(vTaxe || '$', 8));
        DBMS_OUTPUT.PUT_LINE('                                             -----------');
        DBMS_OUTPUT.PUT_LINE(LPAD('Grand Total: ', 46) || RPAD((vTotal + vTaxe) || '$', 8));
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('ERREUR: Le numéro de client ' || vNumClient || ' n''existe pas.');
END;