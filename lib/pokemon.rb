class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(id = nil, name = "", type = "", db)
    @id = id
    @name = name
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
    # if @id != nil
    #   self.update(db)
    # else
    #   sql = <<-SQL
    #     INSERT INTO pokemon (name, type)
    #     VALUES (?, ?)
    #   SQL
 
    #   db.execute(sql, name, type)
    #   @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # end
    
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
 
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL

    result = db.execute(sql, id)[0]
    # binding.pry
    Pokemon.new(result[0], result[1], result[2], db)
  end
  
  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    type = row[2]
    db = row[3]
    self.new(id, name, type, db)
  end
  
  def self.update(db)
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
    db.execute(sql, @name, @type, @id)
  end
  
end
