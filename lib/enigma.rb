class Enigma
  def character_set
    array = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_num_generator, date = Date.today.strftime('%m%d%y'))
    keys(key)
    shifts(key, date)
    date_squared(date)
    hash = {encryption: message_encrypt(message, key, date),
            key: key,
            date: date}
  end

  def decrypt(message, key, date = Date.today.strftime('%m%d%y'))
    keys(key)
    shifts(key, date)
    date_squared(date)
    hash = {decryption: message_decrypt(message, key, date),
            key: key,
            date: date}
  end

  def random_num_generator
    5.times.map {rand(0..4)}.join
  end

  def keys(key)
    a_key = key[0..1]
    b_key = key[1..2]
    c_key = key[2..3]
    d_key = key[3..4]
    array = [a_key, b_key, c_key, d_key]
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def date_offset(date)
    date_squared(date).to_s[-4..-1]
  end

  def offsets(date)
    a_offset = date_offset(date)[0].to_i
    b_offset = date_offset(date)[1].to_i
    c_offset = date_offset(date)[2].to_i
    d_offset = date_offset(date)[3].to_i
    array = [a_offset, b_offset, c_offset, d_offset]
  end

  def shifts(key, date)
    a_shift = keys(key)[0].to_i + offsets(date)[0]
    b_shift = keys(key)[1].to_i + offsets(date)[1]
    c_shift = keys(key)[2].to_i + offsets(date)[2]
    d_shift = keys(key)[3].to_i + offsets(date)[3]
    array = [a_shift, b_shift, c_shift, d_shift]
  end

  def message_encrypt(message, key, date)
    shift_a = Hash[character_set.zip(character_set.rotate(shifts(key, date)[0]))]
    shift_b = Hash[character_set.zip(character_set.rotate(shifts(key, date)[1]))]
    shift_c = Hash[character_set.zip(character_set.rotate(shifts(key, date)[2]))]
    shift_d = Hash[character_set.zip(character_set.rotate(shifts(key, date)[3]))]
    message.chars.map.with_index do |letter, index|
      if (33..64).include?(letter.ord)
        letter
      elsif index % 4 == 0
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

  def message_decrypt(message, key, date)
    unshift_a = Hash[character_set.zip(character_set.rotate(-shifts(key, date)[0]))]
    unshift_b = Hash[character_set.zip(character_set.rotate(-shifts(key, date)[1]))]
    unshift_c = Hash[character_set.zip(character_set.rotate(-shifts(key, date)[2]))]
    unshift_d = Hash[character_set.zip(character_set.rotate(-shifts(key, date)[3]))]
    message.chars.map.with_index do |letter, index|
      if (33..64).include?(letter.ord)
        letter
      elsif index % 4 == 0
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
