class Pokemon
  attr_accessor :name, :type, :id, :db
  #attr_reader :id

  def initialize(name:, type:, id: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save (name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find (id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL
    this_pokemon = db.execute(sql, id)
    found_pokemon = self.new(id:this_pokemon[0][0], 
                            name:this_pokemon[0][1], 
                            type:this_pokemon[0][2], 
                            db:db)
  end
end
