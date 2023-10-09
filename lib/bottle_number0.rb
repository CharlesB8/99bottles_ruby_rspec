require_relative "bottle_number"

class BottleNumber0 < BottleNumber

  def self.handles?(number)
    number == 0
  end
  def quantity
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end
end
