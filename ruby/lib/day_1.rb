class Captcha

  def initialize(sequence)
    @sequence = sequence
  end

  def arrayify_sequence
    @sequence.to_s.split("").map { |n| n.to_i }
  end

end
