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
    valid = board.input_move(user_input(board), symbol)
    return if valid

    print column_full_msg
    select_column(board)
  end

  private

  def user_input(board)
    move = gets.chomp.to_i
    return move if (1..board.width).include?(move)

    print reprompt_msg
    user_input(board)
  end
end
