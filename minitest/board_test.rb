require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < Minitest::Test
  def test_win_on_empty_board
    player = 'X'
    expected = false

    assert_equal expected, Board.new.game_won?(player)
  end

  def test_false_when_game_not_won1
    player = 'X'
    expected = false
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 'X', 0, 0],
                  [0, 'O', 'X', 'X', 'X', 'O', 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_false_when_game_not_won2
    player = 'X'
    expected = false
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 'X', 0, 0],
                  [0, 'O', 'X', 'X', 'X', 0, 'X']]

    assert_equal expected, board.game_won?(player)
  end

  def test_hoziontal_win1
    player = 'X'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 'O', 0, 0],
                  [0, 'X', 'X', 'X', 'X', 'O', 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_hoziontal_win2
    player = '0'
    expected = true
    board = Board.new
    board.grid = [[0, 'O', 'O', 'O', 'O', 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 'O', 0, 0],
                  [0, 'X', 'X', 'X', '0', 'O', 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_vertical_win1
    player = 'X'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 'O', 'O', 'O', 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 'O', 'O', 0, 0],
                  [0, 'X', 'X', 'X', '0', 'O', 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_vertical_win2
    player = 'O'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_vertical_not_won1
    player = 'O'
    expected = false
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'X', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_vertical_not_won2
    player = 'O'
    expected = false
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end
end

def empty_grid
  [[0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 0, 0]]
end
