/* sous-rq dans WHERE */
/* Les clients qui ont acheté des livres en VO (donc non Français)*/

\! echo "\nLes clients qui lisent Jane Austen en VO\n"
SELECT nom, prenom
FROM client 
WHERE 
client.id_client IN  
(   
    /* clients ayant commandé des livres de Jane Austenen VO */
    SELECT C.id_client 
    FROM commande C, produit_commande P
    WHERE C.id_commande = P.id_commande
    AND 
    EXISTS
    /* id des livre traduits */
    (   SELECT livre.id_livre
        FROM livre
        WHERE P.id_produit = livre.id_livre
        AND langue = 'Anglais'
        AND auteur = 'Jane Austen' 
        )

);