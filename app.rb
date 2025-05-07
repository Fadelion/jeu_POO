require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

#  Initialisation des joueurs
puts "-------------------------------------------------"
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "Que le combat commence !"
# Blouclage du jeu
while player1.life_points > 0 && player2.life_points > 0
  puts "-------------------------------------------------"
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  player1.attacks(player2) # Joueur 1 attaque Joueur 2
  # Vérifie si le Joueur 2 est mort (s'arrête si c'est le cas)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1) # Joueur 2 attaque Joueur 1
end

#binding.pry