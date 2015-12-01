$(document).ready(function () {
  var canvas = document.getElementById("game-grid"),
      context = canvas.getContext("2d"),
      world = createWorld(25, 25),
      player = new Player();

  drawWorld(context, player, world);

  $(window).keydown(function (e) {

    switch (e.which) {
      case 37: // left
      case 97: // a
        player = moveLeft(world, player);
        break;

      case 38: // up
      case 119: // w
        player = moveUp(world, player);
        break;

      case 39: // right
      case 100: // d
        player = moveRight(world, player);
        break;

      case 40: // down
      case 115: // s
        player = moveDown(world, player);
        break;
    }

    drawWorld(context, player, world);
  });
});
