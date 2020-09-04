require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/referee'
require_relative '../lib/player'

class GameTest < Minitest::Test
  def setup
    @player1 = Minitest::Mock.new
    @player2 = Minitest::Mock.new
    @board = Minitest::Mock.new
    @ref = Minitest::Mock.new
  end
  # Loops if game not over
  def test_loops_and_swaps_players_till_game_over
    @player1.expect(:symbol, 'X')
    @player2.expect(:symbol, 'O')
    @ref.expect(:game_won?, false, [@player1.symbol])
    @ref.expect(:game_tied?, false)

    @ref.expect(:game_won?, true, [@player2.symbol])

    @ref.verify
  end

  # Stops / calls game_over if game is over

  # Swaps player correctly if game not over

  # Select column gets sent
  def test_select_column_msg_gets_sent
    @player1.expect(:name, 'Player1')
    @player1.expect(:select_column, true, [@board])
    @board.expect(:draw_grid, true)
    game = Game.new(@player1, @player2, @board, @ref)

    game.play_round

    @player1.verify
  end

  # Calls the correct ending message (player who won or tie)

end
