# frozen_string_literal: true

describe String do
  let(:favorite_food) { String.new('tacos') } 

  it 'is equal to tacos' do
    expect(favorite_food).to eq('tacos')
  end

  context 'when favorite food is updated' do
    let(:favorite_food) { String.new('pizza') }

    it 'updates the favorite food' do
      expect(favorite_food).to eq('pizza')
    end
  end
end
