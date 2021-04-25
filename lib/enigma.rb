class Enigma

  def character_set
    array = ("a".."z").to_a << " "
  end

  # def encrypt(message, key, date)
  #
  # end
  #
  # def random_num_generator
  #   5.times.map {rand(0..4)}.join
  # end

  def a_key
    message = "hello world"
    message[0..1]
  end

  def b_key
    message = "hello world"
    message[1..2]
  end

  def c_key
    message = "hello world"
    message[2..3]
  end

  def d_key
    message = "hello world"
    message[3..4]
  end

  def date_squared
    @date.to_i ** 2
  end

  def date_offset
    date_squared.to_s[-4..-1]
  end

  def a_offset
    date_offset[0].to_i
  end

  def b_offset
    date_offset[1].to_i
  end

  def c_offset
    date_offset[2].to_i
  end

  def d_offset
    date_offset[3].to_i
  end

  def a_shift
    a = a_key.to_i + a_offset
  end
end
