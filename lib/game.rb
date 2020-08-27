require_relative 'display'
require 'colorize'

# Holds other objects, responsible for playing a game of connect 4
class Game
  include Display

  attr_reader :board, :p1, :p2

  Player = Struct.new(:name, :symbol)

  def initialize
    @p1 = Player.new('Player 1'.red, 'X'.red)
    @p2 = Player.new('Player 2'.yellow, 'M'.yellow)
  end

  def welcome
    puts title
    puts welcome_msg
    new_game
  end

  def menu
    # TODO
  end

  def new_game
    @board = Board.new
    puts board.draw_grid
    play_match
  end

  def play_match
    current_player = p1
    loop do
      play_round(current_player)
      break if board.game_won?(current_player.symbol) || board.game_tied?

      current_player = swap_player(current_player)
    end
    puts game_over(current_player)
    # TODO: play_again?
  end

  def play_round(player)
    print move_prompt_msg(player.name)
    check_column(player)
    #board.input_move(select_column, player.symbol)
    render_board
  end

  def game_over(player)
    board.game_won?(player.symbol) ? win_msg(player.name) : tie_msg
  end

  def swap_player(player)
    player == p1 ? p2 : p1
  end

  # TODO
  def play_again?
    puts play_again_msg
  end

  private

  def check_column(player)
    valid = board.input_move(select_column, player.symbol)
    return if valid

    print column_full_msg
    check_column(player)
  end

  def render_board
    puts "\n\n"
    puts board.draw_grid
  end

  def select_column
    move = gets.chomp.to_i
    until (1..7).include?(move)
      print reprompt_msg
      move = gets.chomp.to_i
    end
    move
  end
end
