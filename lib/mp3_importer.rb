require 'pry'
class MP3Importer

    attr_accessor :path, files

    def initialize (path)
        @path = path
    end

    def files
        @files = Dir.entries("./spec/fixtures/mp3s").select {|f| !File.directory? f}
    end

    def import
        @files.each do |x|
            Song.new_by_filename(x)
        end
    end
end