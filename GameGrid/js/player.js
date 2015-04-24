window.Player = function() {
  this.score = 0;
  this.x = 0;
  this.y = 0;

  this.pickUp = function(collectable) {
    this.score = this.score + collectable.points
  }
}
