class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
       @id = id 
       @name = name 
       @type = type 
       @db = db 
    end 

    def self.save(name,type,db)
        # if self.id
        #  self.update
        # else
        #  sql = <<-SQL
         db.execute("INSERT INTO pokemon (name, type)
         VALUES (?, ?)", name, type)
        #  SQL
        #  db.execute(sql, self.name, self.type)
        #  @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        # end
    end 

    def self.find(id, db) 
        found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;",id).flatten
        Pokemon.new(id: found_pokemon[0],name: found_pokemon[1],type: found_pokemon[2],db: db)
    end 

end
