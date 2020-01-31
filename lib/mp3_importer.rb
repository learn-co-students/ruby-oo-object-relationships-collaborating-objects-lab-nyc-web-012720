class MP3Importer

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		result = []
		files = Dir[@path+"/*"]
		temp = files.map{|e| e.scan(/.+\/(.+)/)}
		temp.each{|t| result << t[0][0]}
		return result
	end

	def import
		song_list = files()
		result = []
		song_list.each{|e| result << Song.new_by_filename(e)}
		return result
	end

end
