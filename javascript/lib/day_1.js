function Captcha(sequence){
  this.sequence = sequence;
}

Captcha.prototype.arrayifySequence = function () {
  return this.sequence ? this.sequence.toString().split('').map(Number) : [];
}

Captcha.prototype.arrayifyMatchingDigits = function () {
  var sequence = this.arrayifySequence();
  return sequence.filter(function(n, i) {
    return i === sequence.length-1 ? n === sequence[0] : n === sequence[i+1];
  })
}

Captcha.prototype.captchaSum = function () {
  if(this.arrayifyMatchingDigits().length === 0){ return 0 }
  return this.arrayifyMatchingDigits().reduce(function (acc, num) {
    acc += num;
    return acc;
  })
}

module.exports = Captcha;
