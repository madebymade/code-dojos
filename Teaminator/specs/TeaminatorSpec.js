describe("Teaminator", function() {
  describe("when given eight people", function() {
    var people = ['emile', 'seb', 'luke', 'matt', 'fareed', 'scoot', 'chris', 'rory'];
    var groups = group(people);

    it("should return two groups", function() {
      expect(groups.length).toEqual(2);
    });

    it("should return groups of four", function() {
      $.each(groups, function (i) {
        expect(groups[i].length).toEqual(4);
      });
    });
  });

  describe("when given nine people", function() {
    var people = ['emile', 'seb', 'luke', 'matt', 'fareed', 'scoot', 'chris', 'rory', 'jeff'];
    var groups = group(people);

    it("should return two groups", function() {
      expect(groups.length).toEqual(2);
    });

    it("should return first group with five people", function() {
      expect(groups[0].length).toEqual(5);
    });

    it("should return second group with four people", function() {
      expect(groups[1].length).toEqual(4);
    });
  });

  describe("when given eleven people", function() {
    var people = ['emile', 'seb', 'luke', 'matt', 'fareed', 'scoot', 'chris', 'rory', 'jeff', 'bob', 'dean'];
    var groups = group(people);

    it("should return three groups", function() {
      expect(groups.length).toEqual(3);
    });

    it("should return first group with four people", function() {
      expect(groups[0].length).toEqual(4);
    });

    it("should return second group with four people", function() {
      expect(groups[1].length).toEqual(4);
    });

    it("should return third group with three people", function() {
      expect(groups[2].length).toEqual(3);
    });
  });
});
