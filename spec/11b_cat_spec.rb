# frozen_string_literal: true

require_relative '../lib/11b_cat'
require_relative '../spec/11a_shared_example_spec'

describe Cat do
  subject(:nox) { described_class.new('Nox', 'Bombay Cat', 'Black')}

  RSpec.shared_examples 'shared method name' do 
    context 'responds to talk' do
      expect(nox).to respond_to(:talk)
    end
  end 
  
  it 'is not hungry' do
    expect(nox.hungry?).not_to be(true)
  end

  it 'is hiding' do
    expect(nox.hiding?).to be(true)
  end
end
