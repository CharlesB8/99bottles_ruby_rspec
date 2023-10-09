require_relative "bottle_number"
class BottleNumber6 < BottleNumber

  def self.handles?(number)
    number == 6
  end

  def quantity
    "1"
  end

  def container
    "six-pack"
  end
end
