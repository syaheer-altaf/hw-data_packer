# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    n_bit_shift = Math.log2(26).ceil
    str.chars.reduce(0) do |num, alphabet|
      (num << n_bit_shift) | (alphabet.ord - 'a'.ord + 1)
    end
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    n_bit_shift = Math.log2(26).ceil
    masked_values = packed.digits(2**n_bit_shift).reverse
    masked_values.map { |n| (n + 'a'.ord - 1).chr }.join
  end
end
