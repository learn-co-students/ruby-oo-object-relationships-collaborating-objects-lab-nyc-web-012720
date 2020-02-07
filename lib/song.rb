class Song
    attr_accessor :name, :artist, :artist_name

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end
    
        def self.all
            @@all
        end
    
    def self.new_by_filename(file_name)
        song_title = file_name.split(" - ")[1]
        song = self.new(song_title)
        song.artist = Artist.new(file_name.split(" - ")[0])
        song
    end
    
    def artist_name=(name)
     self.artist = Artist.find_or_create_by_name(name)
    end
end