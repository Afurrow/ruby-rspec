# frozen_string_literal: true

require_relative '../lib/14_find_number'

describe FindNumber do

  describe '#make_guess' do
    subject(:number_guessing) { double('number_guessing', value: 8) }

    subject(:game_guessing) { described_class.new(0, 9, number_guessing) }

    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        expect(game_guessing.make_guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      subject(:game_guessing) { described_class.new(5, 9, number_guessing) }

      it 'returns 7' do
        expect(game_guessing.make_guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      subject(:game_guessing) { described_class.new(8, 9, number_guessing) }

      it 'returns 8' do
        expect(game_guessing.make_guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      subject(:game_guessing) { described_class.new(0, 3, number_guessing) }

      it 'returns 1' do
        expect(game_guessing.make_guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      subject(:game_guessing) { described_class.new(3, 3, number_guessing) }

      it 'returns 3' do
        expect(game_guessing.make_guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    subject(:game_over_guess) { double('game_over_guess', value: 4) }

    context 'when guess and random_number are equal' do
      subject(:game_over) { described_class.new(0, 9, game_over_guess, 4) }

      it 'is game over' do
        expect(game_over.game_over).to be(true)
      end
    end

    context 'when guess and random_number are not equal' do
      subject(:game_over) { described_class.new(0, 9, game_over_guess, 6) }

      it 'is not game over' do
        expect(game_over.game_over).not_to be(true)
      end
    end
  end

  describe '#update_range' do
    let(:number_range) { double('random_number', value: 8) }

    context 'when the guess is less than the answer' do
      subject(:low_guess_game) { described_class.new(0, 9, number_range, 4) }

      before do 
        low_guess_game.update_range()
      end 

      it 'updates min to 5' do
        expect(low_guess_game.min).to eq(5)
      end

      it 'does not update max' do
        expect(low_guess_game.max).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, number_range, 9) }
      
      before do
        high_guess_game.update_range() 
      end 

      it 'does not update min' do
        expect(high_guess_game.min).to eq(0)
      end

      it 'updates max to 8' do
        expect(high_guess_game.max).to eq(8)
      end
    end

    context 'when the guess is 7, min=5, and max=8' do
      subject(:edge_game) { described_class.new(5, 8, number_range, 7) }

      before do 
        edge_game.update_range()
      end 

      it 'updates min to the same value as max' do
        expect(edge_game.min).to eq(edge_game.max)
      end

      it 'does not update max' do
        expect(edge_game.max).to eq(8)
      end
    end
  end
end
