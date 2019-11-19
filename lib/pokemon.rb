class Pokemon
  
  attr_accessor :name, :type, :db, :id

  def initialize(args)
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @id = args[:id]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon
      (name, type)
      VALUES
      (?,?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL
    pokemon = db.execute(sql, id).first
    self.new({
      id: pokemon[0],
      name: pokemon[1],
      type: pokemon[2]
    })
  end

end
