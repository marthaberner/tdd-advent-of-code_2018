require 'spec_helper'
require 'day_1'

describe Captcha do
  describe '#arrayify_sequence' do
    it 'converts input sequence to array of integers' do
      input = 1122
      captcha = Captcha.new(input)
      expect(captcha.arrayify_sequence).to eq [1, 1, 2, 2]
    end

    it 'returns an empty array if handed nil' do
      input = nil
      captcha = Captcha.new(input)
      expect(captcha.arrayify_sequence).to eq []
    end
  end
end
