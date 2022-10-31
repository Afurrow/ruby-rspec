# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

describe MagicSeven do
  subject(:game) { described_class.new }

  describe '#add_nine' do
    it 'returns 15' do
      expect(game.add_nine(6)).to eq(15)
    end

    it 'returns 15' do
      random_number = 6
      result = game.add_nine(random_number)
      expect(result).to eq(15)
    end
  end

  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8
        result = game.multiply_by_two(previous_step)
        expect(result).to eq(16)
      end
    end
  end

  describe '#subtract_four' do
    context 'when the previous step is 36' do
      it 'returns 32' do 
        previous_step = 36
        result = game.subtract_four(previous_step) 
        expect(result).to eq(32)
      end  
    end 
  end

  describe '#divide_by_two' do
    context 'when the previous step is 32' do 
      it 'returns 16' do
        previous_step = 32
        result = game.divide_by_two(previous_step)
        expect(result).to eq(16) 
      end 
    end 
  end

  describe '#subtract_random_number' do
    subject(:game) { described_class.new(9) }
    context 'when previous step was 16' do
      it 'returns 7' do
        previous_step = 16
        result = game.subtract_random_number(previous_step)
        expect(result).to eq(7)
      end  
    end 
  end

  describe '#play' do
    context 'when the random number is 20' do
      subject(:game) { described_class.new(20) }
      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end

    context 'when the random number is 255' do
      subject(:game) { described_class.new(255) }
      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end

    context 'when the random number is -50' do
      it 'will return 7' do
        expect(game.play).to eq(7)
      end
    end
  end
end
