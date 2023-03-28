require_relative 'drawable_screen_object'

class ClickableScreenObject < DrawableScreenObject
  def initialize(x, y, width, height, asset_path)
    super(x, y, width, height, asset_path)
    @bounding_box = Rectangle.new(x:, y:, width:, height:, opacity: 0.0, color: 'black')
  end

  def mouse_entered?
    @bounding_box.contains? Window.mouse_x, Window.mouse_y
  end
end
