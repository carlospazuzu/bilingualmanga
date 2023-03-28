class DrawableScreenObject < ScreenObject
  def initialize(x, y, width, height, asset_path)
    @image = Image.new(asset_path, x:, y:, width:, height:)
  end

  def render
    @image
  end
end
