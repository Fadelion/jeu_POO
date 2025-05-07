class Player
  attr_accessor :name, :life_points
  def initialize(name, life_points=10)
    @name = name
    @life_points = life_points
  end

  # Affiche le nom et les points de vie du joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  # Fait perdre des points de vie au joueur
  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "#{@name} a été tué !"
      @life_points = 0
    else
      puts "#{@name} a perdu #{damage} points de vie !"
    end
  end

  # Attaquer un autre joueur
  def attacks(player)
    puts "#{@name} attaque #{player.name} !"
    damage = compute_damage
    puts "#{@name} inflige #{damage} points de dégâts à #{player.name} !"
    player.gets_damage(damage)
  end

  # Calculer les dégâts infligés
  def compute_damage
    return rand(1..6)
  end
end

# Classe joueur humain
class HumanPlayer < Player
  attr_accessor :weapon_level
  def initialize(name)
    super(name, 100)
    @weapon_level = 1
  end

  # Affiche le nom et les points de vie du joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # Augmente le niveau de l'arme
  def increase_weapon_level
    @weapon_level += 1
    puts "#{@name} a augmenté son arme au niveau #{@weapon_level} !"
  end

  # Calculer les dégâts infligés
  def compute_damage
    return rand(1..6) * @weapon_level
  end

  # Chercher une nouvelle arme
  def search_weapon
    new_weapon_level = rand(1..6)
    puts "#{@name} a trouvé une arme de niveau #{new_weapon_level} !"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "#{@name} a changé son arme pour une arme plus puissante !"
    else
      puts "#{@name} garde son arme actuelle !"
    end
  end

    # Chercher un pack de vie
  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "#{@name} n'a rien trouvé !"
    elsif health_pack <= 5
      @life_points += 50
      puts "#{@name} a trouvé un pack de soin de 50 points de vie !"
      if @life_points > 100 # si le niveau de vie est supérieur à 100
        @life_points = 100 # on le ramène à 100
      end
    else
      @life_points += 80
      puts "#{@name} a trouvé un pack de soin de 80 points de vie !"
      if @life_points > 100
        @life_points = 100
      end
    end
  end

end

