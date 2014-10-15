window.boundaries = {
  'bottom': 96,
  'left': 0,
  'right': 96,
  'top': 0
};

function drawPlayer(context, player) {
  var image = new Image();

  image.onload = function () {
    context.drawImage(image, player.x, player.y, 32, 32)
  }

  image.src = 'img/player.jpg';
}

function drawWorld(context, player) {
  context.fillStyle = "#00FF00";
  context.fillRect(window.boundaries.left,
                   window.boundaries.top,
                   window.boundaries.right,
                   window.boundaries.bottom);

  drawPlayer(context, player);
}

function constrainBoundaries(player, x, y) {
  if(canMove(x, y)) {
    return { 'x': x, 'y': y };
  } else {
    return player;
  }
}

function canMove(x, y) {
  return !(x < window.boundaries.left || y < window.boundaries.top || x >= window.boundaries.right || y >= window.boundaries.bottom)
}

function move(player, xDelta, yDelta) {
  return constrainBoundaries(player, player.x + xDelta, player.y + yDelta);
}

function moveLeft(player) { return move(player, -32, 0); }

function moveUp(player) { return move(player, 0, -32); }

function moveRight(player) { return move(player, 32, 0); }

function moveDown(player) { return move(player, 0, 32); }