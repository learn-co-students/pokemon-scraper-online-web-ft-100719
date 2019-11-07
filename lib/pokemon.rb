require 'pry'

class Pokemon

   attr_accessor :name, :type, :db, :id
   

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db

    end


    def self.save(name, type, db)

        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)" 
        db.execute(sql, name, type)
    
    end

    def self.find(id, db)

        sql = "SELECT * FROM pokemon WHERE id = ?"
        
        pokemon = db.execute(sql, id)[0]
        pokemon1 = self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    end


end
