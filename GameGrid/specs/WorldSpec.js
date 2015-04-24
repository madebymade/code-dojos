describe("Player", function() {
  var player;

  beforeEach(function() {
    world = createWorld(25, 25),
    player = createPlayer();
  });

  describe("ContstrainBoundaries", function() {
    it("allows player to move to valid tile", function() {
      expect(canMove(world, player, 1, 0)).toEqual(true);
    });

    it("prevents player from moving to an invalid position", function() {
      expect(canMove(world, player, -1, 0)).toEqual(false);
      expect(canMove(world, player, 26, 0)).toEqual(false);
    });
  });

  describe("RandomPositionsInWorld", function() {
    it("generates 10 random positions", function() {
      expect(RandomPositionsInWorld(10).length).toEqual(10)
    });

    it("returns positions within the x and y coordinates", function() {
      result = RandomPositionsInWorld(10)
      first_result = result[0];
      expect(first_result.x).toBeLessThan(world.length);
    });

    it("collects a collectable item", function() {
      expect(player.score).toEqual(1);
    });
  });

});
