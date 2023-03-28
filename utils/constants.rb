# frozen_string_literal: true

require_relative 'measures'

class Constants
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def get(constant_key)
    case constant_key
    when :manga_path
      "#{Dir.pwd}/manga"
    when :font
      "#{Dir.pwd}/assets/fonts/MOBO.otf"
    # ==== COLORS ====
    when :theme_lightest
      AppTheme::LIGHTEST
    when :theme_light
      AppTheme::LIGHT
    when :theme_mid
      AppTheme::MID
    when :theme_dark
      AppTheme::DARK
    when :theme_darkest
      AppTheme::DARKEST
    # ==== MEASURES  ====
    when :text_big
      Measures::TEXT_BIG
    when :text_medium
      Measures::TEXT_MEDIUM
    when :text_small
      Measures::TEXT_SMALL
    when :window_padding
      8
    end
  end
end
