var input = require('../data/day_1_input');

function Captcha(sequence){
  this.sequence = sequence.toString().split('').map(Number)
}

module.exports = Captcha;
