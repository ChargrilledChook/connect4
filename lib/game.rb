#require_relative 'display'

# Holds other objects, will loop a game until ref object tells it game is won or tied
class Game
  include Display

  attr_reader :board, :player1, :player2, :ref

  def initialize(player1 = Player.new('Player 1'.red, 'X'.red),
                 player2 = Player.new('Player 2'.yellow, 'M'.yellow),
                 board = Board.new,
                 ref = Referee.new(board))

    @player1 = player1
    @player2 = player2
    @board = board
    @ref = ref
    @current_player = player1
  end

  def new_game
    render_board
    play_match
    puts game_over
  end

  def play_match
    loop do
      play_round
      break if ref.game_won?(current_player.symbol) || ref.game_tied?

      self.current_player = swap_player
    end
  end

  def play_round
    print move_prompt_msg(current_player.name)
    current_player.select_column(board)
    render_board
  end

  def game_over
    ref.game_won?(current_player.symbol) ? win_msg(current_player.name) : tie_msg
  end

  def swap_player
    current_player == player1 ? player2 : player1
  end

  private

  attr_accessor :current_player

  def render_board
    puts "\n\n"
    puts board.draw_grid
  end
end
