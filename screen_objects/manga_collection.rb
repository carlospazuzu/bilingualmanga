require_relative 'screen_object'
require_relative '../services/manga_picker'
require_relative '../utils/assets'

class MangaCollection < ScreenObject
  attr_reader :manga_volumes

  def initialize
    @manga_volumes = MangaPicker.call 
  end

  def update; end

  def render
    @manga_volumes.each { |m| m.render }
  end
end
