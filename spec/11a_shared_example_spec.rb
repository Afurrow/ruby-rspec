# frozen_string_literal: true

RSpec.shared_examples 'base class method name' do
  context 'when method is from the base class' do
    it 'responds to meal_time' do
      expect(subject).to respond_to(:meal_time)
    end
  end
end

RSpec.shared_examples 'shared method name' do
  context 'when method name is the same in multiple classes' do
    it 'responds to talk' do
      expect(subject).to respond_to(:talk)
    end
  end
end
