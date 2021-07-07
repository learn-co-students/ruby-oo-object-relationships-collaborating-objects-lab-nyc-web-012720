require 'pry'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        if @@all.find { |artist| artist.name == name}
            return @@all.find { |artist| artist.name == name}
        else
            name = Artist.new(name)
        end
    end

    def print_songs
        self.songs.each {|song| print song.name + "\n"}
    end



end