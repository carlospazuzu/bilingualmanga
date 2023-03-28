# frozen_string_literal: true

require_relative '../entities/manga'
require_relative 'clickable_screen_object'
require_relative '../utils/constants'

class MangaVolume < ClickableScreenObject
  attr_reader :manga

  def initialize(manga)
    super(8, 28, 244, 330, "#{Constants.instance.get(:manga_path)}/#{manga}/cover.jpg")
    @manga = Manga.new(manga)
  end

  def update; end

  def render
    super
  end
end
