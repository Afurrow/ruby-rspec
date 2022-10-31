# frozen_string_literal: true

describe 'equality assignment' do
  let(:amy) { { fav_color: 'blue', fav_food: 'tacos' } }
  let(:bob) { { fav_color: 'blue', fav_food: 'tacos' } }
  let(:copy_cat) { amy }

  it 'amy is eq to bob' do
    expect(amy).to eq(bob)
  end

  it 'amy is eql to bob' do
    expect(amy).to eql(bob)
  end

  it 'amy is not equal to bob' do
    expect(amy).not_to equal(bob)
  end

  it 'copy_cat is equal to amy' do
    expect(amy).to be(copy_cat)
  end
end
