require_relative 'display'

# A wrapper than initializes, restarts and exits games
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
    new_game
  end

  def new_game
    Game.new.new_game
    play_again
  end

  def play_again
    print play_again_msg
    choice = gets.chomp.downcase
    case choice
    when 'y' then new_game
    when 'n' then puts exit_msg
    else          play_again
    end
  end

  def continue_prompt
    puts any_key_msg
    gets
  end
end
