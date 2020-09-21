# frozen_string_literal: true

# Creates encryption and decryption keys
class KeyGen
  def self.encrypt(key, date)
    keys = make_keys(key)
    offsets = make_offsets(date)
    keys.map.with_index { |key, idx| key + offsets[idx] }
  end

  def self.make_keys(key)
    key.split('')[0..-2].map.with_index do |digit, idx|
      (digit + key[idx + 1]).to_i
    end
  end

  def self.make_offsets(date)
    (date.to_i**2).to_s.split('')[-4..-1].map(&:to_i)
  end
end
