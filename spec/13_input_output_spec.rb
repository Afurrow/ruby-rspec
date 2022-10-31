# frozen_string_literal: true

require_relative '../lib/13_input_output'

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    context 'when solution is initialized' do
      it 'is a number greater than or equal to 0' do
        solution = game.solution
        expect(solution).to be >= 0
      end

      it 'is a number less than or equal to 9' do
        solution = game.solution
        expect(solution).to be <= 9
      end

      matcher :be_between_zero_and_nine do 
        match { |num| num.between?(0,9) }
      end

      it 'is a number between 0 and 9' do
        solution = game.solution
        expect(solution).to be_between_zero_and_nine
      end
    end
  end

  describe '#game_over?' do
    context 'when user guess is correct' do

      subject(:game_end) { described_class.new(5, '5') }

      it 'is game over' do
        expect(game_end).to be_game_over
      end
    end

    context 'when user guess is not correct' do      
      subject(:game_on) { described_class.new(4, '6') }
      it 'is not game over' do
        expect(game_on.game_over?).not_to eq(true)
      end
    end
  end

  describe '#verify_input' do
    subject(:game_check) { described_class.new }

    context 'when given a valid input as argument' do
      it 'returns valid input' do
        user_input = '3'
        verified_input = game_check.verify_input(user_input)
        expect(verified_input).to eq('3')
      end
    end

    context 'when given invalid input as argument' do
      it 'returns nil' do
        user_input = 'Two'
        verified_input = game_check.verify_input(user_input)
        expect(verified_input).to be(nil)
      end
    end
  end

  describe '#player_turn' do

    subject(:game_loop) { described_class.new }

    context 'when user input is valid' do

      it 'stops loop and does not display error message' do
        valid_input = '3'
        allow(game_loop).to receive(:player_input).and_return(valid_input)
        expect(game_loop).not_to receive(:puts).with('Input error!')
        game_loop.player_turn
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do

      before do
        letter = 'd'
        valid_input = '8'
        allow(game_loop).to receive(:player_input).and_return(letter, valid_input)
      end

      it 'completes loop and displays error message once' do
        expect(game_loop).to receive(:puts).with('Input error!').once
        game_loop.player_turn
      end
    end

    context 'when user inputs two incorrect values, then a valid input' do
      before do
        character = 'r'
        symbol = '%'
        valid_input = '5'
        allow(game_loop).to receive(:player_input).and_return(character, symbol, valid_input)
      end

      it 'completes loop and displays error message twice' do
        expect(game_loop).to receive(:puts).with('Input error!').twice 
        game_loop.player_turn
      end
    end
  end

  describe '#final_message' do
    context 'when count is 1' do
      subject(:game_one) { described_class.new(5, '5', 1) }

      it 'outputs correct phrase' do
        lucky_phrase = "LUCKY GUESS!\n"
        expect { game_one.final_message }.to output(lucky_phrase).to_stdout
      end
    end    

    context 'when count is 2-3' do
      subject(:game) { described_class.new(8, 8, 3) }

      it 'outputs correct phrase' do
        congrats_phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { game.final_message }.to output(congrats_phrase).to_stdout
      end
    end

    context 'when count is 4 and over' do
      subject(:game) { described_class.new(8,8,6) }

      it 'outputs correct phrase' do
        congrats_phrase = "That was hard. It took you 6 guesses!\n"
        expect { game.final_message }.to output(congrats_phrase).to_stdout
      end
    end
  end
end
