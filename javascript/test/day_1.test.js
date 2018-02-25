var assert = require('assert');
var Captcha = require('../lib/day_1');

describe('Captcha', function () {
  it('converts input sequence to array of integers', function () {
    var input = 1122;
    var captcha = new Captcha(input);
    assert.deepEqual(captcha.sequence, [1, 1, 2, 2]);
  })

  describe('#arrayifyMatchingDigits', function () {
    it('creates an array of sequence digits that matched the next digit', function() {
      var input = 1122;
      var captcha = new Captcha(input);
      assert.deepEqual(captcha.arrayifyMatchingDigits(), [1, 2]);
    })
  })

  describe('#captchaSum', function () {
    it('accumulates the arrayified matching digits', function() {
      var input = 1122;
      var captcha = new Captcha(input);
      assert.equal(captcha.captchaSum(), 3);
    })
  })
})
