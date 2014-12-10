class GolfPaths
  def initialize(args)
    @total_holes = args[:total_holes]
  end

  def calc
    paths(@total_holes)
  end

  private

  def paths(holes = 3, hole = 0, score = 0, path_c = 0)
    if score.abs > holes - hole or hole >= holes
      return path_c + 1
    end

    path_c = paths(holes, hole + 1, score - 1, path_c)
    path_c = paths(holes, hole + 1, score, path_c)
    path_c = paths(holes, hole + 1, score + 1, path_c)
  end
end
