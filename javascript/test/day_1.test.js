var assert = require('assert');
var Captcha = require('../lib/day_1');

describe('Captcha', function () {
  describe('#arrayifySequence', function () {
    it('converts input sequence to array of integers', function () {
      var input = 1122;
      var captcha = new Captcha(input);
      assert.deepEqual(captcha.arrayifySequence(), [1, 1, 2, 2]);
    })

    it('handles null', function () {
      var input = null;
      var captcha = new Captcha(input);
      assert.deepEqual(captcha.arrayifySequence(), []);
    })
  })


  describe('#arrayifyMatchingDigits', function () {
    it('creates an array of sequence digits that matched the next digit', function() {
      var input = 1122;
      var captcha = new Captcha(input);
      assert.deepEqual(captcha.arrayifyMatchingDigits(), [1, 2]);
    })

    it('compares last digit in sequence to first', function() {
      var input = 1111;
      var captcha = new Captcha(input);
      assert.deepEqual(captcha.arrayifyMatchingDigits(), [1, 1, 1, 1]);
    })
  })

  describe('#captchaSum', function () {
    it('sums the arrayified matching digits', function() {
      var input = 1122;
      var captcha = new Captcha(input);
      assert.equal(captcha.captchaSum(), 3);
    })

    it('returns zero when no numbers match', function() {
      var input = 1234;
      var captcha = new Captcha(input);
      assert.equal(captcha.captchaSum(), 0);
    })
  })
})
