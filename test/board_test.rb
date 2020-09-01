require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < Minitest::Test
  def test_initializes_correct_default
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]

    assert_equal expected, Board.new.grid
  end

  def test_input_move_bottom_row
    player = 'X'
    board = Board.new
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0]]

    board.input_move(1, player)

    assert_equal expected, board.grid
  end

  def test_successful_move_returns_true
    player = 'X'
    board = Board.new

    assert board.input_move(1, player)
  end

  def test_move_return_false_if_column_full
    player = 'X'
    board = Board.new
    board_state = [['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, board_state)

    refute board.input_move(1, player)
  end

  def test_another_input_move_stacked
    player1 = 'X'
    player2 = 'Q'
    board = Board.new
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0]]

    board.input_move(1, player1)
    board.input_move(1, player2)

    assert_equal expected, board.grid
  end

  def test_another_simple_move
    player1 = 'X'
    player2 = 'Q'
    board = Board.new
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 'X']]

    board.input_move(1, player1)
    board.input_move(1, player2)
    board.input_move(7, player1)

    assert_equal expected, board.grid
  end

  def test_input_move_stacked2
    player1 = 'X'
    player2 = 'Q'
    board = Board.new
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 'X']]

    board.input_move(1, player1)
    board.input_move(1, player2)
    board.input_move(7, player1)
    board.input_move(1, player2)

    assert_equal expected, board.grid
  end

  def test_top_row_move
    player = 'X'
    board = Board.new

    grid =  [[0, 0, 0, 0, 0, 0, 0],
             ['X', 0, 0, 0, 0, 0, 0],
             ['Q', 0, 0, 0, 0, 0, 0],
             ['Q', 0, 0, 0, 0, 0, 0],
             ['Q', 0, 0, 0, 0, 0, 0],
             ['X', 0, 0, 0, 0, 0, 0]]

    expected = [['X', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, grid)

    board.input_move(1, player)

    assert_equal expected, board.grid
  end

  def test_column_full_no_change
    player = 'X'
    board = Board.new

    expected = [['X', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)
    board.input_move(1, player)

    assert_equal expected, board.grid
  end
end
