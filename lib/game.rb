require_relative 'display'
require 'colorize'

# Holds other objects, responsible for playing a game of connect 4
class Game
  include Display

  attr_reader :board, :p1, :p2
  attr_accessor :current_player

  #Player = Struct.new(:name, :symbol)

  def initialize
    @p1 = Player.new('Player 1'.red, 'X'.red)
    @p2 = Player.new('Player 2'.yellow, 'M'.yellow)
    @current_player = p1
    @board = Board.new
  end

  def new_game
    render_board
    play_match
    puts game_over
  end

  def play_match
    loop do
      play_round
      break if board.game_won?(current_player.symbol) || board.game_tied?

      self.current_player = swap_player
    end
  end

  def play_round
    print move_prompt_msg(current_player.name)
    check_column
    render_board
  end

  def game_over
    board.game_won?(current_player.symbol) ? win_msg(current_player.name) : tie_msg
  end

  def swap_player
    current_player == p1 ? p2 : p1
  end

  private

  def check_column
    valid = board.input_move(select_column, current_player.symbol)
    return if valid

    print column_full_msg
    check_column
  end

  def select_column
    move = gets.chomp.to_i
    until (1..7).include?(move)
      print reprompt_msg
      move = gets.chomp.to_i
    end
    move
  end

  def render_board
    puts "\n\n"
    puts board.draw_grid
  end
end
