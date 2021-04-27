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

  describe '#random_num_generator' do
    it 'generates a 5 digit random number' do
      enigma = Enigma.new

      expect(enigma.random_num_generator.length).to eq(5)
    end
  end

  describe '#keys' do
    it 'creates the A, B, C, & D keys' do
      enigma = Enigma.new

      expect(enigma.keys("02715")[0].length).to eq(2)
      expect(enigma.keys("02715")[0]).to eq("02")
      expect(enigma.keys("02715")[1].length).to eq(2)
      expect(enigma.keys("02715")[1]).to eq("27")
      expect(enigma.keys("02715")[2].length).to eq(2)
      expect(enigma.keys("02715")[2]).to eq("71")
      expect(enigma.keys("02715")[3].length).to eq(2)
      expect(enigma.keys("02715")[3]).to eq("15")
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

  describe '#offsets' do
    it 'creates A, B, C, & D offsets' do
      enigma = Enigma.new

      expect(enigma.offsets("040895")[0].to_s.length).to eq(1)
      expect(enigma.offsets("040895")[0]).to eq(1)
      expect(enigma.offsets("040895")[1].to_s.length).to eq(1)
      expect(enigma.offsets("040895")[1]).to eq(0)
      expect(enigma.offsets("040895")[2].to_s.length).to eq(1)
      expect(enigma.offsets("040895")[2]).to eq(2)
      expect(enigma.offsets("040895")[3].to_s.length).to eq(1)
      expect(enigma.offsets("040895")[3]).to eq(5)
    end
  end

  describe '#shifts' do
    it 'creates A, B, C, & D shifts' do
      enigma = Enigma.new

      expect(enigma.shifts("02715", "040895")[0]).to be_a(Integer)
      expect(enigma.shifts("02715", "040895")[0]).to eq(3)
      expect(enigma.shifts("02715", "040895")[1]).to be_a(Integer)
      expect(enigma.shifts("02715", "040895")[1]).to eq(27)
      expect(enigma.shifts("02715", "040895")[2]).to be_a(Integer)
      expect(enigma.shifts("02715", "040895")[2]).to eq(73)
      expect(enigma.shifts("02715", "040895")[3]).to be_a(Integer)
      expect(enigma.shifts("02715", "040895")[3]).to eq(20)
    end
  end

  describe '#message_encrypt' do
    it 'creates encryption for message' do
      enigma = Enigma.new

      expect(enigma.message_encrypt("hello world", "02715", "040895")).to be_a(String)
      expect(enigma.message_encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
      expect(enigma.message_encrypt("hello world!", "02715", "040895")).to eq("keder ohulw!")
      expect(enigma.message_encrypt("sidarth", "02715", "040895")).to eq("viwuut ")
    end
  end

  describe '#message_decrypt' do
    it 'creates decryption for message' do
      enigma = Enigma.new

      expect(enigma.message_decrypt("keder ohulw", "02715", "040895")).to be_a(String)
      expect(enigma.message_decrypt("keder ohulw", "02715", "040895")).to eq("hello world")
      expect(enigma.message_decrypt("keder ohulw!", "02715", "040895")).to eq("hello world!")
      expect(enigma.message_decrypt("viwuut ", "02715", "040895")).to eq("sidarth")
    end
  end

  describe '#encrypt' do
    it 'returns a hash with an encryption, key, & date' do
      enigma = Enigma.new
      expected = {encryption: "keder ohulw",
                key: "02715",
                date: "040895"}
      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  end

  describe '#decrypt' do
    it 'returns a hash with a decryption, key, & date' do
      enigma = Enigma.new
      expected = {decryption: "hello world",
                key: "02715",
                date: "040895"}
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end

  describe '#encrypt with todays date' do
    it 'returns a hash with a encryption, key, & date' do
      enigma = Enigma.new
      expected = {encryption: "skfazfqdbry",
                key: "02715",
                date: "042621"}
      expect(enigma.encrypt("hello world", "02715")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715")).to eq(expected)
    end
  end

  describe '#decrypt with todays date' do
    it 'returns a hash with a decryption, key, & date' do
      enigma = Enigma.new
      expected = {encryption: "skfazfqdbry",
                key: "02715",
                date: "042621"}
      expect(enigma.encrypt("hello world", "02715")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715")).to eq(expected)

      encrypted = enigma.encrypt("hello world", "02715")

      expected2 = {decryption: "hello world",
                key: "02715",
                date: "042621"}

      expect(enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
      expect(enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected2)
    end
  end

  describe '#encrypt with generating random key & todays date' do
    it 'returns a hash with a encryption, key, & date' do
      enigma = Enigma.new
      encrypted_hash = enigma.encrypt("hello world")
      actual = encrypted_hash[:key]

      expect(enigma.encrypt("hello world")).to be_a(Hash)
      expect(actual).to be_a(String)
      expect(actual.length).to eq(5)
    end
  end
end
