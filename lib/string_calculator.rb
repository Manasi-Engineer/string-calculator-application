# lib/string_calculator.rb

class StringCalculator
  def add(numbers)
    # String with no delimiter only number
    return numbers.to_i if is_numeric_regex?(numbers)

    delimiters = [",", "\n"]
    # String with delimiters as ', or /\n'
    numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
  end

  def is_numeric_regex?(str)
    return "" if str.empty?
    str.match?(/\A\d+\z/)
  end
end
