require_relative 'display'

class Menu
  include Display

  def initialize
    welcome
  end

  def welcome
    puts title
    puts welcome_msg
    puts rules_msg
    continue_prompt
    Game.new.new_game
  end

  def continue_prompt
    puts any_key_msg
    gets
  end
end
