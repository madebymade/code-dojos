describe('validator', function() {
  describe('invalid combination', function() {
    it("returns false for ['Chicken', 'Corn']", function() {
      expect(validator(['Chicken', 'Corn'])).toEqual(false);
    });

    it("returns false for ['Chicken', 'Fox']", function() {
      expect(validator(['Chicken', 'Fox'])).toEqual(false);
    });
  });

  describe('valid combination', function() {
    it("returns true for ['Chicken', 'Fox', 'Corn']", function() {
      expect(validator(['Chicken', 'Fox', 'Corn'])).toEqual(true);
    });

    it("returns true for ['Corn', 'Fox']", function() {
      expect(validator(['Corn', 'Fox'])).toEqual(true);
    });

    it("returns true for ['Chicken']", function() {
      expect(validator(['Chicken'])).toEqual(true);
    });
  });
});

describe('boat', function() {
  beforeEach(function() {
    var left_bank = ['Fox', 'Chicken', 'Corn'],
        right_bank = []
  });

  describe('move', function() {
    it("returns false if it results in an invalid bank", function() {
      expect(move('Fox')).toEqual(false);
    });
  });
});
