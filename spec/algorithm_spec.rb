require 'rspec'
require 'simplecov'
SimpleCov.start
require './lib/algorithm'

RSpec.describe Algorithm do
  describe '#initialize'do
    it 'exists' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm).to be_a(Algorithm)
    end
    it 'has attributes' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.date).to eq('040895')
      expect(algorithm.message).to eq("hello world")
    end
  end

  describe '#character_set' do
    it 'has a character set to choose from' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.character_set[-1]).to eq(' ')
      expect(algorithm.character_set[0]).to eq('a')
      expect(algorithm.character_set[3]).to eq('d')
    end
  end

  describe '#random_num_generator' do
    it 'generates a 5 digit random number' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.random_num_generator.to_s.length).to eq(5)
    end
  end

  describe '#a_key' do
    it 'creates the A key' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.a_key.length).to eq(2)
    end
  end

  describe '#b_key' do
    it 'creates the B key' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.b_key.length).to eq(2)
    end
  end

  describe '#c_key' do
    it 'creates the C key' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.c_key.length).to eq(2)
    end
  end

  describe '#d_key' do
    it 'creates the D key' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.d_key.length).to eq(2)
    end
  end

  describe '#date_squared' do
    it 'creates a squared numeric form of date' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.date_squared).to be_a(Integer)
    end
  end

  describe '#date_offset' do
    it 'takes last 4 digits of date squared' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.date_offset.length).to eq(4)
    end
  end

  describe '#a_offset' do
    it 'creates A offset' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.a_offset.to_s.length).to eq(1)
    end
  end

  describe '#b_offset' do
    it 'creates B offset' do
      algorithm = Algorithm.new('040895', "hello world")

      expect(algorithm.b_offset.to_s.length).to eq(1)
    end
  end
end
