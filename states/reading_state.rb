# frozen_string_literal: true

require_relative 'game_state'

class ReadingState < GameState
  def initialize(game_state_manager)
    @game_state_manager = game_state_manager
    @pages = {}
    @current_language = 'jpn'
    @current_page = 0
    @max_pages = 2

    @pressed_left = false
    @pressed_right = false
    @pressed_up = false
    @pressed_down = false
  end

  def process_input
    @game_state_manager.window.on :key_up do |event|
      @pressed_left = true if event.key == 'left'
      @pressed_right = true if event.key == 'right'
      @pressed_down = true if event.key == 'down'
      @pressed_up = true if event.key == 'up'
    end
  end

  def update
    if @pressed_left
      change_page(-1)
      @pressed_left = false
    end

    if @pressed_right
      change_page(1)
      @pressed_right = false
    end

    if @pressed_up
      change_language('eng')
      @pressed_up = false
    end

    if @pressed_down
      change_language('jpn')
      @pressed_down = false
    end
  end

  def render
    @pages[@current_language][@current_page]
  end

  def setup_state
    @game_state_manager.window.set({ background: 'white' })

    @pages['jpn'] = []
    @pages['eng'] = []

    (1..2).each do |number|
      @pages['jpn'].append(Image.new("#{Dir.pwd}/manga/mieruko-chan/19/jpn/#{number}.jpg", x: 0, y: 0, width: Window.width, height: Window.height))
      @pages['eng'].append(Image.new("#{Dir.pwd}/manga/mieruko-chan/19/eng/#{number}.jpg", x: 0, y: 0, width: Window.width, height: Window.height))
    end

    @pages['jpn'].each(&:remove)
    @pages['eng'].each(&:remove)

    @pages['jpn'].first.add
  end

  private

  def change_page(displacement)
    @pages[@current_language][@current_page].remove

    @current_page += displacement
    @current_page = @current_page.clamp(0, @max_pages - 1)

    @pages[@current_language][@current_page].add
  end

  def change_language(new_language)
    @pages[@current_language][@current_page].remove
    @current_language = new_language
    @pages[@current_language][@current_page].add
  end
end
