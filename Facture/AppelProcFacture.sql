ACCEPT vNumClient PROMPT "Entrez le numero de client voulu pour afficher la facture global de ces achats: "

BEGIN
    entrepot.AfficherFacture(&vNumClient);
END;
/

@C:\ProjetFinalV2\MenuPrincipal.sql
