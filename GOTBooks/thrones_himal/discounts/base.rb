module Discounts
  class Base
    def initialize
      raise NotImplementedError
    end

    def apply
      raise NotImplementedError
    end
  end
end
