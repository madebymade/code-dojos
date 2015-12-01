window.cell_dimensions = {'width': 32, 'height': 32};
window.cell_count = {'x': 25, 'y': 25};
var ENEMY = 4;
var OBSTACLE = 1;
var COLLECTABLE = 2;
var WINNING_SQUARE = 3;


function createWorld(width, height){
  var world = [];
  for (var i = 0 ; i < height; i++ ){
    world.push(new Array(width));
  }

  world = placeEntityInWorld(world, OBSTACLE, 50);
  world = placeWinningSquare(world);
  world = placeEntityInWorld(world, COLLECTABLE, 10);
  world = placeEntityInWorld(world, ENEMY, 1);
  return world;
}

function randomCoordinate(axis) {
  return Math.floor(Math.random() * window.cell_count[axis]);
}

function placeWinningSquare(world) {
  world[24][24] = WINNING_SQUARE;
  return world;
}

function placeEntityInWorld(world, entity, amount) {
  positions = RandomPositionsInWorld(amount, 1);
  for (var i = 0; i < positions.length; i++) {
    world[positions[i]['y']][positions[i]['x']] = entity;
  }

  return world;
}

window.boundaries = {
  'bottom': window.cell_dimensions.height * window.cell_count['y'],
  'left': 0,
  'right': window.cell_dimensions.width * window.cell_count['x'],
  'top': 0
};

function drawPlayerCell(context, x, y) {
  drawImageCell(context, x, y, 'img/player.jpg');
}


function drawWorld(context, player, world) {
  for (var y = 0; y < world.length; y++) {
    for (var x = 0; x < world[y].length; x++) {
      switch (world[y][x]) {
        case OBSTACLE:
          drawObstacleCell(context, x, y);
          break;
        case COLLECTABLE:
          drawCollectableCell(context, x, y);
          break;
        case WINNING_SQUARE:
          drawWinningCell(context, x, y);
          break;
        default:
          drawBackgroundCell(context, x, y);
      }
    }
  }

  drawEnemies(context, world.enemies);
  drawPlayerCell(context, player.x, player.y);
}

function drawEnemies(context, enemies) {
  enemies.forEach(function(enemy) {
    drawEnemyCell(context, enemy.x, enemy.y);
  });
}

function drawBackgroundCell(context, x, y) {
  drawCell(context, x, y, "#000000");
}

function drawObstacleCell(context, x, y) {
  drawImageCell(context, x, y, 'img/obstacle.jpg');
}

function drawCollectableCell(context, x, y) {
  drawImageCell(context, x, y, 'img/collectable.png');
}

function drawWinningCell(context, x, y) {
  drawImageCell(context, x, y, 'img/winning.jpg');
}

function drawEnemyCell(context, x, y) {
  drawImageCell(context, x, y, 'img/enemy.jpg');
}

function drawImageCell(context, x, y, source_image) {
  var image = new Image();

  image.onload = function () {
    context.drawImage(image,
                      x * window.cell_dimensions.width,
                      y * window.cell_dimensions.height,
                      window.cell_dimensions.width,
                      window.cell_dimensions.height)
  }

  image.src = source_image;
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
    player.move(x, y);
  }

  return player;
}

function canMove(world, player, x, y) {
  var world_tile_x = player.x + x,
      world_tile_y = player.y + y;

  if (isOutsideBoundary(world, world_tile_x, world_tile_y)) {
    return false;
  }

  if (isObstacle(world, world_tile_x, world_tile_y)) {
    return false;
  }

  if (isCollectable(world, world_tile_x, world_tile_y)) {
    player.pickUp({ points: 100 });
    removeCollectable(world, world_tile_x, world_tile_y);
    return true;
  }

  if (isWinningCell(world, world_tile_x, world_tile_y)) {
    showGameOver('Wow, you won!', player.score);
    return true;
  }

  if (isEnemy(world, world_tile_x, world_tile_y)) {
    showGameOver('Wow, you died!', player.score);
    return true;
  }

  return true;
}

function showGameOver(message, score) {
  $('body').html('<h1 id="game-over">' + message + '</h1>' +
                 '<h2 id="player-score">You scored:' + score + '</h2>' +
                 '<a href="#" onclick="window.location = window.location; return false">restart</a>');
}

function removeCollectable(world, x, y) {
  world[y][x] = 0;
}

function isWinningCell(world, x, y) {
  return world[y][x] == WINNING_SQUARE;
}

function isEnemy(world, x, y) {
  return world[y][x] == ENEMY;
}

function isCollectable(world, x, y) {
  return world[y][x] == COLLECTABLE;
}

function isObstacle(world, x, y) {
  return world[y][x] == OBSTACLE;
}

function isOutsideBoundary(world, x, y) {
  if(x < 0 || y < 0) {
    return true;
  }

  if(y >= world.length) {
    return true;
  }

  if(x >= world[y].length) {
    return true;
  }

  return false;
}

function moveEnemies(world) {

}

function move(world, player, xDelta, yDelta) {
  moveEnemies(world);
  return constrainBoundaries(world, player, xDelta, yDelta);
}

function moveLeft(world, player) { return move(world, player, -1, 0); }

function moveUp(world, player) { return move(world, player, 0, -1); }

function moveRight(world, player) { return move(world, player, 1, 0); }

function moveDown(world, player) { return move(world, player, 0, 1); }

function RandomPositionsInWorld(limit) {
  var coords = new Array();
  for (var i = 0; i < limit; i++) {
    coords.push({ x: randomCoordinate('x'), y: randomCoordinate('y') });
  }
  return coords;
}
