# frozen_string_literal: true

class GameState
  def initialize(game_state_manager)
    @game_state_manager = game_state_manager
  end

  def setup_state; end

  def process_input; end

  def update; end

  def render; end
end
