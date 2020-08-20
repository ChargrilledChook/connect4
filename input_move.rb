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
