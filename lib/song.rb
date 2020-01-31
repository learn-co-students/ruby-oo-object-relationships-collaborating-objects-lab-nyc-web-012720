require 'pry'

class Song
	@@all = []

	def initialize(name)
		self.name=(name)
		@@all << self
	end

	def name
		return @name
	end

	def name=(name)
		@name = name
	end

	def artist
		@artist
	end

	def artist=(artist)
		@artist = artist
	end

	def self.all
		@@all
	end

	def self.new_by_filename(string)
		temp = string.split(/ - |\./)
  		artist_name = temp[0]
  		name = temp[1]
  		x = Song.new(name)
  		x.artist = Artist.find_or_create_by_name(artist_name)
  		return x
	end

	def artist_name=(artist_name)
		self.artist = Artist.find_or_create_by_name(artist_name)
	end


end