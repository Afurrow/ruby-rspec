# frozen_string_literal: true

require_relative '../lib/16a_caesar_breaker'
require_relative '../lib/16b_caesar_translator'

describe CaesarBreaker do

  subject(:phrase) { described_class.new('Lipps, Asvph!', translator) }
  let(:translator) { instance_double(CaesarTranslator) }

  describe '#decrypt' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#create_decrypted_messages' do
    it 'sends translate 26 times' do
      expect(translator).to receive(:translate).exactly(26).times
      phrase.create_decrypted_messages
    end
  end

  describe '#save_decrypted_messages' do
    context 'when the directory does not exist' do
      before do
        allow(Dir).to receive(:exist?).and_return(false)
        allow(Dir).to receive(:mkdir)
        allow(File).to receive(:open)
        allow(phrase).to receive(:display_file_location)
      end

      it 'sends message to check the existance of the 16_cipher directory' do
        expect(Dir).to receive(:exist?).with('16_cipher').once
        phrase.save_decrypted_messages
      end

      it 'sends message to create a directory' do
        expect(Dir).to receive(:mkdir).once
        phrase.save_decrypted_messages
      end

      it 'sends message to create a file' do
        expect(File).to receive(:open).once
        phrase.save_decrypted_messages
      end
    end

    context 'when the directory exists' do
      before do
        allow(Dir).to receive(:exist?).and_return(true)
        allow(File).to receive(:open)
      end

      it 'sends message to check the existance of the 16_cipher directory' do
        expect(Dir).to receive(:exist?).with('16_cipher').once
        phrase.save_decrypted_messages
      end

      it 'does not send message to create a directory' do
        expect(Dir).not_to receive(:mkdir)
        phrase.save_decrypted_messages
      end

      it 'sends message to create a file' do
        expect(File).to receive(:open).once 
        phrase.save_decrypted_messages
      end
    end

    context 'when file is saved successfully' do
      before do
        allow(Dir).to receive(:exist?).and_return(false)
        allow(Dir).to receive(:mkdir)
        allow(File).to receive(:open)
        allow(phrase).to receive(:display_file_location)
      end

      it 'does not raise an error' do
        expect { phrase.save_decrypted_messages }.not_to raise_error
      end
    end

    context 'when rescuing an error' do
      before do
        allow(Dir).to receive(:exist?).and_return(false)
        allow(Dir).to receive(:mkdir)
        allow(File).to receive(:open).and_raise(Errno::ENOENT)
        allow(phrase).to receive(:puts).twice
      end

      it 'does not display file location' do
        expect(phrase).not_to receive(:display_file_location)
        phrase.save_decrypted_messages
      end

      it 'outputs two error messages' do
        expect(phrase).to receive(:puts).with('Error while writing to file LippsAsvph.yaml.')
        expect(phrase).to receive(:puts).with(Errno::ENOENT)
        phrase.save_decrypted_messages
      end
    end
  end

  describe '#save_to_yaml' do

    it 'dumps to yaml' do
      expect(YAML).to receive(:dump)
      phrase.save_to_yaml
    end
  end
end
