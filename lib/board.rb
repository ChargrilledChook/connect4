# Holds data about gamestate
class Board
  attr_accessor :grid

  # These are mapped to arrays in order to calculate winning combos on diagonals.
  # The advantage of this is a relatively simple win checking method,
  # the downside is that these need to be changed for different sized boards.
  DIAG_LINES = [[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
                [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]],
                [[0, 2], [1, 3], [2, 4], [3, 5], [4, 6]],
                [[0, 3], [1, 4], [2, 5], [3, 6]],
                [[1, 0], [2, 1], [3, 2], [4, 3], [5, 4]],
                [[2, 0], [3, 1], [4, 2], [5, 3]]].freeze

  # Default values for the playing grid
  EMPTY_CELL = 0
  WIDTH = 7
  HEIGHT = 6

  # Amount of tokens in a row required to win
  WIN = 4

  def initialize
    @win = 4
    @height = 6
    @width = 7
    @empty_cell = 0
    @grid = build_grid
  end

  def build_grid
    Array.new(HEIGHT) { Array.new(WIDTH, EMPTY_CELL) }
  end

  def draw_grid
    render = grid.map { |line| line.map { |cell| " #{cell} " }.join }
    render << (1..WIDTH).map { |cell| " #{cell} " }.join
    render
  end

  def game_won?(player)
    horizontal_win?(player) || vertical_win?(player) || diag_win_right?(player) || diag_win_left?(player)
  end

  def game_tied?
    @grid.all? { |line| line.none?(EMPTY_CELL) }
  end

  # Updates the grid with a drop down move. Will return true if succesful and false otherwise
  def input_move(column, player)
    placed = false
    grid.reverse_each do |x|
      if x[column - 1] == EMPTY_CELL && placed == false
        x[column - 1] = player
        placed = true
      end
    end
    placed
  end

  private

  def horizontal_win?(player)
    @grid.any? { |line| line.join.include?(player * WIN) }
  end

  def vertical_win?(player)
    @grid.transpose.any? { |line| line.join.include?(player * WIN) }
  end

  def diag_win_right?(player)
    DIAG_LINES.map { |line| line.map { |x, y| grid[x][y] } }.any? { |line| line.join.include?(player * WIN) }
  end

  def diag_win_left?(player)
    DIAG_LINES.map { |line| line.map { |x, y| grid.reverse[x][y] } }.any? { |line| line.join.include?(player * WIN) }
  end
end
