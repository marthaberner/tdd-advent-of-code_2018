var input = require('../data/day_1_input');

function Captcha(sequence){
  this.sequence = sequence.toString().split('').map(Number)
}

Captcha.prototype.arrayifyMatchingDigits = function () {
  var sequence = this.sequence;
  return sequence.filter(function(n, i) {
    return n === sequence[i+1];
  })
}

Captcha.prototype.captchaSum = function () {
  return this.arrayifyMatchingDigits().reduce(function (acc, num) {
    acc += num;
    return acc;
  })
}

module.exports = Captcha;
