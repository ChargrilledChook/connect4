# Responsible for getting user input and sending it to the game board
class Player
  include Display

  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def select_column(board)
    valid = board.input_move(gets.chomp.to_i, symbol)
    return if valid

    print reprompt_msg
    select_column(board)
  end
end
