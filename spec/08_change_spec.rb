# frozen_string_literal: true

describe 'lucky numbers with rotate! method' do
  subject(:lucky_numbers) { [3, 7, 13, 31, 42] }

  context 'when rotating the array of lucky numbers' do
    it 'will change the first value to 7' do
      expect { lucky_numbers.rotate!(1) }.to change { lucky_numbers.first }.to(7)
    end

    it 'will change the last value to 3' do
      expect { lucky_numbers.rotate!(1) }.to change { lucky_numbers.last }.to(3)
    end

    it 'will change the first value to 7 and last value to 3' do
      expect { lucky_numbers.rotate!(1) }.to change { lucky_numbers.first }.to(7) and change { lucky_numbers.last }.to(3)
    end
  end
end
