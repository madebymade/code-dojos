# Made Game Grid - Part 1 (2014)

- Create a 3x3 grid with boundaries all the way around it that the player avatar cannot cross.

- Each tile in the grid should be 32x32px, with the player avatar occupying one tile.

- The player avatar should be able to move in four directions (up, down, left, right) using the arrow keys.

- Do the above without using a game engine (i.e. no [Phaser.js](http://phaser.io), [Crafty.js](http://craftyjs.com) or [Pixi.js](http://www.pixijs.com/))


# Part 2 (18/02/2015)

- Create a larger grid.
- Add obstacles/barriers/walls.


# Part 3 (04/02/2015)

- Fix broken boundaries


# Part 4 (24/04/2015)

- Randomly generate obstacles

- Add collectible items.

# Part 5 (??/??/2015)

### Holdover from previous dojo

- Have the collectible items actually be collectible

- When collectibles are collected, increase player score by 100 points

### New features

- Add a "win" tile that we can place, and which triggers a Game Over (success) event when the player reaches it.

### Upon completion of the above
####(i.e. in future dojos)

- Add enemies that chase the player to a certain degree (their starting positions must not clash with obstacles or the player).

- Add the concept of "lives" to the player, and have the player start with three. A player loses a life if an enemy occupies the same square as they player.

- If they lose one life, they go back to the start of the grid, if they lose all lives a Game Over (failure) event is triggered.

- Have the world builder generate a random maze, and have it be intelligent enough to ensure there are multiple pathways to the win tile.
