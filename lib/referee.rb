class Referee
  attr_reader :width, :height, :win, :board

  DIAG_LINES = [[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
                [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]],
                [[0, 2], [1, 3], [2, 4], [3, 5], [4, 6]],
                [[0, 3], [1, 4], [2, 5], [3, 6]],
                [[1, 0], [2, 1], [3, 2], [4, 3], [5, 4]],
                [[2, 0], [3, 1], [4, 2], [5, 3]]].freeze

  def initialize(board)
    @win = 4
    @height = 6
    @width = 7
    @board = board
  end

  def game_won?(player)
    horizontal_win?(player) || vertical_win?(player) || diag_win_right?(player) || diag_win_left?(player)
  end

  def game_tied?
    board.grid.all? { |line| line.none?(empty_cell) }
  end

  private

  def horizontal_win?(player)
    board.grid.any? { |line| line.join.include?(player * win) }
  end

  def vertical_win?(player)
    board.grid.transpose.any? { |line| line.join.include?(player * win) }
  end

  def diag_win_right?(player)
    DIAG_LINES.map { |line| line.map { |x, y| grid[x][y] } }.any? { |line| line.join.include?(player * win) }
  end

  def diag_win_left?(player)
    DIAG_LINES.map { |line| line.map { |x, y| grid.reverse[x][y] } }.any? { |line| line.join.include?(player * win) }
  end
end
