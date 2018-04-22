require 'spec_helper'
require 'day_1'

describe Captcha do
  describe '#arrayified_sequence' do
    it 'converts input sequence to array of integers' do
      input = 1122
      captcha = Captcha.new(input)
      expect(captcha.arrayified_sequence).to eq [1, 1, 2, 2]
    end

    it 'returns an empty array if handed nil' do
      input = nil
      captcha = Captcha.new(input)
      expect(captcha.arrayified_sequence).to eq []
    end
  end

  describe '#arrayify_matching_digits' do
    it 'creates an array of sequence digits that matched the next digit' do
      input = 1122
      captcha = Captcha.new(input)
      expect(captcha.arrayify_matching_digits).to eq [1, 2]
    end

    it 'compares last digit in sequence to first' do
      input = 1111
      captcha = Captcha.new(input)
      expect(captcha.arrayify_matching_digits).to eq [1, 1, 1, 1]
    end

    it 'can match digits halfway around' do
      input = 1212
      do_half_way_around = true
      captcha = Captcha.new(input, do_half_way_around)
      expect(captcha.arrayify_matching_digits).to eq [1,2,1,2]
    end
  end

  describe '#captcha_sum' do
    it 'sums the arrayified matching digits' do
      input = 1122
      captcha = Captcha.new(input)
      expect(captcha.captcha_sum).to eq 3
    end

    it 'returns zero when no numbers match' do
      input = 1234
      captcha = Captcha.new(input)
      expect(captcha.captcha_sum).to eq 0
    end
  end
end
