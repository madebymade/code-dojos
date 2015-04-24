class CoinSum

  DEFAULT_COINS = [1, 2, 5, 10, 20, 50, 100, 200]

  def initialize(config)
    @sum = config[:sum]
    @coins = config['coins'] || DEFAULT_COINS
  end

  def calc

  end
end