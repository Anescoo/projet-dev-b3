<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.


## Installation

### Docker
Il faut lancer la base de donnée pour que le backend se lance localement.
Dans le répertoire courant faire:
***Allumer docker**
```
# lance les container en arrière plan
docker composer up --build -d
```

pour arrèter les containers:
```
#supprime et arrête les containers 
docker compose down
```

```bash
$ npm install
```

## Running the app
Maintenant que la base de donnée est fonctionnelle on peut lancer l'application sans avoir d'erreur

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## License

Nest is [MIT licensed](LICENSE).

**utilisation des uuid**
Prévisibilité : les identifiants générés séquentiellement peuvent être facilement devinés ou prédits, ce qui peut entraîner des risques de sécurité si ces identifiants sont utilisés pour identifier des données sensibles. Un attaquant peut essayer de deviner les identifiants pour accéder à des informations confidentielles ou tenter d'injecter des données malveillantes.

Conflits de clés : si deux enregistrements sont ajoutés simultanément à une table avec des clés primaires générées de manière séquentielle, il est possible que les identifiants se chevauchent et entraînent un conflit de clés. Cela peut entraîner des erreurs lors de la récupération des données et de la mise à jour des enregistrements.

Performances : lorsque les identifiants sont générés de manière séquentielle, les requêtes de base de données peuvent devenir plus lentes à mesure que la taille de la table augmente, car les index sur les clés primaires doivent être régulièrement mis à jour. Les identifiants UUID, en revanche, sont générés de manière aléatoire, ce qui peut réduire le temps nécessaire pour insérer et indexer les données.

Fiabilité : si une application est conçue pour supprimer des enregistrements obsolètes en utilisant une date de création ou une autre propriété, l'utilisation d'identifiants séquentiels peut rendre cela difficile si les enregistrements ne sont pas insérés dans l'ordre chronologique. Cela peut entraîner une suppression incorrecte ou incomplète de données.

### SOLIDE ET DESIGN PATTERN
les principes SOLIDE et certains design patterns sont déja appliqué
NestJS utilise de nombreux design patterns couramment utilisés en développement logiciel, notamment :

Le pattern de conception "Facade" : Ce pattern permet de créer une interface unifiée et simplifiée pour un sous-système complexe. Dans NestJS, cela est souvent utilisé pour créer des "facade services" qui encapsulent la logique métier pour un ensemble de fonctionnalités connexes.

Le pattern de conception "Singleton" : Ce pattern garantit qu'il n'y aura qu'une seule instance d'une classe donnée dans tout le programme. Dans NestJS, cela est souvent utilisé pour gérer des ressources partagées, telles que des connexions de base de données.

Le pattern de conception "Dependency Injection" : Ce pattern permet d'injecter les dépendances requises par une classe plutôt que de les instancier directement. Dans NestJS, cela est utilisé pour créer des instances de classes qui ont besoin d'autres objets pour fonctionner, tels que des services.

Le pattern de conception "Repository" : Ce pattern fournit une abstraction pour la persistance des données, permettant de séparer la logique métier de l'implémentation de la couche de persistance. Dans NestJS, cela est souvent utilisé pour créer des classes de repository pour interagir avec les bases de données.

Le pattern de conception "Observer" : Ce pattern permet de créer des notifications entre des objets pour signaler des changements d'état. Dans NestJS, cela est utilisé pour créer des observateurs pour détecter des événements spécifiques et y répondre.

Le pattern de conception "Middleware" : Ce pattern permet d'intercepter les requêtes et les réponses HTTP pour y apporter des modifications ou des validations. Dans NestJS, cela est utilisé pour créer des middlewares pour authentifier les utilisateurs, vérifier les autorisations d'accès, etc.

En utilisant ces patterns de conception, NestJS permet de créer des applications modulaires, maintenables et évolutives, tout en améliorant la lisibilité et la réutilisabilité du code.