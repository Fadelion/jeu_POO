require 'bundler'
Bundler.require
require_relative 'lib/game_bis'
require_relative 'lib/player'

# Accueil
puts "-------------------------------------------------"
puts "|Bienvenue dans 'WTF battle !'" + "                  |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Initialisation du joueur
puts "Quel est votre prénom ?"
print "> "
player_name = gets.chomp
puts "Bonjour #{player_name}"
# Initialisation du jeu
my_game = Game.new(player_name)

# Boucle de jeu
while my_game.is_still_going?
  puts "-------------------------------------------------"
  # Etat des joueurs
  my_game.show_players
  # Menu
  puts "-------------------------------------------------"
  my_game.new_players_in_sight
  my_game.menu
  # Récupère l'action du joueur
  action = gets.chomp

  # Choix et action
  my_game.menu_choice(action)

  # Attaque ennemies
  puts "-------------------------------------------------"
  my_game.enemies_attack
end

# Fin de jeu
my_game.game_ending

