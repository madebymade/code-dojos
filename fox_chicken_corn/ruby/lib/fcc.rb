class FCC
  INVALID_COMBINATIONS = [
    [:chicken, :corn],
    [:chicken, :fox],
    [:chicken, :corn, :fox]
  ]

  def initialize
    @positions = { chicken: :left,
                   corn: :left,
                   fox: :left,
                   man: :left }
  end

  def move(object)
  end

  def potential_move(object = nil)
    duped_positions = @positions.clone

  end

  def combinations_from_hash(hash)

  end

  def check(combination)
    !INVALID_COMBINATIONS.include?(combination.sort)
  end

  private

  def current_bank
    @positions[:man]
  end

  def opposite_bank
    case @positions[:man]
      when :left then :right
      when :right then :left
    end
  end

  def bank(side)
    @positions.map do |key, value|
      key if value == side
    end
  end
end
