require 'minitest/autorun'
require_relative '../lib/referee'
require_relative '../lib/board'

class RefereeTest < Minitest::Test
  def test_win_on_empty_board
    player = 'X'
    board = Board.new
    ref = Referee.new(board)
    refute ref.game_won?(player)
  end

  def test_false_when_game_not_won1
    # skip
    player = 'X'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 'X', 0, 0],
                [0, 'Q', 'X', 'X', 'X', 'Q', 0]]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_false_when_game_not_won2
    # skip
    player = 'X'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 'X', 0, 0],
                [0, 'Q', 'X', 'X', 'X', 0, 'X']]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_hoziontal_win1
    # skip
    player = 'X'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 'Q', 0, 0],
                [0, 'X', 'X', 'X', 'X', 'Q', 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_hoziontal_win2
    # skip
    player = '0'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 'Q', 'Q', 'Q', 'Q', 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 'Q', 0, 0],
                [0, 'X', 'X', 'X', '0', 'Q', 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_vertical_win1
    # skip
    player = 'X'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 'Q', 'Q', 'Q', 0, 0],
                ['X', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 0, 0, 0, 0],
                ['X', 0, 0, 'Q', 'Q', 0, 0],
                [0, 'X', 'X', 'X', '0', 'Q', 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_vertical_win2
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_vertical_not_won1
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'X', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_vertical_not_won2
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_diag_won1
    # skip
    player = 'D'
    board = Board.new
    ref = Referee.new(board)
    expected = [['D', 0, 0, 0, 0, 0, 0],
                [0, 'D', 0, 0, 0, 0, 0],
                [0, 0, 'D', 0, 0, 0, 0],
                [0, 0, 0, 'D', 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_diag_won2
    # skip
    player = 'P'
    board = Board.new
    ref = Referee.new(board)
    expected = [['D', 0, 0, 'P', 0, 0, 0],
                [0, 'D', 0, 0, 'P', 0, 0],
                [0, 0, 'D', 0, 0, 'P', 0],
                [0, 0, 0, 0, 0, 0, 'P'],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_diag_won3
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [['D', 0, 0, 'P', 0, 0, 0],
                [0, 'D', 0, 0, 'P', 0, 0],
                ['Q', 0, 'D', 0, 0, 'P', 0],
                [0, 'Q', 0, 0, 0, 0, 0],
                [0, 0, 'Q', 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_diag_not_won1
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [['D', 0, 0, 'P', 0, 0, 0],
                [0, 'D', 0, 0, 'P', 0, 0],
                ['Q', 0, 'D', 0, 0, 'P', 0],
                [0, 'Q', 0, 0, 'F', 0, 0],
                [0, 0, 'Q', 0, 0, 'F', 0],
                [0, 0, 0, 0, 0, 0, 'F']]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_diag_not_won2
    # skip
    player = 'D'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 'D', 0, 0, 0, 0, 0],
                [0, 0, 'D', 0, 0, 0, 0],
                [0, 0, 0, 'D', 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 'D', 0],
                [0, 0, 0, 0, 0, 0, 'D']]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_won?(player)
  end

  def test_diag_won_left1
    # skip
    player = 'Q'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 'Q', 0, 0, 0],
                [0, 0, 'Q', 0, 0, 0, 0],
                [0, 'Q', 0, 0, 0, 0, 0],
                ['Q', 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_diag_won_left2
    # skip
    player = 'Z'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 0, 0, 'Z', 0],
                [0, 0, 0, 0, 'Z', 0, 0],
                [0, 0, 0, 'Z', 0, 0, 0],
                [0, 0, 'Z', 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_diag_won_left3
    # skip
    player = 'M'
    board = Board.new
    ref = Referee.new(board)
    expected = [[0, 0, 0, 'M', 0, 'Z', 0],
                [0, 0, 'M', 0, 'Z', 0, 0],
                [0, 'M', 0, 'Z', 0, 0, 0],
                ['M', 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_won?(player)
  end

  def test_game_is_not_tied
    # skip
    board = Board.new
    ref = Referee.new(board)
    expected = [['M', 'X', 0, 'M', 0, 'Z', 0],
                ['Z', 'X', 'M', 0, 'Z', 0, 0],
                ['Z', 'M', 'Z', 'Z', 0, 0, 0],
                ['Z', 'X', 0, 0, 'Q', 0, 0],
                ['M', 0, 0, 0, 0, 0, 'Z'],
                ['M', 'X', 'Q', 'Q', 'Z', 'Z', 0]]

    board.instance_variable_set(:@grid, expected)

    refute ref.game_tied?
  end

  def test_game_is_tied
    # skip
    board = Board.new
    ref = Referee.new(board)
    expected = [%w[M X N M N Z N],
                %w[Z X M N Z N N],
                %w[Z M Z Z N S S],
                %w[Z X S S Q S S],
                %w[M L L S L L Z],
                %w[M X Q Q Z Z S]]

    board.instance_variable_set(:@grid, expected)

    assert ref.game_tied?
  end
end
