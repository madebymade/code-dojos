class LexicographicOrder
  def at(seed, index)
    seed.permutation.to_a[index - 1].join.to_i
  end
end
