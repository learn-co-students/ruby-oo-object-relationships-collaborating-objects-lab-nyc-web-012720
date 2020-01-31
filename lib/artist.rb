class Artist
	@@all = []

	def initialize(name)
	self.name=(name)
	@@all << self
	end

	def name
		@name
	end

	def name=(name)
		@name = name
	end

	def self.all
		return @@all
	end

	def songs
		result = Song.all.select {|e| e.artist == self}
		return result
	end

	def add_song(song)
		song.artist=(self)
	end

	def self.find_or_create_by_name(name)
	@@all.find{|e| e.name == name} ? @@all.find{|e| e.name == name} : Artist.new(name)
	end

	def print_songs
		songs_list = self.songs
		songs_list.each {|e| puts e.name}
	end
	


end
