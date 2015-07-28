describe('validator', function() {
  describe('invalid combination', function() {
    it("returns false for ['Chicken', 'Corn']", function() {
      expect(validator(['Chicken', 'Corn'])).toEqual(false);
    });

    it("returns false for ['Chicken', 'Fox']", function() {
      expect(validator(['Chicken', 'Fox'])).toEqual(false);
    });

    it("returns false for ['Chicken', 'Fox', 'Corn']", function() {
      expect(validator(['Chicken', 'Fox', 'Corn'])).toEqual(false);
    });
  });

  describe('valid combination', function() {
    it("returns true for ['Chicken', 'Fox', 'Corn', 'Man']", function() {
      expect(validator(['Chicken', 'Fox', 'Corn', 'Man'])).toEqual(true);
    });

    it("returns true for ['Corn', 'Fox']", function() {
      expect(validator(['Corn', 'Fox'])).toEqual(true);
    });

    it("returns true for ['Chicken']", function() {
      expect(validator(['Chicken'])).toEqual(true);
    });

    it("returns true for ['Chicken', 'Fox', 'Man']", function() {
      expect(validator(['Chicken', 'Fox', 'Man'])).toEqual(true);
    });
  });
});

describe('boat', function() {
  beforeEach(function() {
    var left_bank = ['Man', 'Fox', 'Chicken', 'Corn'],
        right_bank = [];
        this.boat = new Boat(left_bank, right_bank);
  });

  describe('move', function() {
    it("returns false if it results in an invalid bank", function() {
      expect(this.boat.move('Fox')).toEqual(false);
    });

    it("returns true if it results in a valid bank", function() {
      expect(this.boat.move('Chicken')).toEqual(true);
    });
  });
});

describe('fcc', function() {
  beforeEach(function() {
    this.fcc = new FCC;
  });

  describe('validMove', function() {
    it("returns an array of valid next moves", function() {
      expect(this.fcc.validMoves(['Man', 'Fox', 'Chicken', 'Corn'], [])).toEqual([
        [['Fox', 'Corn'], ['Man', 'Chicken']]
      ]);
    });
  });
});
