'require pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        filenames = Dir.chdir(@path) {| path |Dir.glob("*.mp3")}
        filenames
    end

    def import
        self.files.each {|filename|Song.new_by_filename(filename)}
    end

end