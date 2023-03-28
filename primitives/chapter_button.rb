# frozen_string_literal: true

require_relative '../screen_objects/clickable_screen_primitive'
require_relative '../screen_objects/text_object'

class ChapterButton < ClickableScreenPrimitive
  def initialize(x, y, width, height, text)
    @bounding_box = Rectangle.new(x:, y:, width:, height:, color: AppTheme::DARK)
    TextObject.new(text, @bounding_box.x + 8, @bounding_box.y + 12, :text_medium, :theme_lightest)
  end
end
