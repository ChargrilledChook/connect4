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

  def test_win_on_empty_board
    player = 'X'

    refute Board.new.game_won?(player)
  end

  def test_false_when_game_not_won1
    player = 'X'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 'X', 0, 0],
                  [0, 'Q', 'X', 'X', 'X', 'Q', 0]]

    refute board.game_won?(player)
  end

  def test_false_when_game_not_won2
    player = 'X'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 'X', 0, 0],
                  [0, 'Q', 'X', 'X', 'X', 0, 'X']]

    refute board.game_won?(player)
  end

  def test_hoziontal_win1
    player = 'X'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 'Q', 0, 0],
                  [0, 'X', 'X', 'X', 'X', 'Q', 0]]

    assert board.game_won?(player)
  end

  def test_hoziontal_win2
    player = '0'
    board = Board.new
    board.grid = [[0, 'Q', 'Q', 'Q', 'Q', 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 'Q', 0, 0],
                  [0, 'X', 'X', 'X', '0', 'Q', 0]]

    assert board.game_won?(player)
  end

  def test_vertical_win1
    player = 'X'
    board = Board.new
    board.grid = [[0, 0, 'Q', 'Q', 'Q', 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 'Q', 'Q', 0, 0],
                  [0, 'X', 'X', 'X', '0', 'Q', 0]]

    assert board.game_won?(player)
  end

  def test_vertical_win2
    player = 'Q'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_vertical_not_won1
    player = 'Q'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'X', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0]]

   refute board.game_won?(player)
  end

  def test_vertical_not_won2
    player = 'Q'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0]]

    refute board.game_won?(player)
  end

  def test_diag_won1
    # skip
    player = 'D'
    board = Board.new
    board.grid = [['D', 0, 0, 0, 0, 0, 0],
                  [0, 'D', 0, 0, 0, 0, 0],
                  [0, 0, 'D', 0, 0, 0, 0],
                  [0, 0, 0, 'D', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_diag_won2
    # skip
    player = 'P'
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  [0, 0, 'D', 0, 0, 'P', 0],
                  [0, 0, 0, 0, 0, 0, 'P'],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_diag_won3
    # skip
    player = 'Q'
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  ['Q', 0, 'D', 0, 0, 'P', 0],
                  [0, 'Q', 0, 0, 0, 0, 0],
                  [0, 0, 'Q', 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_diag_not_won1
    # skip
    player = 'Q'
    board = Board.new
    board.grid = [['D', 0, 0, 'P', 0, 0, 0],
                  [0, 'D', 0, 0, 'P', 0, 0],
                  ['Q', 0, 'D', 0, 0, 'P', 0],
                  [0, 'Q', 0, 0, 'F', 0, 0],
                  [0, 0, 'Q', 0, 0, 'F', 0],
                  [0, 0, 0, 0, 0, 0, 'F']]

    refute board.game_won?(player)
  end

  def test_diag_not_won2
    # skip
    player = 'D'
    board = Board.new
    board.grid = [[0, 'D', 0, 0, 0, 0, 0],
                  [0, 0, 'D', 0, 0, 0, 0],
                  [0, 0, 0, 'D', 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 'D', 0],
                  [0, 0, 0, 0, 0, 0, 'D']]

    refute board.game_won?(player)
  end

  def test_diag_won_left1
    # skip
    player = 'Q'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 'Q', 0, 0, 0],
                  [0, 0, 'Q', 0, 0, 0, 0],
                  [0, 'Q', 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_diag_won_left2
    # skip
    player = 'Z'
    board = Board.new
    board.grid = [[0, 0, 0, 0, 0, 'Z', 0],
                  [0, 0, 0, 0, 'Z', 0, 0],
                  [0, 0, 0, 'Z', 0, 0, 0],
                  [0, 0, 'Z', 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert board.game_won?(player)
  end

  def test_diag_won_left3
    # skip
    player = 'M'
    board = Board.new
    board.grid = [[0, 0, 0, 'M', 0, 'Z', 0],
                  [0, 0, 'M', 0, 'Z', 0, 0],
                  [0, 'M', 0, 'Z', 0, 0, 0],
                  ['M', 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0]]

    assert board.game_won?(player)
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

  def test_input_move_stacked1
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
    board.grid = [[0, 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0]]

    expected =    [['X', 0, 0, 0, 0, 0, 0],
                   ['X', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['X', 0, 0, 0, 0, 0, 0]]

    board.input_move(1, player)

    assert_equal expected, board.grid
  end

  def test_column_full_no_change
    player = 'X'
    board = Board.new
    board.grid = [['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0]]

    expected =    [['X', 0, 0, 0, 0, 0, 0],
                   ['X', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['Q', 0, 0, 0, 0, 0, 0],
                   ['X', 0, 0, 0, 0, 0, 0]]

    board.input_move(1, player)

    assert_equal expected, board.grid
  end

  def test_move_return_false_if_column_full
    player = 'X'
    board = Board.new
    board.grid = [['X', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['Q', 0, 0, 0, 0, 0, 0],
                  ['X', 0, 0, 0, 0, 0, 0]]

    refute board.input_move(1, player)
  end

  def test_game_is_not_tied
    board = Board.new
    board.grid = [['M', 'X', 0, 'M', 0, 'Z', 0],
                  ['Z', 'X', 'M', 0, 'Z', 0, 0],
                  ['Z', 'M', 'Z', 'Z', 0, 0, 0],
                  ['Z', 'X', 0, 0, 'Q', 0, 0],
                  ['M', 0, 0, 0, 0, 0, 'Z'],
                  ['M', 'X', 'Q', 'Q', 'Z', 'Z', 0]]

    refute board.game_tied?
  end

  def test_game_is_tied
    board = Board.new
    board.grid = [%w[M X N M N Z N],
                  %w[Z X M N Z N N],
                  %w[Z M Z Z N S S],
                  %w[Z X S S Q S S],
                  %w[M L L S L L Z],
                  %w[M X Q Q Z Z S]]

    assert board.game_tied?
  end
end
