# Holds data about gamestate
class Board
  attr_reader :grid_marker
  attr_accessor :grid

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
end
