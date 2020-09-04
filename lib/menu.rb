require_relative 'display'

# A wrapper that initializes, restarts and exits sessions
class Menu
  include Display

  def initialize(session = Game)
    @session = session
  end

  def welcome
    puts title
    puts welcome_msg
    puts rules_msg
    continue_prompt
    new_session
  end

  def new_session
    game = @session.new
    game.new_game
    play_again
  end

  def play_again
    print play_again_msg
    choice = gets.chomp.downcase
    case choice
    when 'y' then new_session
    when 'n' then puts exit_msg
    else          play_again
    end
  end

  def continue_prompt
    puts any_key_msg
    gets
  end
end
