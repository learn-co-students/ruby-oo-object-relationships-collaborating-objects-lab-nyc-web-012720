class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name 
        @artist = artist 

        @@all << self 
    end 


    def self.all
        @@all 
    end 

    def self.new_by_filename(file)
        song_info = file.split(" - ")
        new_song = Song.new(song_info[1])
        new_song.artist_name = song_info[0]
        new_song

    end 


    def artist_name=(name)
        selected_artist = Artist.find_or_create_by_name(name)
        selected_artist.add_song(self)
    end 




end 