require_relative 'bottle_number'
require_relative 'bottle_number0'
require_relative 'bottle_number1'
require_relative 'bottle_number6'

class Bottles

  def song
    verses(99, 0)
  end

  # This method is kind of crazy looking, not sure if I like it
  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    # String interpolation invokes .to_s, so all we need to do is put the object inside
    # #{} to get the container and quantity, as defined in the BottleNumber .to_s method
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    # we refactored successor(previously Integer) to return a BottleNumber object. This makes it much more trust worthy. This is inline with
    # Liskov Principle
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end