# frozen_string_literal: true

require_relative 'screen_object'
require_relative '../services/chapter_list_mounter'
require_relative '../services/chapter_picker'

class ChapterList < ScreenObject
  def initialize(x, y, width, height)
    @chapter_list_objects = ChapterListMounter.call('x' => x, # Window.width * 0.5 + 40,
                                                    'y' => y, # 80,
                                                    'width' => width, # 360,
                                                    'height' => height, # 60,
                                                    'chapters' => ChapterPicker.call)
  end

  def update; end

  def render; end
end
