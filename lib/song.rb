require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        parser = file.split(" - ")
        new_song = parser[1]
        new_artist = parser[0]
        song = Song.new(new_song)
        song.artist = Artist.new(new_artist)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

end