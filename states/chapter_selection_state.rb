# frozen_string_literal: true

require_relative 'game_state'
require_relative '../utils/assets'
require_relative '../utils/app_theme'
require_relative '../utils/constants'
require_relative '../screen_objects/manga_info'
require_relative '../screen_objects/text_object'
require_relative '../primitives/chapter_button'
require_relative '../screen_objects/chapter_list'

class ChapterSelectionState < GameState 
  def initialize(game_state_manager)
    super(game_state_manager)
    @manga_cover = nil
    @mouse_pressed_up = false
  end

  def process_input
    @game_state_manager.window.on :mouse_up do |event|
      case event.button
      when :left
        @mouse_pressed_up = true
      end
    end
  end

  def update
    if @mouse_pressed_up
      @game_state_manager.state_stack.append(@game_state_manager.current)
      @game_state_manager.change_state(:reading)
      @mouse_pressed_up = false
    end
  end

  def render
    @game_state_manager.window.set({ background: AppTheme::MID })
  end

  def setup_state
    @mouse_pressed_up = false

    @manga_cover = Assets.instance.get('MANGA_COVER', Globals.instance.get(:current_manga).folder_name)
    @manga_cover.width  = Window.width * 0.5
    @manga_cover.height = Window.height * 0.5

    MangaInfo.new

    TextObject.new('チャプター', 420, 10, :text_big, :theme_darkest)

    # ChapterButton.new(420, 80, 360, 60, '第１９章')

    ChapterList.new(Window.width * 0.5 + 20, 80, 320, 60)
  end
end
