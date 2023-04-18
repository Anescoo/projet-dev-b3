README PLS

Faille de sécu:
- Protection des données no autorisesur l'api : 
route protégé
dto
mp chiffré et fort
route de l'admin protégé

- crypto
mp chiffré et fort
- Injection : on utilise des dto
Faire le modèle de bdd

- vulnérabilité de composant: pas de composant externe(si non récup de donées)

- Identification det auth
renouvellement de mot de passe
otp(si possible)

- Monitoring
- option: récupéré les ip des clients pour évité le man in the middle

---------------------------------------------------------------

Boutique en de vêtement en ligne

Les users peuvent créer un compte  et doivent en avoir un avant de pouvoir se connecter
Info d'enregistrement:
username (string),pwd (string et fort) , email (string vérifier)
2 utilisateurs ne peuvent pas avoir exactement les même informations
Les utilisateus se connectent avec username et pwd.
( optionnel ; 3 tentative raté a la suite et il faut bloqué la connexion pendant un instant )
Les users peuvent mettre mot de passe oublier et redéfinir le mot de passe

IL y aussi des admin



Les utilisateurs achète des produits

Produits:
chaque produit a un nomProduit , productSize , productColor, 'pas de systeme de stock'

Achat:
IL n'y a pas de procédé de paiment . UNe fois la commande réalisé on dis que la commande est réalisé

Favoris ( optionnels )


table utilisateur
username 
pwd
email