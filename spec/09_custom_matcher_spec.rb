# frozen_string_literal: true

describe 'one word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  let(:rotator) { 'rotator' }
  let(:palindrome) { 'palindrome' }

  matcher :be_a_palindrome do 
    match { |word| word.reverse == word }
  end 

  context 'when a palindrome is used' do

    it 'is a palindrome' do
      expect(racecar).to be_a_palindrome
    end

    it 'is a palindrome' do
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when a palindrome is not used' do
    it 'is not a palindrome' do
      expect(spaceship).not_to be_a_palindrome
    end

    it 'is not a palindrome' do
      expect(palindrome).not_to be_a_palindrome
    end
  end
end
