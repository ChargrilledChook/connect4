require 'minitest/autorun'
require_relative '../lib/player'
require 'stringio'

class PlayerTest < Minitest::Test

  def setup
    @board = Minitest::Mock.new

    @player = Player.new('Player', 'X')
  end

  def test_sends_correct_msg_with_valid_input
    #skip
    io = StringIO.new
    io.puts '1'
    io.rewind
    $stdin = io

    @board.expect(:input_move, true, [1, 'X'])
    @player.select_column(@board)

    @board.verify
  end

  def test_repropmts_and_sends_with_wrong_number_input
    #skip
    io = StringIO.new
    io.puts '9'
    io.puts '5'
    io.rewind
    $stdin = io

    @board.expect(:input_move, false, [9, 'X'])

    @board.expect(:input_move, true, [5, 'X'])

    @player.select_column(@board)

    @board.verify
  end

  def test_repropmts_and_sends_with_wrong_input_type
    #skip
    io = StringIO.new
    io.puts 'foo'
    io.puts '2'
    io.rewind
    $stdin = io

    @board.expect(:input_move, false, [0, 'X'])

    @board.expect(:input_move, true, [2, 'X'])

    @player.select_column(@board)

    @board.verify
  end


  def test_reprompts_if_false_with_valid_input
    #skip
    io = StringIO.new
    io.puts '1'
    io.puts '2'
    io.rewind
    $stdin = io

    @board.expect(:input_move, false, [1, 'X'])
    @board.expect(:input_move, true, [2, 'X'])
    @player.select_column(@board)

    @board.verify
  end
end
