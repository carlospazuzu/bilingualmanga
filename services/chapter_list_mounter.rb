# frozen_string_literal: true

require_relative '../primitives/chapter_button'

class ChapterListMounter < Service
  def initialize(**args)
    @x = args['x']
    @y = args['y']
    @width = args['width']
    @height = args['height']
    @chapter_number_list = args['chapters']
  end

  def call
    chapter_objects = []

    @chapter_number_list.each do |chapter_number|
      chapter_object = ChapterButton.new(@x, @y, @width, @height, chapter_number)
      chapter_objects.append(chapter_object)
      @y += @height + Constants.instance.get(:window_padding)
    end

    chapter_objects
  end
end
