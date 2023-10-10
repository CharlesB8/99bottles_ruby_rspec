class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  # This form of factory is confusing, and goes against best practices, but it dyanamically will select any subclasses
  # that follow the BottleNumber{num} naming convention
  # def self.for(number)
  #   begin
  #     const_get("BottleNumber#{number}")
  #   rescue NameError
  #     BottleNumber
  #     # That's interesting! Every block of code is an object!
  #   end.new(number)
  # end

  # I would have never thought of this
  # def self.for(number)
  #   Hash.new(BottleNumber).merge(
  #     0 => BottleNumber0,
  #     1 => BottleNumber1,
  #     6 => BottleNumber6
  #   )[number].new(number)
  # end

  # def self.for(number)
  #   [BottleNumber6, BottleNumber1, BottleNumber0, BottleNumber].
  #     find {|candidate| candidate.handles?(number)}.new(number)
  # end

  def self.for(number)
    registry.find {|candidate| candidate.handles?(number)}.new(number)
  end

  def self.inherited(candidate)
    register(candidate)
  end

  def self.registry
    @registry ||= [BottleNumber]
  end

  def self.register(candidate)
    registry.prepend(candidate)
  end

  def self.handles?(number)
    true
  end

  # As pointed out in 6.1; In a real scenario you probably need a more general .to_s method
  def to_s
    "#{quantity} #{container}"
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    "one"
  end

  def successor
    BottleNumber.for(number - 1)
  end
end
