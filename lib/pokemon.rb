require 'pry'
class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(p_name, p_type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
        db.execute(sql, p_name, p_type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        info = db.execute(sql, num)[0]
        self.new(id: info[0], name: info[1], type: info[2], db: db)
    end
end
