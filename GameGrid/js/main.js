$(document).ready(function () {
  var canvas = document.getElementById("game-grid"),
      context = canvas.getContext("2d"),
      player = {'x': 0, 'y': 0};

  drawWorld(context, player);

  $(window).keydown(function (e) {
    switch (e.which) {
      case 37: // left
      case 97: // a
        player = moveLeft(player);
        break;

      case 38: // up
      case 119: // w
        player = moveUp(player);
        break;

      case 39: // right
      case 100: // d
        player = moveRight(player);
        break;

      case 40: // down
      case 115: // s
        player = moveDown(player);
        break;
    }

    drawWorld(context, player);
  });
});













