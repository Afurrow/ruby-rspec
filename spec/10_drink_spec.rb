# frozen_string_literal: true

require_relative '../lib/10_drink'

describe Drink do
  describe '#initialize' do
    context 'when type is specified and ounces is default' do
      subject(:my_drink) { described_class.new('Mango Juice') }

      it 'is your choice of beverage' do
        expect(my_drink.type).to eq('Mango Juice')
      end

      it 'has 16 ounces' do
        expect(my_drink.ounces).to eq(16)
      end
    end
  end

  describe '#full?' do
    context 'when drink has 16 ounces or more' do
      subject(:my_drink) { described_class.new('Apple Juice') }

      it 'is full' do
        expect(my_drink.full?).to be(true)
      end
    end

    context 'when drink has less than 16 ounces' do
      subject(:my_drink) { described_class.new('Milk', 10) }

      it 'is not full' do
        expect(my_drink.full?).not_to be(true)
      end
    end
  end
end
