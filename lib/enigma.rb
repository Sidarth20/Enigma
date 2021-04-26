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

  def message_encrypt(message)
    shift_a = Hash[character_set.zip(character_set.rotate(a_shift))]
    shift_b = Hash[character_set.zip(character_set.rotate(b_shift))]
    shift_c = Hash[character_set.zip(character_set.rotate(c_shift))]
    shift_d = Hash[character_set.zip(character_set.rotate(d_shift))]
    message.chars.map.with_index do |letter, index|
      if index % 4 == 0
        shift_a[letter]
      elsif index % 4 == 1
        shift_b[letter]
      elsif index % 4 == 2
        shift_c[letter]
      elsif index % 4 == 3
        shift_d[letter]
      end
    end.join
  end

  def message_decrypt(message)
    unshift_a = Hash[character_set.zip(character_set.rotate(-a_shift))]
    unshift_b = Hash[character_set.zip(character_set.rotate(-b_shift))]
    unshift_c = Hash[character_set.zip(character_set.rotate(-c_shift))]
    unshift_d = Hash[character_set.zip(character_set.rotate(-d_shift))]
    message.chars.map.with_index do |letter, index|
      if index % 4 == 0
        unshift_a[letter]
      elsif index % 4 == 1
        unshift_b[letter]
      elsif index % 4 == 2
        unshift_c[letter]
      elsif index % 4 == 3
        unshift_d[letter]
      end
    end.join
  end
end
