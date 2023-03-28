# frozen_string_literal: true

require_relative 'screen_object'
require_relative '../utils/constants'

class TextObject < ScreenObject
  attr_reader :text

  def initialize(text, x, y, size, color)
    params = {text:, x:, y:, size: Constants.instance.get(size), color: Constants.instance.get(color), font: Constants.instance.get(:font) }
    @text = Text.new(text,
             x:,
             y:,
             size: Constants.instance.get(size),
             color: Constants.instance.get(color),
             font: Constants.instance.get(:font))
  end
end
