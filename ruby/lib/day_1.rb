class Captcha

  attr_reader :sequence, :do_half_way_around

  def initialize(sequence, do_half_way_around=false)
    @do_half_way_around = do_half_way_around
    @sequence = sequence
  end

  def arrayified_sequence
    sequence.to_s.split("").map { |n| n.to_i }
  end

  def arrayify_matching_digits
    steps_forward = do_half_way_around ? arrayified_sequence.length / 2 : 1
    self.arrayified_sequence.select.with_index do |n, i|
      the_array = self.arrayified_sequence
      last_digit_in_sequence = self.arrayified_sequence.length - 1
      steps_left = the_array[i..the_array[last_digit_in_sequence]].length
      if i == last_digit_in_sequence
        n == the_array[steps_forward-1]
      elsif steps_forward > steps_left
        matching_index = (steps_forward - steps_left) - 1
        n == the_array[matching_index]
      else
        n == the_array[i+steps_forward]
      end
    end
  end

  def captcha_sum
    return 0 if self.arrayify_matching_digits.empty?
    self.arrayify_matching_digits.reduce(:+)
  end
end

