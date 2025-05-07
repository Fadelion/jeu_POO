#require_relative 'player'
class Game
  attr_accessor :human_player, :players_left, :enemies_in_sight
  def initialize(name, players_left=10)
     @human_player = HumanPlayer.new(name)
     @players_left = players_left
    @enemies_in_sight = []
    #enemies_in_sight << Player.new("joueur_#{rand(1000..9999)}")
    #puts enemies_in_sight.size
  end

  # Supprime un joueur
  def kill_player(player)
    @enemies_in_sight.delete(player) if @enemies_in_sight.include?(player)
  end

  # Statut du jeu
  def is_still_going?
    @human_player.life_points > 0 && @players_left > 0
  end

  # Etat des joueurs
  def show_players
    puts "Voici l'état de chaque joueur :"
    @human_player.show_state
    @enemies_in_sight.each do |enemie|
      enemie.show_state if enemie.life_points > 0
    end
  end

  # Menu d'actions
  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "Attaquer un joueur :"
    @enemies_in_sight.each_with_index do |enemie, index|
      if enemie.life_points > 0
        puts "#{index} - #{enemie.name} a #{enemie.life_points} points de vie"
      end
    end
    print "> "
  end

  # Choix et action
  def menu_choice(action)
    valid_actions = ["a", "s"] + (0...@enemies_in_sight.size).map(&:to_s)
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
      target = @enemies_in_sight[action.to_i]
      @human_player.attacks(target)
      kill_player(target) if target.life_points <= 0
    end
  end

  # Contre-attaque des ennemies
  def enemies_attack
    @enemies_in_sight.each do |enemie|
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

  # Ajout de nouveaux joueurs en vue
  def new_players_in_sight
    if @players_left.nil?
      puts "Erreur : @players_left n'est pas défini."
      return
    end

    if @enemies_in_sight.size >= @players_left
      puts "Tous les joueurs sont déjà en vue."
      return
    end

    dice_roll = rand(1..6)
    case dice_roll
    when 1
      puts "Aucun nouvel adversaire n'arrive."
    when 2..4
      new_enemy = Player.new("joueur_#{rand(1000..9999)}")
      @enemies_in_sight << new_enemy
      puts "Un nouvel adversaire arrive : #{new_enemy.name}."
    when 5..6
      2.times do
        break if @enemies_in_sight.size >= @players_left
        new_enemy = Player.new("joueur_#{rand(1000..9999)}")
        @enemies_in_sight << new_enemy
        puts "Un nouvel adversaire arrive : #{new_enemy.name}."
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
