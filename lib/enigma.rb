class Enigma

  def character_set
    array = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_num_generator, date = Date.today.strftime('%m%d%y'))
    a_key(key)
    b_key(key)
    c_key(key)
    d_key(key)
    a_shift(key, date)
    b_shift(key, date)
    c_shift(key, date)
    d_shift(key, date)
    date_squared(date)
    hash = {encryption: message_encrypt(message, key, date),
            key: key,
            date: date}
  end

  def decrypt(message, key, date = Date.today.strftime('%m%d%y'))
    a_key(key)
    b_key(key)
    c_key(key)
    d_key(key)
    a_shift(key, date)
    b_shift(key, date)
    c_shift(key, date)
    d_shift(key, date)
    date_squared(date)
    hash = {decryption: message_decrypt(message, key, date),
            key: key,
            date: date}
  end

  def random_num_generator
    5.times.map {rand(0..4)}.join
  end

  def a_key(key)
    key[0..1]
  end

  def b_key(key)
    key[1..2]
  end

  def c_key(key)
    key[2..3]
  end

  def d_key(key)
    key[3..4]
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def date_offset(date)
    date_squared(date).to_s[-4..-1]
  end

  def a_offset(date)
    date_offset(date)[0].to_i
  end

  def b_offset(date)
    date_offset(date)[1].to_i
  end

  def c_offset(date)
    date_offset(date)[2].to_i
  end

  def d_offset(date)
    date_offset(date)[3].to_i
  end

  def a_shift(key, date)
    a_key(key).to_i + a_offset(date)
  end

  def b_shift(key, date)
    b_key(key).to_i + b_offset(date)
  end

  def c_shift(key, date)
    c_key(key).to_i + c_offset(date)
  end

  def d_shift(key, date)
    d_key(key).to_i + d_offset(date)
  end

  def message_encrypt(message, key, date)
    shift_a = Hash[character_set.zip(character_set.rotate(a_shift(key, date)))]
    shift_b = Hash[character_set.zip(character_set.rotate(b_shift(key, date)))]
    shift_c = Hash[character_set.zip(character_set.rotate(c_shift(key, date)))]
    shift_d = Hash[character_set.zip(character_set.rotate(d_shift(key, date)))]
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

  def message_decrypt(message, key, date)
    unshift_a = Hash[character_set.zip(character_set.rotate(-a_shift(key, date)))]
    unshift_b = Hash[character_set.zip(character_set.rotate(-b_shift(key, date)))]
    unshift_c = Hash[character_set.zip(character_set.rotate(-c_shift(key, date)))]
    unshift_d = Hash[character_set.zip(character_set.rotate(-d_shift(key, date)))]
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
