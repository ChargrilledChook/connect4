# Holds data about gamestate
class Board
  attr_reader :empty_cell, :width, :height, :grid

  def initialize
    @height = 6
    @width = 7
    @empty_cell = 0
    @grid = build_grid
  end

  def build_grid
    Array.new(height) { Array.new(width, empty_cell) }
  end

  def draw_grid
    render = grid.map { |line| line.map { |cell| " #{cell} " }.join }
    render << (1..width).map { |cell| " #{cell} " }.join
    render
  end

  # Updates the grid with a drop down move. Will return true if succesful and false otherwise
  def input_move(column, player)
    placed = false
    return false unless (1..width).include?(column)

    grid.reverse_each do |row|
      if row[column - 1] == empty_cell && placed == false
        row[column - 1] = player
        placed = true
      end
    end
    placed
  end

  private

  attr_writer :grid
end
