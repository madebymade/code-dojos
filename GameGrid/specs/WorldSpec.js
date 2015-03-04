describe("Player", function() {
  var player;

  beforeEach(function() {
    world = createWorld(25, 25),
    player = {'x': 0, 'y': 0};
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
});
