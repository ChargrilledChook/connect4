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
    new_game
    play_again
  end

  def new_game
    Game.new.new_game
  end

  def play_again
    print play_again_msg
    choice = gets.chomp.downcase
    case choice
    when 'y'
      new_game
      play_again
    when 'n' then puts exit_msg
    else play_again
    end
  end

  def continue_prompt
    puts any_key_msg
    gets
  end
end
