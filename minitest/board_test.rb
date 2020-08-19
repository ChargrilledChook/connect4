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

  def test_diag_won1
    # skip
    player = 'D'
    expected = true
    board = Board.new
    board.grid = [['D', 0, 0, 0, 0, 0, 0],
                  [0, 'D', 0, 0, 0, 0, 0],
                  [0, 0, 'D', 0, 0, 0, 0],
                  [0, 0, 0, 'D', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_won2
    # skip
    player = 'P'
    expected = true
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  [0, 0, 'D', 0, 0, 'P', 0],
                  [0, 0, 0, 0, 0, 0, 'P'],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_won3
    # skip
    player = 'Q'
    expected = true
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  ['Q', 0, 'D', 0, 0, 'P', 0],
                  [0, 'Q', 0, 0, 0, 0, 0],
                  [0, 0, 'Q', 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_not_won1
    # skip
    player = 'Q'
    expected = false
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  ['Q', 0, 'D', 0, 0, 'P', 0],
                  [0, 'Q', 0, 0, 'F', 0, 0],
                  [0, 0, 'Q', 0, 0, 'F', 0],
                  [0, 0, 0, 0, 0, 0, 'F']]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_not_won2
    # skip
    player = 'D'
    expected = false
    board = Board.new
    board.grid = [[0, 'D', 0, 0, 0, 0, 0],
                  [0, 0, 'D', 0, 0, 0, 0],
                  [0, 0, 0, 'D', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 'D', 0],
                  [0, 0, 0, 0, 0, 0, 'D']]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_won_left1
    # skip
    player = 'O'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'O', 0, 0, 0],
                  [0, 0, 'O', 0, 0, 0, 0],
                  [0, 'O', 0, 0, 0, 0, 0],
                  ['O', 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_won_left2
    # skip
    player = 'Z'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 'Z', 0],
                  [0, 0, 0, 0, 'Z', 0, 0],
                  [0, 0, 0, 'Z', 0, 0, 0],
                  [0, 0, 'Z', 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_diag_won_left3
    # skip
    player = 'M'
    expected = true
    board = Board.new
    board.grid = [[0, 0, 0, 'M', 0, 'Z', 0],
                  [0, 0, 'M', 0, 'Z', 0, 0],
                  [0, 'M', 0, 'Z', 0, 0, 0],
                  ['M', 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.game_won?(player)
  end

  def test_input_move
    player = 'X'
    board = Board.new
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0]]

    assert_equal expected, board.input_move(1, player)
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
