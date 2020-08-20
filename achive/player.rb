class Player
  attr_reader :name
  attr_accessor :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def input_move
    puts "#{name}, you're up!"
    result = gets.chomp
    until (0..6).include?(result.to_i)
      puts "Enter a valid move, #{name}!"
      result = gets.chomp
    end
    result
  end
end
