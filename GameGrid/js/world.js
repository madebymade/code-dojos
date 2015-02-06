window.cell_dimensions = {'width': 32, 'height': 32};
window.cell_count = {'x': 25, 'y': 25};

function createWorld(width, height){
  var world = [];
  for (var i = 0 ; i < height; i++ ){
    world.push(new Array(width));
  }

  world[5][6] = 1;
  world[6][9] = 1;
  world[21][6] = 1;
  world[14][8] = 1;
  world[8][16] = 1;

  return world;
}

window.boundaries = {
  'bottom': window.cell_dimensions.height * window.cell_count['y'],
  'left': 0,
  'right': window.cell_dimensions.width * window.cell_count['x'],
  'top': 0
};

function drawPlayerCell(context, x, y) {
  var image = new Image();

  image.onload = function () {
    context.drawImage(image, x * window.cell_dimensions.width, y * window.cell_dimensions.height, window.cell_dimensions.width, window.cell_dimensions.height)
  }

  image.src = 'img/player.jpg';
}

function drawWorld(context, player, world) {
  for (var y = 0; y < world.length; y++) {
    for (var x = 0; x < world[y].length; x++) {
      switch (world[y][x]) {
        case 1:
          drawObstacleCell(context, x, y);
          break;
        default:
          drawBackgroundCell(context, x, y);
      }
    }
  }

  drawPlayerCell(context, player.x, player.y);
}

function drawBackgroundCell(context, x, y) {
  drawCell(context, x, y, "#00FF00");
}

function drawObstacleCell(context, x, y) {
  drawCell(context, x, y, "#FF0000");
}

function drawCell(context, x, y, color) {

  context.fillStyle = color;

  context.fillRect(x * cell_dimensions.width,
                   y * cell_dimensions.height,
                   cell_dimensions.width,
                   cell_dimensions.height);
}


function constrainBoundaries(world, player, x, y) {
  if(canMove(world, player, x, y)) {
    return { 'x': player.x + x, 'y': player.y + y };
  } else {
    return player;
  }
}

function canMove(world, player, x, y) {
  if (world[player.y + y][player.x + x] == 1) {
    return false
  }

  return true
}

function move(world, player, xDelta, yDelta) {
  return constrainBoundaries(world, player, xDelta, yDelta);
}

function moveLeft(world, player) { return move(world, player, -1, 0); }

function moveUp(world, player) { return move(world, player, 0, -1); }

function moveRight(world, player) { return move(world, player, 1, 0); }

function moveDown(world, player) { return move(world, player, 0, 1); }