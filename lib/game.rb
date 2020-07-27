# Holds other objects, responsible for playing a game of connect 4
class Game
  attr_accessor :board
  attr_reader :p1, :p2

  def initialize
    @p1 = Player.new('Player 1', 'X')
    @p2 = Player.new('Player 2', 'O')
    @board = nil
  end

  # Welcome message / title
  def welcome
    puts 'Welcome to connect 4!'
    # menu can be inserted here later
    new_game
  end

  def menu
    # TODO
  end

  def new_game
    self.board = Board.new
    board.draw_grid
    _current_player = p1
    # until game_over? do
      # play_round(current_player)
      # current_player = swap_player
    # end
    # ending
  end

  def play_round(player)
    # get input
    # check / get input until it's right
    # update board data
    # redraw board

  end

  def game_over?
    # #board.won? || board.drawn?
  end

  def swap_player(player)
    player == p1 ? p2 : p1
  end
end
