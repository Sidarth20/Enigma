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
    key = "02715"
    key[0..1]
  end

  def b_key
    key = "02715"
    key[1..2]
  end

  def c_key
    key = "02715"
    key[2..3]
  end

  def d_key
    key = "02715"
    key[3..4]
  end

  def date_squared
    "040895".to_i ** 2
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
    a_key.to_i + a_offset
  end

  def b_shift
    b_key.to_i + b_offset
  end

  def c_shift
    c_key.to_i + c_offset
  end

  def d_shift
    d_key.to_i + d_offset
  end

  def message_encrypt
    message = "hello world"
    message_split = message.split('')
    # ordinal_values = message.chars.map do |character|
    #   character.ord
    # end
    # shifted = ordinal_values.map do |character|
    #   if ordinal_values[0] || ordinal_values[4] || ordinal_values[8]
    #     character + a_shift
    #   elsif ordinal_values[1] || ordinal_values[5] || ordinal_values[9]
    #     b = character + b_shift
    #   elsif ordinal_values[2] || ordinal_values[6] || ordinal_values[10]
    #     character + c_shift
    #   elsif ordinal_values[3] || ordinal_values[7] || ordinal_values[11]
    #     character + d_shift
    #   end
    # end
    # new_shift = shifted.map do |character|
    #   character.chr
    # end.join
    enum = character_set.to_enum
    enum.with_index do |value, index|
      message_split.map do |character|
          # require 'pry'; binding.pry
      if value == character
        y = character_set.rotate(a_shift).shift
      end
    end
    end
  end
end
