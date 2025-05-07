#require_relative 'player'
class Game
  attr_accessor :human_player, :enemies
  def initialize(name)
     @human_player = HumanPlayer.new(name)
    @enemies = (1..4).map { |i| Player.new("Adversaire #{i}") }
  end

  # Supprime un joueur
  def kill_player(player)
    @enemies.delete(player) if @enemies.include?(player)
  end

  # Statut du jeu
  def is_still_going?
    @human_player.life_points > 0 && @enemies.any? { |enemie| enemie.life_points > 0 }
  end

  # Etat des joueurs
  def show_players
    puts "Voici l'état de chaque joueur :"
    @human_player.show_state
    @enemies.each do |enemie|
      enemie.show_state if enemie.life_points > 0
    end
  end

  # Menu d'actions
  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "Attaquer un joueur :"
    @enemies.each_with_index do |enemie, index|
      if enemie.life_points > 0
        puts "#{index} - #{enemie.name} a #{enemie.life_points} points de vie"
      end
    end
    print "> "
  end

  # Choix et action
  def menu_choice(action)
    valid_actions = ["a", "s"] + (0...@enemies.size).map(&:to_s)
    until valid_actions.include?(action)
      puts "Action non reconnue, veuillez réessayer."
      print "> "
      action = gets.chomp
    end

    case action
    when "a"
      @human_player.search_weapon
    when "s"
      @human_player.search_health_pack
    when *valid_actions[2..]
      target = @enemies[action.to_i]
      @human_player.attacks(target)
      kill_player(target) if target.life_points <= 0
    end
  end

  # Contre-attaque des ennemies
  def enemies_attack
    @enemies.each do |enemie|
      # Vérifie si le joueur principal est mort
      if @human_player.life_points <= 0
        break
      end
      # Vérifie si l'ennemi est vivant avant d'attaquer le joueur principal
      if enemie.life_points > 0
        enemie.attacks(@human_player)
      end
    end
  end

  # Fin du jeu
  def game_ending
    if @human_player.life_points > 0
      puts "BRAVO!!!! Vous avez gagné"
      puts "Points de vie à la fin : #{@human_player.life_points}."
    else
      puts "Vous avez perdu !"
    end
  end
end
