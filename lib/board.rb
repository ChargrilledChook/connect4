# Holds data about gamestate
class Board
  attr_reader :grid_marker
  attr_accessor :grid

  DIAG_LINES = [[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
                [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]],
                [[0, 2], [1, 3], [2, 4], [3, 5], [4, 6]],
                [[0, 3], [1, 4], [2, 5], [3, 6]],
                [[1, 0], [2, 1], [3, 2], [4, 3], [5, 4]],
                [[2, 0], [3, 1], [4, 2], [5, 3]]].freeze

  def initialize
    @grid = build_grid
    @grid_marker = Array(1..7)
  end

  def build_grid
    Array.new(6) { Array.new(7, 0) }
  end

  def draw_grid
    grid.each_index { |line| p grid[line] }
    p grid_marker
  end

  def game_won?(player)
    horizontal_win?(player) || vertical_win?(player)
  end

  private

  def horizontal_win?(player)
    @grid.any? { |line| line.join.include?(player * 4) }
  end

  def vertical_win?(player)
    @grid.transpose.any? { |line| line.join.include?(player * 4) }
  end
end
