# frozen_string_literal: true

class Assets
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  ASSETS_DIR = "#{Dir.pwd}/assets".freeze
  MANGA_DIR = "#{Dir.pwd}/manga".freeze

  def get(asset_key, arg = nil)
    case asset_key
    when 'FILTER_ICON'
      Image.new("#{ASSETS_DIR}/icons/filter.png")
    when 'MANGA_COVER'
      Image.new("#{MANGA_DIR}/#{arg}/cover.jpg")
    end
  end
end
