require 'ruby2d'
require_relative 'states/game_state_manager'
require_relative 'utils/app_theme'

set title: 'Bilingual 漫画'
set background: AppTheme::MID

game_state_manager = GameStateManager.new((get :window))
game_state_manager.setup

update do
  game_state_manager.process_input
  game_state_manager.update
  game_state_manager.render
end

show
