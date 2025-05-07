# Jeu POO - WTF Battle!

Bienvenue dans **Jeu POO**, un projet Ruby mettant en œuvre les concepts de programmation orientée objet (POO) à travers un jeu de combat interactif.

## Description

Le but du jeu est simple : être le dernier survivant ! Vous incarnez un joueur humain qui doit affronter des adversaires contrôlés par l'ordinateur. Chaque partie est une bataille stratégique où vous devez gérer vos points de vie, améliorer vos armes et attaquer vos ennemis pour les éliminer.

## Fonctionnalités

- **Système de combat** : Attaquez vos ennemis et subissez leurs contre-attaques.
- **Gestion des armes** : Cherchez des armes plus puissantes pour infliger plus de dégâts.
- **Soin** : Trouvez des packs de soin pour regagner des points de vie.
- **Adversaires dynamiques** : Les ennemis apparaissent progressivement dans certaines variantes du jeu.

## Fichiers principaux

- `app.rb` : Une version simple du jeu avec deux joueurs.
- `app_2.rb` : Une version améliorée avec un joueur humain et deux adversaires.
- `app_3.rb` : Une version avancée avec plusieurs ennemis et un système de menu.
- `app_3_bis.rb` : Une version encore plus avancée avec des ennemis qui apparaissent progressivement.
- `lib/player.rb` : Définit les classes `Player` et `HumanPlayer` pour gérer les joueurs.
- `lib/game.rb` : Gère la logique du jeu pour la version classique.
- `lib/game_bis.rb` : Gère la logique du jeu pour la version avec apparition progressive des ennemis.

## Prérequis

- Ruby version 2.5 ou supérieure.
- Les gems suivantes :
  - `dotenv`
  - `pry`
  - `rubocop`

## Installation

1. Clonez ce dépôt :
```ruby
git clone <URL_DU_DEPOT>
cd jeu_POO
```

2. Installer les dépendances:
 ```ruby
bundle install
```

## Utilisation
1. Lancez une des versions du jeu:
```ruby
ruby app.rb
```
  ou
  ```ruby
ruby app_3_bis.rb
```
2. Suivez les instructions dans le terminal pour jouer.

## Structure du projet
```
.
├── app.rb
├── app_2.rb
├── app_3.rb
├── app_3_bis.rb
├── lib/
│   ├── game.rb
│   ├── game_bis.rb
│   ├── player.rb
├── Gemfile
├── Gemfile.lock
├── .rubocop.yml
├── .gitignore
└── README.md
```

## Contribution

Les contributions sont les bienvenues ! Veuillez soumettre une pull request ou ouvrir une issue pour toute suggestion ou amélioration.

## Licence

Ce projet est sous licence MIT. Consultez le fichier [LICENSE](LICENSE) pour plus de détails.