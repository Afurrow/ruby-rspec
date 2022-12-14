# frozen_string_literal: true

require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

describe BinarySearch do
  describe '#make_guess' do
    let(:random_number) { instance_double(RandomNumber, value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      subject(:game_five) { described_class.new(5, 9, random_number) }

      it 'returns 7' do
        guess = game_five.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      subject(:game_eight) { described_class.new(8, 9, random_number) }

      it 'returns 8' do
        guess = game_eight.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      subject(:game_zero) { described_class.new(0, 3, random_number) }

      it 'returns 1' do
        guess = game_zero.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      subject(:game_three) { described_class.new(3, 3, random_number) }

      it 'returns 3' do
        guess = game_three.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    let(:ending_number) { instance_double(RandomNumber, value: 3) }
    subject(:ending_game) { described_class.new(0, 9, ending_number, 3) }

    context 'when guess and random_number are equal' do
      it 'is game over' do
        expect(ending_game).to be_game_over
      end
    end

    context 'when guess and random_number are not equal' do
      let(:mid_number) { double('random_number', value: 5) }
      subject(:mid_game) { described_class.new(0, 9, mid_number, 4) }

      it 'is not game over' do
        expect(mid_game).to_not be_game_over
      end
    end
  end

  describe '#update_range' do
    let(:range_number) { double('random_number', value: 8) }

    context 'when the guess is less than the answer' do
      subject(:low_guess_game) { described_class.new(0, 9, range_number, 4) }

      before do
        low_guess_game.update_range
      end

      it 'updates min' do
        minimum = low_guess_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = low_guess_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, range_number, 9) }

      before do
        high_guess_game.update_range
      end

      it 'does not update min' do
        minimum = high_guess_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max' do
        maximum = high_guess_game.max
        expect(maximum).to eq(8)
      end
    end

    context 'when the guess is 7, with min=5 and max=8' do
      subject(:eight_game) { described_class.new(5, 8, range_number, 7) }

      before do
        eight_game.update_range
      end

      it 'updates min to the same value as max' do
        minimum = eight_game.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = eight_game.max
        expect(maximum).to eq(8)
      end
    end
  end
end
