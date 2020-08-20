require './lib/board'

describe Board do
  describe '#grid' do
    it 'returns the correct default values' do
      expect(Board.new.grid).to eq [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0],
                                    [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]

    end
  end

  describe '#draw_grid' do
    xit 'draws the correct grid to console' do
      expect(Board.new.draw_grid).to output(%(
        [0, 0, 0, 0, 0, 0, 0]
        [0, 0, 0, 0, 0, 0, 0]
        [0, 0, 0, 0, 0, 0, 0]
        [0, 0, 0, 0, 0, 0, 0]
        [0, 0, 0, 0, 0, 0, 0]
        [0, 0, 0, 0, 0, 0, 0]
        [1, 2, 3, 4, 5, 6, 7]
      )
      ).to_stdout
    end
  end
end
