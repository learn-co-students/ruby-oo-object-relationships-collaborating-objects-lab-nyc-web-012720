class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files
        files = Dir["#{@path}/*.mp3"]
        files.map{|file| file[/(?<=mp3s\/).*/]}
    end

    def import
        p MP3Importer.new('./spec/fixtures/mp3s').files.each{|file| 
            Song.new_by_filename(file)
        }
    end

end