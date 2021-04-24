require 'rspec'
require 'simplecov'
SimpleCov.start
require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize'do
    it 'exists' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma).to be_a(Enigma)
    end
    it 'has attributes' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.date).to eq('040895')
      expect(enigma.message).to eq("hello world")
    end
  end

  describe '#character_set' do
    it 'has a character set to choose from' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.character_set[-1]).to eq(' ')
      expect(enigma.character_set[0]).to eq('a')
      expect(enigma.character_set[3]).to eq('d')
    end
  end

  describe '#random_num_generator' do
    it 'generates a 5 digit random number' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.random_num_generator.to_s.length).to eq(5)
    end
  end

  describe '#a_shift' do
    it 'creates A shift' do
      enigma = Enigma.new('040895', "hello world")
      enigma.random_num_generator

      expect(enigma.a_shift).to be_a(Integer)
    end
  end

  describe '#key' do
    it 'creates the A key' do
      enigma = Enigma.new('040895', "hello world")
      enigma.random_num_generator

      expect(enigma.a_key.length).to eq(2)
    end
  end

  describe '#b_key' do
    it 'creates the B key' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.b_key.length).to eq(2)
    end
  end

  describe '#c_key' do
    it 'creates the C key' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.c_key.length).to eq(2)
    end
  end

  describe '#d_key' do
    it 'creates the D key' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.d_key.length).to eq(2)
    end
  end

  describe '#date_squared' do
    it 'creates a squared numeric form of date' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.date_squared).to be_a(Integer)
    end
  end

  describe '#date_offset' do
    it 'takes last 4 digits of date squared' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.date_offset.length).to eq(4)
    end
  end

  describe '#a_offset' do
    it 'creates A offset' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.a_offset.to_s.length).to eq(1)
    end
  end

  describe '#b_offset' do
    it 'creates B offset' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.b_offset.to_s.length).to eq(1)
    end
  end

  describe '#c_offset' do
    it 'creates C offset' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.c_offset.to_s.length).to eq(1)
    end
  end

  describe '#d_offset' do
    it 'creates D offset' do
      enigma = Enigma.new('040895', "hello world")

      expect(enigma.d_offset.to_s.length).to eq(1)
    end
  end

  describe '#a_shift' do
    it 'creates A shift' do
      enigma = Enigma.new('040895', "hello world")
      enigma.random_num_generator

      expect(enigma.a_shift).to be_a(Integer)
    end
  end
end
