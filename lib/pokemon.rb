class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize(arguments)
    
  end
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id=?"
    poke_info = db.execute(sql, id).flatten
    new_pokemon = self.new(poke_info)
    new_pokemon.id = poke_info[0]
    new_pokemon.name = poke_info[1]
    new_pokemon.type = poke_info[2]
    new_pokemon
  end
  
end
