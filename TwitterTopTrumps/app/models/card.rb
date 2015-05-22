class Card
  attr_reader :screen_name

  def initialize(args)
    @screen_name = args[:screen_name]
    @followers_count = args[:followers_count]
    @friends_count = args[:friends_count]
  end

  def rating
    followers_count / friends_count
  end

  private

  attr_reader :followers_count
  attr_reader :friends_count
end
