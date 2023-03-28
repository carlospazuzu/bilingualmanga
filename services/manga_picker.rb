# frozen_string_literal: true

require_relative '../screen_objects/manga_volume'
require_relative 'service'

class MangaPicker < Service
  def call
    manga_names = Dir.entries('manga/').reject { |str| str.match?(/(\.|\.{2})/) }
    manga_volumes = []
    manga_names.each do |name|
      manga_volumes.append(MangaVolume.new(name))
    end

    manga_volumes
  end
end
