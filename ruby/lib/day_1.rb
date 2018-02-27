class Captcha

  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def arrayify_sequence
    sequence.to_s.split("").map { |n| n.to_i }
  end

  def arrayify_matching_digits
    self.arrayify_sequence.select.with_index do |n, i|
      i == self.arrayify_sequence.length - 1 ? n == self.arrayify_sequence[0] : n == self.arrayify_sequence[i+1]
    end
  end
end
