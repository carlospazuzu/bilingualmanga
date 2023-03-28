require 'yaml'

class Manga
  attr_reader :title, :author, :release_year, :genre, :folder_name

  def initialize(manga)
    metadata = YAML.load_file("#{Dir.pwd}/manga/#{manga}/data.yml")
    @title = {}
    @title['jpn'] = metadata['title']['jpn']
    @title['eng'] = metadata['title']['eng']
    @author = {}
    @author['jpn'] = metadata['author']['jpn']
    @author['eng'] = metadata['author']['eng']
    @release_year = metadata['release_year']
    @genre = metadata['genre']
    @folder_name = manga
  end
end
