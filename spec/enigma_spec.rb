require 'rspec'
require 'simplecov'
SimpleCov.start
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize'do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_a(Enigma)
    end
  end

  describe '#character_set' do
    it 'has a character set to choose from' do
      enigma = Enigma.new

      expect(enigma.character_set[-1]).to eq(' ')
      expect(enigma.character_set[0]).to eq('a')
      expect(enigma.character_set[3]).to eq('d')
    end
  end

  # describe '#random_num_generator' do
  #   it 'generates a 5 digit random number' do
  #     enigma = Enigma.new
  #
  #     expect(enigma.random_num_generator.to_s.length).to eq(5)
  #   end
  # end
  #

  describe '#a_key' do
    it 'creates the A key' do
      enigma = Enigma.new

      expect(enigma.a_key("02715").length).to eq(2)
    end
  end

  describe '#b_key' do
    it 'creates the B key' do
      enigma = Enigma.new

      expect(enigma.b_key("02715").length).to eq(2)
    end
  end

  describe '#c_key' do
    it 'creates the C key' do
      enigma = Enigma.new

      expect(enigma.c_key("02715").length).to eq(2)
    end
  end

  describe '#d_key' do
    it 'creates the D key' do
      enigma = Enigma.new

      expect(enigma.d_key("02715").length).to eq(2)
    end
  end

  describe '#date_squared' do
    it 'creates a squared numeric form of date' do
      enigma = Enigma.new

      expect(enigma.date_squared("040895")).to be_a(Integer)
    end
  end

  describe '#date_offset' do
    it 'takes last 4 digits of date squared' do
      enigma = Enigma.new

      expect(enigma.date_offset("040895").length).to eq(4)
    end
  end

  describe '#a_offset' do
    it 'creates A offset' do
      enigma = Enigma.new

      expect(enigma.a_offset("040895").to_s.length).to eq(1)
    end
  end

  describe '#b_offset' do
    it 'creates B offset' do
      enigma = Enigma.new

      expect(enigma.b_offset("040895").to_s.length).to eq(1)
    end
  end

  describe '#c_offset' do
    it 'creates C offset' do
      enigma = Enigma.new

      expect(enigma.c_offset("040895").to_s.length).to eq(1)
    end
  end

  describe '#d_offset' do
    it 'creates D offset' do
      enigma = Enigma.new

      expect(enigma.d_offset("040895").to_s.length).to eq(1)
    end
  end

  describe '#a_shift' do
    it 'creates A shift' do
      enigma = Enigma.new

      expect(enigma.a_shift("02715", "040895")).to be_a(Integer)
    end
  end

  describe '#b_shift' do
    it 'creates B shift' do
      enigma = Enigma.new

      expect(enigma.b_shift("02715", "040895")).to be_a(Integer)
    end
  end

  describe '#c_shift' do
    it 'creates C shift' do
      enigma = Enigma.new

      expect(enigma.c_shift("02715", "040895")).to be_a(Integer)
    end
  end

  describe '#d_shift' do
    it 'creates D shift' do
      enigma = Enigma.new

      expect(enigma.d_shift("02715", "040895")).to be_a(Integer)
    end
  end

  describe '#message_encrypt' do
    it 'creates encryption for message' do
      enigma = Enigma.new

      expect(enigma.message_encrypt("hello world", "02715", "040895")).to be_a(String)
      expect(enigma.message_encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
      expect(enigma.message_encrypt("sidarth", "02715", "040895")).to eq("viwuut ")
    end
  end

  describe '#message_decrypt' do
    it 'creates decryption for message' do
      enigma = Enigma.new

      expect(enigma.message_decrypt("keder ohulw", "02715", "040895")).to be_a(String)
      expect(enigma.message_decrypt("keder ohulw", "02715", "040895")).to eq("hello world")
      expect(enigma.message_decrypt("viwuut ", "02715", "040895")).to eq("sidarth")
    end
  end

  describe '#encrypt' do
    it 'returns a hash with an encryption, key, & date' do
      enigma = Enigma.new
      expected = {message: "keder ohulw",
                key: "02715",
                date: "040895"}
      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  end

  describe '#decrypt' do
    it 'returns a hash with a decryption, key, & date' do
      enigma = Enigma.new
      expected = {message: "hello world",
                key: "02715",
                date: "040895"}
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end
end
