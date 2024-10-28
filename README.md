# IBANScan Demo


- ✨Welcome ✨

Ce projet est une application de démo pour BforBank permettant d’ajouter un bénéficiaire en scannant un IBAN français. Il a été réalisé en SwiftUI avec une architecture MVVM-C (Model-View-ViewModel-Coordinator) pour un découplage clair des responsabilités et une meilleure testabilité. 

## Choix techniques 

## Architecture : MVVM-C 

- MVVM-C (Model-View-ViewModel-Coordinator) a été choisi pour gérer la séparation des responsabilités, en particulier pour le contrôle de la navigation et la logique de traitement. 

- L’architecture permet de garder la vue libre de toute logique métier, qui est déléguée aux ViewModels, et de centraliser la navigation dans des Coordinators. 

## SwiftUI et Combine 

- SwiftUI a été utilisé pour la création des interfaces, conformément aux exigences du test technique. Cette approche permet de créer une interface déclarative et réactive. 

- Combine a été employé pour la gestion des états et des flux de données, facilitant la communication entre les ViewModels et la vue.

## Scanne de l’IBAN et utilisation de la caméra 

- Le scan d’IBAN est implémenté via l’API de caméra, qui détecte les textes en temps réel pour extraire les IBAN. La détection se fait dans une zone cadrée pour aider l’utilisateur à viser correctement. 

- Un Bottom Sheet s’affiche après la détection de l’IBAN pour permettre à l’utilisateur de valider ou de recommencer le scan.

## Améliorations possibles 
Si davantage de temps était disponible, les améliorations suivantes pourraient être envisagées : 

- Validation d’IBAN plus robuste : Implémenter une vérification de validité de l’IBAN selon les normes françaises et européennes pour éviter toute entrée incorrecte.

- Amélioration de l’UI/UX : 
  Ajouter des animations et des transitions plus fluides entre les écrans pour une meilleure expérience utilisateur. 
  Optimiser le design pour différents types d’écrans, notamment pour iPad ou autres formats d’iPhone.
  
- Gestion des permissions : 
  Ajouter une gestion plus détaillée des permissions pour la caméra, en redirigeant l’utilisateur vers les réglages en cas de refus d’accès.

- Tests unitaires et d’intégration : 
Ajouter des tests unitaires pour les ViewModels et des tests d’intégration pour valider le bon fonctionnement de l’application. 
Mettre en place des tests UI pour s’assurer de la robustesse de l’interface et de la navigation entre les écrans. 

- Prise en charge des IBAN internationaux : 
Bien que la gestion des IBAN français soit suffisante pour le test, l’ajout de la gestion des IBAN internationaux pourrait être une évolution intéressante.

## Prérequis 

- iOS 15 minimum : Le projet est configuré pour être compatible avec iOS 15 et plus. 
- Xcode 13+ : La dernière version de Xcode est recommandée pour compiler le projet.



> Pour une expérience utilisateur complète, le projet complet se trouve sur la branche develop



**Thank you for your time :)**

Aladdin.
