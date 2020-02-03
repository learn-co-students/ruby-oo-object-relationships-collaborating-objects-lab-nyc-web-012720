class Mp3_importer
    attr_accessor :path

    def initialize(path)
        @path = path 

    end 

    def files
        files = Dir["#{@path}/*.mp3"]
        files.map{|file| file[/(?<=mp3s\/).*/]}
    end

    def import
        p Mp3_importer.new('./spec/fixtures/mp3s').files.each{|file| 
            Song.new_by_filename(file)
        }
    end




end 