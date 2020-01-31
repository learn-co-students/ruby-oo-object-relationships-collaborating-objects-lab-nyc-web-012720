require "pry"
class MP3Importer

    attr_accessor :path


    def initialize (path)
        @path = path
    end

    def files 
        all_files_wo_paths = []
        filenames_only = []
        Dir["#{self.path}/*.mp3"].each do |file|
        files_wo_paths = file.split("\/")
        all_files_wo_paths += files_wo_paths
        end
        filenames_only = all_files_wo_paths.delete_if {|path_part| !path_part.include? " - "}
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end