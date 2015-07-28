window.Boat = function(left_bank, right_bank) {
  this.left_bank = left_bank;
  this.right_bank = right_bank;
};

Boat.prototype.move = function(passenger) {
  var voyage = this.voyage();
  if (this.validateMove(voyage, passenger)) {
    return this.transport(voyage[0], voyage[1], passenger);
  } else {
    return false;
  }
}

Boat.prototype.transport = function(source, destination, passenger) {
  var idx = source.indexOf(passenger);
  var man_idx = source.indexOf('Man');

  if (idx === -1 || man_idx === -1) {
    return false;
  }

  source.splice(idx, 1);
  destination.push(passenger);

  source.splice(man_idx, 1);
  destination.push('Man');

  return true;
}

Boat.prototype.validateMove = function(voyage, passenger) {
  var candidate_source = cloneArray(voyage[0]);
  var candidate_destination = cloneArray(voyage[1]);

  this.transport(candidate_source, candidate_destination, passenger)

  return validator(candidate_source) &&
         validator(candidate_destination);
}

Boat.prototype.voyage = function() {
  if (this.left_bank.indexOf('Man') >= 0)
    return [this.left_bank, this.right_bank];

  if (this.right_bank.indexOf('Man') >= 0)
    return [this.right_bank, this.left_bank];
}

function cloneArray(arr) {
  clonedArr = [];
  for (var i = 0; i < arr.length; i++) {
    clonedArr[i] = arr[i];
  }

  return clonedArr;
}
