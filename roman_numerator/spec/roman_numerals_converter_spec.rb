require 'rspec'
require_relative '../roman_numerator.rb'

describe "convert method" do

  before :each do
    @converter = RomanNumeralsConverter.new
  end

  it "returns 'XXII' from 'XX' plus 'II'" do
    ('XX' + 'II').should eq "XXII"
  end

end

describe "lesser number can be used to prefix a larger number" do

  it "IV is less than V" do
    iv = RomanNumerator.new("IV")
    v = RomanNumerator.new("V")
    (iv < v).should be_true
  end

  it "CM is less than M" do
    cm = RomanNumerator.new("CM")
    m = RomanNumerator.new("M")
    (cm < m).should be_true
  end

  it "X should be less than IC" do
    x = RomanNumerator.new("X")
    ic = RomanNumerator.new("IC")
    (x < ic).should be_true
  end

end

# Key:
#
# I == 1
# V == 5
# X == 10
# L == 50
# C == 100
# D == 500
# M == 1000

# Symbols are converted to numbers by adding together the values they represent

# A run of symbols shouldn't feature the same symbol more than three times in succession:
## i.e. III (3) is cool, IIII (4) is not cool

# To achieve the numbers the above restriction prevents us from getting,
# you can place a smaller value symbol before a larger value symbol,
# which indicates that the smaller value should be subtracted
## i.e. IV == 4, MCM == 1900 (M = 1000, CM == (1000 - 100)), XL == 40


# It looks like we can just throw the "no more than three identical symbols in a row" rule
# out the window when we get to 4000 for this dojo, as the concept of a "bar" is introduced at that point,
# which is a horizontal line (so, a bar) drawn above a symbol or symbols to indicate that those symbols
# should be multiplied by a 1000 (i.e. IV with a bar above it would 4000),
# and I don't know if those symbols can be represented in Ruby.
# Maybe we just create our own way of representing a bar?





