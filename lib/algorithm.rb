class Algorithm
  attr_reader :date, :message

  def initialize(date, message)
    @date = date
    @message = message.downcase
  end

  def character_set
    array = ("a".."z").to_a << " "
  end

  def random_num_generator
    number = 5.times.map {rand(0..4)}.join
  end

  def a_key
    a = random_num_generator[0..1]
  end

  def b_key
    a = random_num_generator[1..2]
  end
end
