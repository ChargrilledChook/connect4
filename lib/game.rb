require_relative 'display'

# Holds other objects, responsible for playing a game of connect 4
class Game
  include Display

  attr_reader :board, :p1, :p2

  Player = Struct.new(:name, :symbol)

  def initialize
    @p1 = Player.new('Player 1', 'X')
    @p2 = Player.new('Player 2', 'O')
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
    board.draw_grid
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
  end

  def play_round(player)
    puts move_prompt(player.name)
    move = gets.chomp.to_i until (1..7).include?(move)
    board.input_move(move, player.symbol)
    board.draw_grid
  end

  def game_over(player)
    board.game_won?(player.symbol) ? win_msg(player.name) : tie_msg
  end

  def swap_player(player)
    player == p1 ? p2 : p1
  end
end
