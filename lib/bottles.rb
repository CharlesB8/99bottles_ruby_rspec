require_relative 'bottle_number'
class Bottles

  def song
    verses(99, 0)
  end

  # This method is kind of crazy looking, not sure if I like it
  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    # Each verse will create two instances for BottleNumber. Not exactly sure
    # why we need to make a brand new instance for the last line of the verse
    bottle_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(bottle_number.successor)

    # String interpolation invokes .to_s, so all we need to do is put the object inside
    # #{} to get the container and quantity, as defined in the BottleNumber .to_s method
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{next_bottle_number} of beer on the wall.\n"
  end
end