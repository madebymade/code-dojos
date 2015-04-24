window.Player = function() {
  this.score = 0;
  this.x = 0;
  this.y = 0;

  this.pickUp = function(collectable) {
    this.score += collectable.points
  }

  this.move = function(x, y) {
    this.x += x;
    this.y += y;
  }
}
