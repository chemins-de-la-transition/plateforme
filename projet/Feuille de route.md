---
Projet : Chemins de la Transition
Equipe : Feuille de route
Contributeur : Pierre Bouvier-Muller
Crédit : CC-BY
Version : 1
---

Ce document a pour vocation à partager la feuille de route du développement de la plateforme des [Chemins de la Transition](http://lescheminsdelatransition.org/).

## Périmètre
La plateforme des Chemins de la Transition a pour vocation à rendre visible des lieux en transition et leurs activités, à faciliter le cheminement des apprenants, leur mise en lien avec des expériences en transition existantantes et à créer des parcours de découverte, d'apprentissage et de formation sur des thématiques spécifiques (découverte, régionale/géographique, métier, etc...).

Nous adoptons une stratégie de développement dite agile, avec une feuille de route itérative dont la création se fait par le développement de versions successives.

## Fonctionnalités
La caractéristique principale (qui est aussi une des principales contraintes) est que cette plateforme est fondée sur des technologies intéropérables. C'est à dire qu'on aura la possibilité d'héberger plusieurs instances de la plateforme (une par région par exemple) et que celles-ci pourront dialoguer les unes avec les autres.
Cette caractéristique permet à chaque région d'exprimer sa singularité (charte graphique, valeur) et donc de mettre en valeur son activité, sans pour autant travailler en vase clos dans un environnement fermé.

### Version 1: Rendre visible
Cette première version, c'est la base, les fonctionnalités sans lesquelles on ne pourrait pas développer les suivantes.
Grâce à cette version :
- En tant qu'accueillant, je peux rendre visible mon lieu sur la carte et y renseigner les informations qui le décrivent, concernent mon accueil, les activités et événements (découverte, apprentissages, formations) que je propose et leur modalités.
- En tant que membre des cdlt je peux créer un profil.

( à débattre) En tant que chemineur, je peux renseigner des lieux. Ceux-ci ne m'appartiennent pas, mais je peux les cartographier pour participer. => Pas clair, cela dit on comprend : Les chemineurs peuvent contribuer à la documentation des lieux ... A mon avis, ca suppose des mécanismes de contribution de type pull request, ce qui serait topissime. 


Cette version est assez similaire à ce que propose TWIZA, sauf que ce ne sont pas des lieux de chantiers participatifs qui sont référencés mais des lieux formations. Elle mélange des fonctionnalités de wiki et de gogocarto.
Il y 3 profils types :
- Curieux
- Chemineurs (carto)
- Accueillant

### Version 2: Agenda
Dans cette seconde version, on ajoute la fonctionnalité Agenda, qui permet aux accueillants de renseigner leurs formations / événements dans une base de données spécifiques (et pas dans des champs textes comme le propose la première version). 
La partie agenda est déjà proposée dans la V1 dans un champs libre. Elle est sémantisée dans la V2 ce qui permet d'effectuer des recherches.

-- Si la feuille de route des 2 premières versions est fixées, le développement des futures fonctionnalités est soumis à l'agilité et au retour que nous ferons les utilisateurs --


### Version 3: Réservation
Dans cette troisième version, les chemineurs ont la possibilité de réserver directement leur formation et donc de se faire un calendrier en ligne. MR: + possibilité de payer en ligne le cas échéant // Est-ce que cela intègre du coup des "modules de discussion / échange" entre accueillant et chemineur? + validation de réservation...
Ce qui pose les briques  de la version suivante : la création de parcours de formation

### Version 4: Parcours de formation
Dans cette nouvelle version, il est possible de créer des parcours thématiques (ou géographique en mode découverte par exemple).

### Version 5: A définir
Ajouter des fonctionnalités sociales, recueil de feedback, notes, messagerie, etc... à conceptualiser en fonction des retours. Gamifier la plateforme ;)
- Créer un outil de blog dédié
- Créer un wiki qui permette de capitaliser sur les savoirs acquis (où compléter celui de movilab)
- créer des outils de communication
