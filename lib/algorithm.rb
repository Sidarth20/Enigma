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
    5.times.map {rand(0..4)}.join
  end

  def a_key
    random_num_generator[0..1]
  end

  def b_key
    random_num_generator[1..2]
  end

  def c_key
    random_num_generator[2..3]
  end

  def d_key
    random_num_generator[3..4]
  end

  def date_squared
    @date.to_i ** 2
  end

  def date_offset
    date_squared.to_s[-4..-1].to_i
  end
end
