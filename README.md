# RedirectionApp - Apprentissage de l'URL Scheme en Swift

RedirectionApp est une application Swift qui démontre l'utilisation de l'URL Scheme pour rediriger vers d'autres applications sur iOS. Cette version est conçue pour être exécutée dans un terminal.

## Fonctionnalités

- Affiche une liste d'applications avec des options pour les ouvrir ou les installer, en fonction de leur disponibilité sur le dispositif.
- Déclenche une notification instantanée.

## Prérequis

- macOS 10.15+
- Swift 5.0+

## Utilisation

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous que vous avez Swift installé sur votre système.
3. Ouvrez un terminal et accédez au répertoire du projet.
4. Compilez le projet en utilisant la commande suivante :
```bash
   swift build -c release
```
5.Exécutez l'application en utilisant la commande suivante :
```bash
  .build/release/RedirectionApp
```

## Structure du Projet

##### Sources/main.swift: Contient le code principal de l'application, y compris la configuration de l'interface en ligne de commande.
##### Sources/Models/Application.swift: Définit le modèle d'application avec le nom, l'image et l'URL de redirection.
##### Assets/: Contient les images des applications.
##### Package.swift: Fichier de configuration pour Swift Package Manager.

## Comment ça marche

1. L'application utilise la fonction FileManager.default.fileExists(atPath:) pour vérifier si une application est installée sur le dispositif.
2. Si une application est installée, une option "Ouvrir" est affichée, sinon une option "Installer" est affichée.
3. Lorsque l'utilisateur sélectionne une option, l'application correspondante est ouverte ou l'utilisateur est invité à installer l'application.
La notification instantanée est déclenchée en utilisant la bibliothèque UserNotifications.
