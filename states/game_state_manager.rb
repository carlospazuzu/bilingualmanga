require_relative 'lobby_state'
require_relative 'chapter_selection_state'
require_relative 'reading_state'

class GameStateManager
  attr_reader :window, :state_stack, :current

  def initialize(window)
    @states = {}
    @current = :lobby
    @window = window
    @state_stack = []
    @key_escape_pressed = false
  end

  def setup
    add_state(LobbyState.new(self), :lobby)
    add_state(ChapterSelectionState.new(self), :chapter_selection)
    add_state(ReadingState.new(self), :reading)
    @window.set({ width: 702 }) # 804
    @window.set({ height: 1008 }) # 1086
  end

  def change_state(new_state)
    @window.clear
    @states[new_state].setup_state
    @current = new_state
  end

  def add_state(state, key)
    @states[key] = state
  end

  def process_input
    @window.on :key_up do |event|
      @key_escape_pressed = true if event.key == 'escape'
    end

    @states[@current].process_input
  end

  def update
    @states[@current].update

    if @key_escape_pressed
      return @window.close if @state_stack.empty?

      change_state(@state_stack.pop)
      @key_escape_pressed = false
    end
  end

  def render
    @states[@current].render
  end
end
