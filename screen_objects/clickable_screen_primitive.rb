# frozen_string_literal: true

class ClickableScreenPrimitive
  def initialize
    @bounding_box = nil
  end

  def mouse_entered?
    @bounding_box.contains? Window.mouse_x, Window.mouse_y
  end
end

