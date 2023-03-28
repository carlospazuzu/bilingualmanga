# frozen_string_literal: true

require_relative 'screen_object'
require_relative '../utils/constants'
require_relative '../utils/app_theme'
require_relative '../utils/globals'

class MangaInfo < ScreenObject
  def initialize
    Rectangle.new(x: 0,
                  y: Window.height * 0.5 + Constants.instance.get(:window_padding),
                  color: AppTheme::DARK,
                  width: Window.width * 0.5,
                  height: Window.height * 0.25)

    title = TextObject.new(Globals.instance.get(:current_manga).title['jpn'],
                           Constants.instance.get(:window_padding),
                           Window.height * 0.5 + Constants.instance.get(:window_padding) * 2,
                           :text_medium,
                           :theme_lightest)

    author = TextObject.new(Globals.instance.get(:current_manga).author['jpn'],
                            Constants.instance.get(:window_padding),
                            title.text.y + 30 + Constants.instance.get(:window_padding),
                            :text_medium,
                            :theme_lightest)

    release_year = TextObject.new(Globals.instance.get(:current_manga).release_year.to_s,
                                  Constants.instance.get(:window_padding),
                                  author.text.y + 60 + Constants.instance.get(:window_padding),
                                  :text_medium,
                                  :theme_lightest)

    TextObject.new(Globals.instance.get(:current_manga).genre,
                   Constants.instance.get(:window_padding),
                   release_year.text.y + 30 + Constants.instance.get(:window_padding),
                   :text_medium,
                   :theme_lightest)
  end
end
