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

La raison pour laquelle il y a deux tables distinctes, "orders" et "order_items", est qu'une commande peut contenir plusieurs produits différents. En d'autres termes, une commande est une entité composée de plusieurs éléments. La table "orders" stocke les informations générales de chaque commande, telles que l'ID de l'utilisateur qui a passé la commande, le statut de la commande et la date de création. La table "order_items", quant à elle, stocke les informations spécifiques à chaque élément de la commande, telles que l'ID de la commande à laquelle l'élément appartient, l'ID du produit commandé, la quantité commandée et le prix unitaire de chaque produit. En reliant les deux tables via la clé étrangère "order_id", il est possible de relier chaque élément de la commande à la commande globale. Cette structure de base de données permet une organisation et une gestion plus efficace des commandes, ainsi que la possibilité de générer des rapports détaillés sur les ventes et les produits les plus populaires.