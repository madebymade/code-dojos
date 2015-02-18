class CoinSum

  DEFAULT_COINS = [1, 2, 5, 10, 20, 50, 100, 200]

  def initialize(config)
    @sum = config[:sum]
    @coins = config['coins'] || DEFAULT_COINS
  end

  def calc
    results = []

    while start_coin = @coins.pop do
      results << start_coin if match?(start_coin)

      results << combination_matches(start_coin).flatten
    end

    results.count
  end

  private

  def combination_matches(coin)
    result = []

    next_coin = @coins.last

    loops through on the left coins
    work out combination_match on multiple self if too much use next use multiple next ... until no more
  end

  def match_with_self?(coin)
    match?(coin + coin)
  end

  def can_match?(coin_sum)
    @sum < coin_sum
  end

  def match?(coin_sum)
    @sum % coin_sum == 0
  end
end