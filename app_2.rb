require 'bundler'
Bundler.require
require_relative 'lib/game'
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
main_player = HumanPlayer.new(player_name)
# Initialisation des adversaires
enemies = []
enemies << Player.new("Josiane")
enemies << Player.new("José")

# Boucle de jeu
while main_player.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
  puts "-------------------------------------------------"
  puts "Voici l'état de chaque joueur :"
  main_player.show_state
  enemies.each do |enemie|
    enemie.show_state
  end
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - cherche à se soigner"
  puts "Attaquer un joueur :"
  enemies.each_with_index do |enemie, index|
    puts "#{index} - #{enemie.name} a #{enemie.life_points} points de vie"
  end
  print "> "
  # Récupère l'action du joueur
  action = gets.chomp
  # Vérifie si l'action est valide
  while action != "a" && action != "s" && action != "0" && action != "1"
    puts "Action non reconnue, veuillez réessayer."
    print "> "
    action = gets.chomp
  end
  # Effectue l'action choisie
  case action
  when "a"
    main_player.search_weapon
  when "s"
    main_player.search_health_pack
  when "0", "1"
    main_player.attacks(enemies[action.to_i])
  else
    puts "Action non reconnue, veuillez réessayer."
  end

  # Riposte des ennemis
  enemies.each do |enemie|
    # Vérifie si le joueur principal est mort
    if main_player.life_points <= 0
      break
    end
    # Vérifie si l'ennemi est vivant avant d'attaquer le joueur principal
    if enemie.life_points > 0
      enemie.attacks(main_player)
    end
  end
  
end

# Vérifier qui a gagné
if main_player.life_points > 0
  puts "BRAVO!!!! Vous avez gagné"
else
  puts "Vous avez perdu !"
end

