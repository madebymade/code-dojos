INVALID_COMBINATIONS = [
  ['Chicken', 'Corn'],
  ['Fox', 'Chicken'],
  ['Corn', 'Fox', 'Chicken']
];

var arraysEqual = function(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;

  for (var i = 0; i < arr2.length; i++) {
    if(arr1.indexOf(arr2[i]) < 0)
      return false;
  }

  return true;
}

var validator = function(passengers) {
  for(var i = 0; i < INVALID_COMBINATIONS.length; i++)
    if(arraysEqual(INVALID_COMBINATIONS[i], passengers))
      return false;

  return true;
}
