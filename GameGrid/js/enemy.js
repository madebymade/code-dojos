window.Enemy = function() {
  this.x = 0;
  this.y = 0;

  this.move = function(x, y) {
    this.x += x;
    this.y += y;
  }
}
