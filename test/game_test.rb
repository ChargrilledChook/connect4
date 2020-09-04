require 'minitest/autorun'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/referee'
require_relative '../lib/player'

# This is probably slightly undertested but I was unsure how to approach it given the Game
# class is mostly a middleman for the other objects. Testing it kind of ends up being
# integration testing anyway.
class GameTest < Minitest::Test
  def setup
    @player1 = Minitest::Mock.new
    @player2 = Minitest::Mock.new
    @board = Minitest::Mock.new
    @ref = Minitest::Mock.new
  end

  # Select column gets sent
  def test_select_column_msg_gets_sent
    @player1.expect(:name, 'Player1')
    @player1.expect(:select_column, true, [@board])
    @board.expect(:draw_grid, true)
    game = Game.new(@player1, @player2, @board, @ref)

    game.play_round

    @player1.verify
  end

  # Things that should be tested? :
  # Calls the correct ending message (player who won or tie)
  # Stops / calls game_over if game is over
  # Loops if game not over
end
