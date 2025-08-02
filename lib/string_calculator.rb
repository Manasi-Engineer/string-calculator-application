# lib/string_calculator.rb

class StringCalculator
  def add(numbers)
    return numbers.to_i if is_numeric_regex?(numbers)
  end

  def is_numeric_regex?(str)
    return "" if str.empty?
    str.match?(/\A\d+\z/)
  end
end
