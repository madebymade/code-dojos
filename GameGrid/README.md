# Made Game Grid - Part 1

- Create a 3x3 grid with boundaries all the way around it that the player avatar cannot cross.

- Each tile in the grid should be 32x32px, with the player avatar occupying one tile.

- The player avatar should be able to move in four directions (up, down, left, right) using the arrow keys.

- Do the above without using a game engine (i.e. no [Phaser.js](http://phaser.io), [Crafty.js](http://craftyjs.com) or [Pixi.js](http://www.pixijs.com/))


# Made Game Grid - Part 2

- Create a larger grid.

- Add obstacles/barriers/walls.

- Add collectible items that update a score when the player picks them up.

- Add a "win" tile that triggers a Game Over (success) event when the player reaches it.

### If we ace that

- Add the concept of "lives" to the player, and have the player start with three. If they lose one life, they go back to the start of the grid, if they lose all lives a Game Over (failure) event is triggered.

- Add enemies that chase the player to a certain degree and take one of the player's lives if it comes into contact.