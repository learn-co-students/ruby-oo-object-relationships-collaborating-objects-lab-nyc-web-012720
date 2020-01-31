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
        song_data = file.split(" - ")
        new_song = Song.new(song_data[1])
        new_song.artist_name = song_data[0]
        new_song
    end

    def artist_name=(name)
        this_artist = Artist.find_or_create_by_name(name)
        this_artist.add_song(self)
    end

end