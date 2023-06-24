class Bottles
  def verse(num)
    define_verse_1(num) + define_verse_2(num-1)
  end

  def verses(num1, num2)
    num_of_verses = num1 - num2 + 1
    results = []
    num_of_verses.times do
      results << verse(num1)
      break if num1 == num2
      results << "\n"
      num1 -= 1
    end
    results.join
  end

  def song
    verses(99, 0)
  end

  private

  def determine_plural(num)
    return "bottles" if num > 1
    "bottle"
  end

  def define_verse_1(num)
    if num > 0
      "#{num} #{determine_plural num} of beer on the wall, #{num} #{determine_plural num} of beer."
    else
      "No more bottles of beer on the wall, no more bottles of beer."
    end
  end

  def define_verse_2(num)
    if num > 0
      "\nTake one down and pass it around, #{num} #{determine_plural num} of beer on the wall.\n"
    elsif num == -1
      "\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end
end