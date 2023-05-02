# projet-dev-b3
***Projet choisi :*** logiciel adaptive 

# context :
Nous allons créer une boutique de vêtements en ligne similaire à asos sous la forme d'une application mobile.

Utilisateurs pouront se connecter ou s'inscrire avec leurs informations personnelles. Ils pourront voir les produits et les ajouter dans leur corbeil.
Les admins pourront gérer les produits 



# Membres : 
WOLOU MANSOUR
CLAVIER ARNAUD 
# struct technique :
- basede données : postgres
- api : nestjs
- ihm : flutter app ( application mobile réaliser avec flutter )

# orga:
Les tâches et leurs rendu sont centralisé sur trello. 


# fonctionnalité:
- création d'une bdd psql avec le modèle défini sur le rapport
- système d'authentification
- définition du CRUD  sur l'api
- création de l'ihm flutter

NestJS utilise de nombreux design patterns couramment utilisés en développement logiciel, notamment :

Le pattern de conception "Facade" : Ce pattern permet de créer une interface unifiée et simplifiée pour un sous-système complexe. Dans NestJS, cela est souvent utilisé pour créer des "facade services" qui encapsulent la logique métier pour un ensemble de fonctionnalités connexes.

Le pattern de conception "Singleton" : Ce pattern garantit qu'il n'y aura qu'une seule instance d'une classe donnée dans tout le programme. Dans NestJS, cela est souvent utilisé pour gérer des ressources partagées, telles que des connexions de base de données.

Le pattern de conception "Dependency Injection" : Ce pattern permet d'injecter les dépendances requises par une classe plutôt que de les instancier directement. Dans NestJS, cela est utilisé pour créer des instances de classes qui ont besoin d'autres objets pour fonctionner, tels que des services.

Le pattern de conception "Repository" : Ce pattern fournit une abstraction pour la persistance des données, permettant de séparer la logique métier de l'implémentation de la couche de persistance. Dans NestJS, cela est souvent utilisé pour créer des classes de repository pour interagir avec les bases de données.

Le pattern de conception "Observer" : Ce pattern permet de créer des notifications entre des objets pour signaler des changements d'état. Dans NestJS, cela est utilisé pour créer des observateurs pour détecter des événements spécifiques et y répondre.

Le pattern de conception "Middleware" : Ce pattern permet d'intercepter les requêtes et les réponses HTTP pour y apporter des modifications ou des validations. Dans NestJS, cela est utilisé pour créer des middlewares pour authentifier les utilisateurs, vérifier les autorisations d'accès, etc.

En utilisant ces patterns de conception, NestJS permet de créer des applications modulaires, maintenables et évolutives, tout en améliorant la lisibilité et la réutilisabilité du code.




