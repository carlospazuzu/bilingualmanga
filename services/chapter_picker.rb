# frozen_string_literal: true

require_relative '../utils/globals'
require_relative '../utils/constants'

class ChapterPicker < Service
  def call
    manga_folder = Constants.instance.get(:manga_path)
    current_manga = Globals.instance.get(:current_manga)
    files = Dir.entries("#{manga_folder}/#{current_manga.folder_name}")

    files.drop(2).reject { |e| /\.\w+$/.match?(e) }
  end
end
