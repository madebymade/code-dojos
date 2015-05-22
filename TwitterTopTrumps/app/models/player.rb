class Player
  attr_reader :screen_name

  def initialize(args)
    @screen_name = args[:screen_name]
  end

  def deck
    TwitterFollowers.new.deck_for(screen_name)
  end
end
