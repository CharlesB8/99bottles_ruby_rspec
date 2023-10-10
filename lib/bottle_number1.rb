require_relative "bottle_number"
class BottleNumber1 < BottleNumber
  BottleNumber.register(self)

  def self.handles?(number)
    number == 1
  end
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
