module Discounts
  class Quantity < Base
    RATES = {
      1 => 0.0,
      2 => 0.05,
      3 => 0.10,
      4 => 0.20,
      5 => 0.25
    }

    def initialize; end

    def apply(items)
      item_groups = group_single_items(group_items(items))
      sets = create_sets(item_groups)

      discounts = map_discounts(map_size_and_set_totals(sets))

      sum_discounts(discounts)
    end

    private

    def group_items(items)
      items.group_by { |i| i }.values
    end

    def find_single_items(item_groups)
      item_groups.find_all {|g| g.size == 1}
    end

    def group_single_items(item_groups)
      singles = item_groups.find_all {|g| g.size == 1}
      if item_groups.find { |g| g.size > 1 }
        item_groups = (item_groups - singles) << singles.flatten
      end
      item_groups
    end

    def create_sets(item_groups)
      item_groups.safe_transpose.map(&:compact)
    end

    def map_size_and_set_totals(sets)
      sets.map { |s| [s.size, s.reduce(0) { |t, i| t + i.price }] }
    end

    def map_discounts(sizes_and_totals)
      sizes_and_totals.map { |s| s.last * RATES[s.first] }
    end

    def sum_discounts(discounts)
      discounts.reduce(&:+)
    end
  end
end
