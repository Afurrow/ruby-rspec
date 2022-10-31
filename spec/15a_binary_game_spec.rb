# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

describe BinaryGame do
  describe '#initialize' do
    # Initialize -> No test necessary when only creating instance variables.
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#player_input' do

    subject(:game_input) { described_class.new(1, 10) }

    context 'when user number is between arguments' do
      before do
        allow(game_input).to receive(:gets).and_return('3')
      end     

      it 'stops loop and does not display error message' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_message = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input(min, max)
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do
      before do
        allow(game_input).to receive(:gets).and_return('a', '5')
      end      

      it 'completes loop and displays error message once' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_msg = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).to receive(:puts).with(error_msg).once
        game_input.player_input(min, max)
      end
    end

    context 'when user inputs two incorrect values, then a valid input' do
      before do
        allow(game_input).to receive(:gets).and_return('a', 'b', '5')
      end

      it 'completes loop and displays error message twice' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_msg = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).to receive(:puts).with(error_msg).twice
        game_input.player_input(min, max)
      end
    end
  end

  describe '#verify_input' do
    subject(:game_verify) { described_class.new(1, 10) }

    context 'when given a valid input as argument' do
      it 'returns valid input' do
        min = game_verify.instance_variable_get(:@minimum) 
        max = game_verify.instance_variable_get(:@maximum)
        expect(game_verify.verify_input(min, max, 5)).to eq(5)
      end
    end

    context 'when given invalid input as argument' do
      it 'returns nil' do
        min = game_verify.instance_variable_get(:@minimum)
        max = game_verify.instance_variable_get(:@maximum)
        expect(game_verify.verify_input(min, max, 15)).to be_nil
      end
    end
  end

  describe '#update_random_number' do

    context 'when updating value of random number' do
      let(:random_update) { instance_double(RandomNumber, value: 3) }
      subject(:game_update) { described_class.new(1, 100, random_update) }

      before do
        allow(game_update).to receive(:puts)
        new_number = 76
        allow(game_update).to receive(:player_input).with(1, 100).and_return(new_number)
      end

      it 'sends update_value to random_number' do
        expect(random_update).to receive(:update_value).with(76)
        game_update.update_random_number
      end
    end
  end

  describe '#maximum_guesses' do

    context 'when game minimum and maximum is 1 and 10' do
      subject(:game_ten) { described_class.new(1, 10) }

      it 'returns 4' do
        max = game_ten.maximum_guesses
        expect(max).to eq(4)
      end
    end

    context 'when game minimum and maximum is 1 and 100' do
      subject(:game_hundred) { described_class.new(1, 100) }

      it 'returns 7' do
        max = game_hundred.maximum_guesses
        expect(max).to eq(7)
      end
    end
    
    context 'when game minimum and maximum is 100 and 600' do
      subject(:game_six_hundred) { described_class.new(100, 600) }

      it 'returns 9' do
        max = game_six_hundred.maximum_guesses
        expect(max).to eq(9)
      end
    end
  end

  describe '#create_binary_search' do

    subject(:game_create) { described_class.new(1, 10, number_create) }
    let(:number_create) { instance_double(RandomNumber) }

    it 'creates a new BinarySearch with RandomNumber double' do
      expect(BinarySearch).to receive(:new).with(1, 10, number_create)
      game_create.create_binary_search
    end
  end

  describe '#display_binary_search' do

    subject(:game_display) { described_class.new(1, 10) }
    let(:search_display) { instance_double(BinarySearch) }

    context 'when game_over? is false once' do
      before do
        allow(search_display).to receive(:game_over?).and_return(false, true)
      end

      it 'calls display_turn_order one time' do
        expect(game_display).to receive(:display_turn_order).with(search_display).once
        game_display.display_binary_search(search_display)
      end
    end

    context 'when game_over? is false twice' do
      before do
        allow(search_display).to receive(:game_over?).and_return(false, false, true)
      end

      it 'calls display_turn_order two times' do
        expect(game_display).to receive(:display_turn_order).with(search_display).twice
        game_display.display_binary_search(search_display)
      end
    end

    context 'when game_over? is false five times' do
      before do 
        allow(search_display).to receive(:game_over?).and_return(false,false,false,false,false,true)
      end

      it 'calls display_turn_order five times' do
        expect(game_display).to receive(:display_turn_order).with(search_display).exactly(5).times
        game_display.display_binary_search(search_display)
      end
    end
  end

  describe '#display_turn_order' do
    subject(:binary_search) { described_class.new(1,100) }
    let(:search_display) { instance_double(BinarySearch) }

    before do
      allow(search_display).to receive(:make_guess)
      allow(binary_search).to receive(:display_guess)
      allow(search_display).to receive(:update_range)
    end

    it 'increases guess_count by one' do
      expect { binary_search.display_turn_order(search_display) }.to change { binary_search.instance_variable_get(:@guess_count) }.by(1)
    end

    it 'sends make_guess' do
      expect(search_display).to receive(:make_guess).once
      binary_search.display_turn_order(search_display)
    end

    it 'sends update_range' do
      expect(search_display).to receive(:update_range).once
      binary_search.display_turn_order(search_display)
    end
  end

  describe '#introduction' do
    # Located inside #play_game (Public Script Method)
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#display_guess' do
    # Located inside #display_binary_search (Looping Script Method)
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#print_number' do
    # Only contains puts statements -> No test necessary & can be private.
  end
end
