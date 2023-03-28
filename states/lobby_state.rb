require_relative 'game_state'
require_relative '../screen_objects/manga_collection'
require_relative '../utils/globals'

class LobbyState < GameState
  def initialize(game_state_manager)
    super(game_state_manager)
    @manga_collection = MangaCollection.new
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
      check_collision
      @mouse_pressed_up = false
    end
  end

  def render
    @manga_collection.render
  end

  private

  def check_collision
    @manga_collection.manga_volumes.each do |manga_volume|
      if manga_volume.mouse_entered?
        Globals.instance.set(:current_manga, manga_volume.manga)
        @game_state_manager.state_stack.append(@game_state_manager.current)
        @game_state_manager.change_state(:chapter_selection)
      end
    end
  end
end
