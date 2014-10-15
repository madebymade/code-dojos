describe("Player", function() {
  var player;

  beforeEach(function() {
    player = {'x': 0, 'y': 0}
  });

  describe("moving", function() {
    it("to the right", function() {
      expect(moveRight(player)).toEqual({'x': 32, 'y': 0});
    });
  });
});
