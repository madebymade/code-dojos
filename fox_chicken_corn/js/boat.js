window.Boat = function(left_bank, right_bank) {
  this.left_bank = left_bank;
  this.right_bank = right_bank;
};

Boat.prototype.move = function(passenger) {
  var voyage = this.voyage(passenger);
  var idx = startBank.indexOf(passenger);
  if (this.validateMove(voyage, passenger)) {
    startBank.shift(idx, 1);
    this.right_bank.push(passenger);
  }
}

Boat.prototype.validateMove = function(voyage, passenger) {
  candidate_left_bank = cloneArray(this.left_bank);
  candidate_right_bank = cloneArray(this.right_bank);

  source = voyage[0];
  destination = voyage[1];

  return validator(candidate_left_bank) &&
         validator(candidate_right_bank);
}

Boat.prototype.voyage = function(passenger){
  if (this.left_bank.indexOf(passenger) >= 0)
    return [this.left_bank, this.right_bank];

  if (this.right_bank.indexOf(passenger) >= 0)
    return [this.right_bank, this.left_bank];
}

function cloneArray(arr) {
  clonedArr = [];
  for (var i = 0; i < arr.length; i++) {
    clonedArr[i] = arr[i];
  }

  return clonedArr;
}
