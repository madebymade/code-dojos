class RomanNumerator
  attr_reader :value

  def initialize(value)
    @numerals = ['I','V','X','L','C','D','M']
    @value = value
  end

  def <(comparator)
    char_lt?(char, comparator.value[0])
  end

  private

    def char_lt?(numeral_1, numeral_2)
      @numerals.index(numeral_1) < @numerals.index(numeral_2)
    end
end
