require_relative 'display'

# Retired in place of a struct
class Player
  include Display

  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def select_column(board)
    valid = board.input_move(input_move, symbol)
    return if valid

    print column_full_msg
    select_column(board)
  end

  private

  def input_move
    move = gets.chomp.to_i
    until (1..7).include?(move)
      print reprompt_msg
      move = gets.chomp.to_i
    end
    move
  end
end
