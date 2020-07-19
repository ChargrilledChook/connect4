class Game
  attr_accessor :board
  attr_reader :p1, :p2

  def initialize
    @p1 = Player.new('Player 1', 'X')
    @p1 = Player.new('Player 2', 'O')
    @board = Board.new
  end

end
