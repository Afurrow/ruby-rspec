# frozen_string_literal: true

require_relative '../lib/11c_dog'
require_relative '../spec/11a_shared_example_spec'

describe Dog do
  subject(:rosie) { described_class.new('Rosie', 'Labradoodle', 'Black') }

  RSpec.shared_examples 'shared method name' do
    context 'responds to talk' do
      expect(rosie).to respond_to(:talk)
    end
  end   

  it 'is not barking' do
    expect(rosie.barking?).not_to be(true)
  end

  it 'is sleeping' do
    expect(rosie.sleeping?).to be(true)
  end
end
