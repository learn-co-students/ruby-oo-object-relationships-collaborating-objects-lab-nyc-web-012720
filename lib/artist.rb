class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
   def self.all 
     @@all
    end

    def songs 
       Song.all.select do |finder|
        finder.artist == self
       end
    end

    def add_song(new_song)
       new_song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.length == 0
           self.new(name)
        else
          self.all.select do |finder|
            finder.name == name
            return finder
          end
         end
     end

     def print_songs
        self.songs.each do |finder|
            finder.artist.name == self.name
           puts finder.name
        end
      
     end
end