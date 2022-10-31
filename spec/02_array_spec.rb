# frozen_string_literal: true

describe Array do
  context 'when updating an implicit subject' do
    it 'is empty' do
      expect(subject.empty?).to eq(true)
    end

    it 'updates length to 1' do
      subject.append(0)
      expect(subject.length).to eq(1)
    end
  end

  context 'when using one let variable on two tests' do
    let(:lucky_numbers) { [1,2,39] }

    it 'has length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    it 'has sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
