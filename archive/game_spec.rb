require './lib/game'

describe Game do
  describe '#swap_player' do
    it 'swaps p1 correctly' do
      game = Game.new
      expect(game.swap_player(game.p1)).to eq(game.p2)
    end

    it 'swaps p2 correctly' do
      game = Game.new
      expect(game.swap_player(game.p2)).to eq(game.p1)
    end
  end
end
