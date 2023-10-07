class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
      # That's interesting! Every block of code is an object!
    end.new(number)
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
