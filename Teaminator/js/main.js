Array.prototype.chunk = function(chunkSize) {
    var array=this;
    return [].concat.apply([],
        array.map(function(elem,i) {
            return i%chunkSize ? [] : [array.slice(i,i+chunkSize)];
        })
    );
};

function isIdealSize(people, maxSize) {
  var groups = people.chunk(maxSize)
  return (groups[0].length - groups[groups.length - 1].length) <= 1;
}

function group(people) {
  var maxSize = 5;

  for(var i = maxSize; i >= 0; i--) {
    if (isIdealSize(people, i)) {
      return people.chunk(i);
    }
  }
}